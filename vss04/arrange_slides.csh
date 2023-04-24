#!/bin/csh

# this is an extra comment

set top=vss04_contents
set title='Polarization analysis of the eye-movement correlogram'

set slide_dir=emc_slides/html

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

  sed -f sub.sed < ../$slide_dir/$this_file.html > $this_file.html

  @ i ++
end

# now make the table of contents

set n_right=1
@ n_right = $n / 2
set n_left=1
@ n_left = $n - $n_right

echo s/TALK_TITLE/$title/ > sub.sed
echo s/PAGE_TITLE/$title/ >> sub.sed
echo s/UP_PAGE/$top/ >> sub.sed
echo s/BACK_PAGE/$last_page/ >> sub.sed
echo s/NEXT_PAGE/$first_page/ >> sub.sed
echo s/TOP_PAGE/$top/ >> sub.sed

set i=1
sed -f sub.sed < ../$slide_dir/contents_skeleton1.html > $top.html

while( $i <= $n_left )
  set this_file=`head -$i slide_order | tail -1`
  echo '<p><b><font size=+3><a href="' $this_file.html '">' $this_file '</a></font></b>' >> $top.html
  @ i ++
end
cat ../$slide_dir/contents_skeleton2.html >> $top.html
while( $i <= $n )
  set this_file=`head -$i slide_order | tail -1`
  echo '<p><b><font size=+3><a href="' $this_file.html '">' $this_file '</a></font></b>' >> $top.html
  @ i ++
end
cat ../$slide_dir/contents_skeleton3.html >> $top.html


