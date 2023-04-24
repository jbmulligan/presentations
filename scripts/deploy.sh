#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: ./scripts/deploy.sh <presentation_dir>"
	exit 1
fi

presentation_dir=$1

if [[ ! -e $presentation_dir ]]; then
	echo "Presentation dir $presentation_dir does not exist"
	exit 1
fi

target_dir=docs/$presentation_dir
if [[ ! -e $target_dir ]]; then
	echo "Creating target dir $target_dir"
	mkdir $target_dir
fi

cp $presentation_dir/*.htm* $target_dir

# We used to copy the images, but now they live there and we use a symlink

