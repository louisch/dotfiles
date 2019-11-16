#!/bin/bash


convert() {
  find * -name '*.jpg' -exec convert -strip -sampling-factor 4:2:0 -interlace JPEG -colorspace RGB -quality 85% {} ../converted-images/{} \;
}

while true; do
  read -p "Warning! If the current directory contains files with leading dash or dot, this will be fed to `find` as a flag! Only use when all files under the current directory have been checked! Do you wish to proceed?" yn
  case $yn in
    [Yy]* ) convert; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer y[es] or n[o].";;
  esac
done
