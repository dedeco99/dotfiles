#!/bin/sh

site=$1

status=$(curl -I -s --connect-timeout 10 $site | grep HTTP)

if [[ $status == *"200"* ]]; then
	echo "good"
  exit 0
else
	notify-send "$site is down"
	echo "bad"
	exit 32
fi


