#!/bin/bash

dlist=(`ls | grep -v _slides | grep -v README.md | grep -v scripts`)

for d in ${dlist[@]}; do
	echo "d = $d"
	if [[ ! -e $d/.gitignore ]]; then
		echo '*.htm*' > $d/.gitignore
	fi
	if [[ -e $d/arrange_slides.csh ]]; then
		pushd $d
		./arrange_slides.csh
		popd
	fi
done

