#!/bin/bash

# run this from this directory
# BUG - should use symlinks instead of copies

cp -p ./*.htm ../docs/uci23
cp -pR ../datalit_slides/images/* ../docs/datalit_slides/images

