#!/usr/bin/env bash

refreshRate=240

while getopts ":r" opt; do
  case $opt in
    r)
      refreshRate=120
      ;;
    ?)
      echo 'Unknown paramter'
      exit 1
      ;;
  esac
done

hyprctl --batch "\
  keyword animations:enabled false; \
  keyword decoration:blur:enabled false; \
  keyword decoration:drop_shadow false; \
  keyword cursor:min_refresh_rate 0; \
  keyword cursor:no_hardware_cursors true; \
  keyword cursor:no_break_fs_vrr true; \
  keyword general:allow_tearing true; \
  keyword render:direct_scanout true; \
  keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@${refreshRate}, 1440x640, 1, vrr, 2, bitdepth, 10;"

sleep 20s