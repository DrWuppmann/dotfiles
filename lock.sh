#!/bin/bash

PCTL="$(playerctl status)"
if [ "${PCTL}" == "Playing" ]; then
  playerctl pause
fi

#Start i3lock (blocking)
i3lock -n -c 000000

#Restart player if playing
if [ "${PCTL}" == "Playing" ]; then
  playerctl play
fi
