#!/usr/bin/env python3

import urllib.request
import urllib.parse
import xml.etree.ElementTree as ET
import sys

PLEX_URL = "http://127.0.0.1:32400"
TOKEN = "JXgaKjC65Wqj44_JFpfz"
SECTION_ID = "3"
PLAYLIST_NAME = "Fofinhos"
M3U_FILE = "/home/dedeco99/Music/Playlists/Fofinhos  __.m3u8"

def plex_get(path):
    url = f"{PLEX_URL}{path}"
    if "?" in url:
        url += f"&X-Plex-Token={TOKEN}"
    else:
        url += f"?X-Plex-Token={TOKEN}"
    with urllib.request.urlopen(url) as r:
        return r.read().decode()

def plex_post(path):
    url = f"{PLEX_URL}{path}"
    if "?" in url:
        url += f"&X-Plex-Token={TOKEN}"
    else:
        url += f"?X-Plex-Token={TOKEN}"
    req = urllib.request.Request(url, method="POST")
    with urllib.request.urlopen(req) as r:
        return r.read().decode()

# Step 1: Get machine identifier
print("Connecting to Plex...")
root_xml = plex_get("/")
root = ET.fromstring(root_xml)
machine_id = root.attrib.get("machineIdentifier")
print(f"Machine ID: {machine_id}")

# Step 2: Read m3u8 and extract file paths
print(f"Reading playlist from {M3U_FILE}...")
songs = []
with open(M3U_FILE, "r", encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if line and not line.startswith("#"):
            songs.append(line)
print(f"Found {len(songs)} songs in playlist")

# Step 3: Get all tracks from Plex and build a filename->ratingKey map
print("Loading all tracks from Plex (this may take a moment)...")
filename_map = {}
page_size = 500
offset = 0
while True:
    tracks_xml = plex_get(f"/library/sections/{SECTION_ID}/all?type=10&X-Plex-Container-Start={offset}&X-Plex-Container-Size={page_size}")
    tree = ET.fromstring(tracks_xml)
    tracks = tree.findall(".//Track")
    if not tracks:
        break
    for track in tracks:
        for part in track.findall(".//Part"):
            filepath = part.attrib.get("file", "")
            filename = filepath.split("/")[-1].lower()
            rating_key = track.attrib.get("ratingKey")
            if filename and rating_key:
                filename_map[filename] = rating_key
                filename_map[filepath.lower()] = rating_key
    offset += len(tracks)
    print(f"  Loaded {offset} tracks so far...")
    if len(tracks) < page_size:
        break

print(f"Loaded {len(filename_map) // 2} tracks from Plex")

# Step 4: Match songs from playlist to Plex tracks
found_keys = []
missing = []

for song_path in songs:
    filename = song_path.split("/")[-1].lower()
    song_path_lower = song_path.lower()

    key = filename_map.get(filename) or filename_map.get(song_path_lower)

    if key:
        found_keys.append(key)
        print(f"✓ {filename}")
    else:
        missing.append(song_path)
        print(f"✗ NOT FOUND: {filename}")

print(f"\nMatched {len(found_keys)}/{len(songs)} tracks")
if missing:
    print(f"Missing {len(missing)} tracks:")
    for m in missing:
        print(f"  - {m}")

if not found_keys:
    print("No tracks matched, aborting.")
    sys.exit(1)

# Step 5: Check if playlist already exists
print(f"\nChecking if playlist '{PLAYLIST_NAME}' already exists...")
playlists_xml = plex_get("/playlists?playlistType=audio")
playlists_tree = ET.fromstring(playlists_xml)
existing_playlist = next(
    (p for p in playlists_tree.findall(".//Playlist")
     if p.attrib.get("title") == PLAYLIST_NAME),
    None
)

if existing_playlist is not None:
    playlist_key = existing_playlist.attrib.get("ratingKey")
    print(f"Playlist exists (key: {playlist_key}), clearing and repopulating...")
    # Delete all existing items
    req = urllib.request.Request(
        f"{PLEX_URL}/playlists/{playlist_key}/items?X-Plex-Token={TOKEN}",
        method="DELETE"
    )
    with urllib.request.urlopen(req) as r:
        r.read()
    # Add all tracks
    all_keys = ",".join(found_keys)
    uri = f"server://{machine_id}/com.plexapp.plugins.library/library/metadata/{all_keys}"
    encoded_uri = urllib.parse.quote(uri)
    req = urllib.request.Request(
        f"{PLEX_URL}/playlists/{playlist_key}/items?uri={encoded_uri}&X-Plex-Token={TOKEN}",
        method="PUT"
    )
    with urllib.request.urlopen(req) as r:
        r.read()
    print(f"\n✅ Done! '{PLAYLIST_NAME}' updated with {len(found_keys)} tracks.")
else:
    # Create new playlist
    print(f"Playlist not found, creating...")
    encoded_name = urllib.parse.quote(PLAYLIST_NAME)
    uri = f"server://{machine_id}/com.plexapp.plugins.library/library/metadata/{found_keys[0]}"
    encoded_uri = urllib.parse.quote(uri)
    create_response = plex_post(f"/playlists?type=audio&title={encoded_name}&smart=0&uri={encoded_uri}")
    tree = ET.fromstring(create_response)
    playlist = tree.find(".//Playlist")
    if playlist is None:
        print("Failed to create playlist!")
        print(create_response)
        sys.exit(1)
    playlist_key = playlist.attrib.get("ratingKey")
    # Add remaining tracks
    if len(found_keys) > 1:
        remaining_keys = ",".join(found_keys[1:])
        uri = f"server://{machine_id}/com.plexapp.plugins.library/library/metadata/{remaining_keys}"
        encoded_uri = urllib.parse.quote(uri)
        req = urllib.request.Request(
            f"{PLEX_URL}/playlists/{playlist_key}/items?uri={encoded_uri}&X-Plex-Token={TOKEN}",
            method="PUT"
        )
        with urllib.request.urlopen(req) as r:
            r.read()
    print(f"\n✅ Done! '{PLAYLIST_NAME}' created with {len(found_keys)} tracks.")

print("Check Plex under Playlists in the sidebar.")
