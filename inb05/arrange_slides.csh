#!/bin/csh

# this is an extra comment

set top=cvpr04_contents
set title='Surface determination by photometric ranging'
set slide_dir1=../ranging_slides/html
set slide_dir2=../galvo_slides/html


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

  if( -e $slide_dir1/$this_file.htm ) then
    set infile=$slide_dir1/$this_file.htm
  else if( -e $slide_dir2/$this_file.htm ) then
    set infile=$slide_dir2/$this_file.htm
  else
    echo WARNING:  file $this_file.htm not found in $slide_dir1 or $slide_dir2
    set infile=/dev/null
  endif
  sed -f sub.sed < $infile > $this_file.htm

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
sed -f sub.sed < $slide_dir1/contents_skeleton1.htm > $top.htm

while( $i <= $n_left )
  set this_file=`head -$i slide_order | tail -1`
  echo '<p><b><font size=+3><a href="' $this_file.htm '">' $this_file '</a></font></b>' >> $top.htm
  @ i ++
end
cat $slide_dir1/contents_skeleton2.htm >> $top.htm
while( $i <= $n )
  set this_file=`head -$i slide_order | tail -1`
  echo '<p><b><font size=+3><a href="' $this_file.htm '">' $this_file '</a></font></b>' >> $top.htm
  @ i ++
end
cat $slide_dir1/contents_skeleton3.htm >> $top.htm

/bin/rm sub.sed

