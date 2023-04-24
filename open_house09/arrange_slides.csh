#!/bin/csh

# this is an extra comment

set top=galvo_contents
set title='Implicit calibration of a remomte gaze tracker'

#set slide_dir=../galvo_slides/html


# first check and see that no slides are duplicated...
# if we want to use a slide in multiple positions, we will have
# to rename it, but for now we don't allow that...

# BUG using grep means that no slide name can be a substring of another slide name!?

set slide_list=`cat slide_order`
set n=$#slide_list

set i=2
while( $i < $n )
  set slide=$slide_list[$i]
  set n=`grep $slide slide_order | wc -l`
  if( $n != 1 ) then
    echo Warning:  it looks like slide $slide has been used $n times
  endif
  @ i += 2
end

set n_slides=`cat slide_order | wc -l`
echo n_slides = $n_slides
echo SLIDES:  $slide_list

set i_slide=1
set prev=1
set next=2
set i=1
while( $i_slide <= $n_slides )
  set slide_dir=../$slide_list[$i]/html
  @ i ++
  set slide_file=$slide_list[$i]
  @ i ++
  echo i = $i    slide_dir = $slide_dir   slide_file = $slide_file

  if( $i_slide > 1 ) then
    @ prev = $i_slide - 1
  endif
  @ next = $i_slide + 1
  if( $next > $n_slides ) set next=$n_slides

  set this_file=`head -$i_slide slide_order | dm s2 | tail -1`
  set prev_file=`head -$prev slide_order | dm s2 | tail -1`
  set next_file=`head -$next slide_order | dm s2 | tail -1`

  if( $i_slide == 1 ) set first_page=$this_file
  if( $i_slide == $n_slides ) set last_page=$this_file

  #echo "this_file = $this_file     prev_file = $prev_file    next_file = $next_file"

  echo s/UP_PAGE/$top/ > sub.sed
  echo s/BACK_PAGE/$prev_file/ >> sub.sed
  echo s/NEXT_PAGE/$next_file/ >> sub.sed
  echo s/PAGE_TITLE/$this_file/ >> sub.sed

  sed -f sub.sed < $slide_dir/$this_file.htm > $this_file.htm

  @ i_slide ++
end

/bin/rm sub.sed


