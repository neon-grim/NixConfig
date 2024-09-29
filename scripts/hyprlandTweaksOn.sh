#!/usr/bin/env bash

adaptiveSync="0"
bitdepth=""
cursor="false";
directScanout="true"
maxRefreshRate="120.00"
variableFrameRate="true"

while getopts ":abdmv" opt; do
  case $opt in
    a)
      adaptiveSync="2"
      ;;
    b)
      bitdepth="bitdepth, 10"
      ;;
    d)
      directScanout="true"
      ;;
    m)
      maxRefreshRate="240.00"
      ;;
    v)
      variableFrameRate="false"
      ;;
    ?)
      echo 'Unknown paramter'
      exit 1
      ;;
  esac
done

if [ $adaptiveSync == "2" ]
then
  cursor="true"
fi

hyprctl --batch "\
  keyword animations:enabled false; \
  keyword decoration:blur:enabled false; \
  keyword decoration:drop_shadow false; \
  keyword cursor:min_refresh_rate 0; \
  keyword cursor:no_hardware_cursors ${cursor}; \
  keyword cursor:no_break_fs_vrr ${cursor}; \
  keyword general:allow_tearing true; \
  keyword misc:vfr ${variableFrameRate}; \
  keyword render:direct_scanout ${directScanout}; \
  keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@${maxRefreshRate}, 1440x640, 1, vrr, ${adaptiveSync}, ${bitdepth};"

sleep 10s