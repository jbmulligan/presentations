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

cp $presentation_dir/*.htm $target_dir

# Now copy the images

if [[ -e $presentation_dir/find_media.shf ]]; then
	cd $presentation_dir
	./find_media.shf
	while read filename; do
		parent_dir=`dirname $filename`
		subdir=`basename $parent_dir`
		grandparent_dir=`dirname $parent_dir`
		slide_dir=`basename $grandparent_dir`
		if [[ ! -e ../docs/$slide_dir ]]; then
			mkdir ../docs/$slide_dir
			mkdir ../docs/$slide_dir/$subdir
		elif [[ ! -e ../docs/$slide_dir/$subdir ]]; then
			mkdir ../docs/$slide_dir/$subdir
		fi
		cp $filename ../docs/$slide_dir/$subdir
	done < image_files.txt
fi


