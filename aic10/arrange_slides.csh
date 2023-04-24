#!/bin/csh

# this is an extra comment

set top=aic09_contents
set title='Spatial disorientation and space flight'

set slide_dir=../nseev_slides

# first check and see that no slides are duplicated...
# if we want to use a slide in multiple positions, we will have
# to rename it, but for now we don't allow that...

# BUG using grep means that no slide name can be a substring of another slide name!?

foreach slide ( `cat slide_order` )
  set n=`grep $slide slide_order | wc -l`
  if( $n != 1 ) then
    echo Warning:  it looks like slide $slide has been used $n times
  endif
end

set n=`cat slide_order | wc -l`
echo n = $n

set i=1
set prev=1
set next=2
while( $i <= $n )

  if( $i > 1 ) then
    @ prev = $i - 1
  endif
  @ next = $i + 1
  if( $next > $n ) set next=$n

  set this_file=`head -$i slide_order | tail -1`
  set prev_file=`head -$prev slide_order | tail -1`
  set next_file=`head -$next slide_order | tail -1`

  if( $i == 1 ) set first_page=$this_file
  if( $i == $n ) set last_page=$this_file

  echo "this_file = $this_file     prev_file = $prev_file    next_file = $next_file"

  echo s/UP_PAGE/$top/ > sub.sed
  echo s/BACK_PAGE/$prev_file/ >> sub.sed
  echo s/NEXT_PAGE/$next_file/ >> sub.sed
  echo s/PAGE_TITLE/$this_file/ >> sub.sed

  sed -f sub.sed < $slide_dir/html/$this_file.htm > $this_file.htm

  @ i ++
end

/bin/rm sub.sed

set first=`head -1 slide_order`
if( -e index.html ) /bin/rm index.html
ln $first.htm index.html

