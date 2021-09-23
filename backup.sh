#!/bin/bash

#load settings
source ./config.cfg
#show configuration
# echo "TMP: " $tmp
# echo "storage: " $storage
# echo "datum: " $datum
# exit
# create temporary storage
mkdir -p $tmp
mkdir -p $storage
# switch to working dir
cd /mnt

# loop through every subfolder


# for d in */ ; do
#     [ -L "${d%/}" ] && continue
#     echo "$d"
# done

# broken. ._.
find . -maxdepth 1 -mindepth 1 -type d -exec bash -c 'echo {} &&\
  echo rm $storage/{}.tar && \
  tar cfW $tmp/{}.tar {} && \
  echo cp $tmp/{}.tar $storage/{}.tar && \
  mkdir -p $storage/{} && \
  echo cp $tmp/{}.tar $storage/archive/{}/$datum.tar && \
  echo rm -rf $tmp' \;