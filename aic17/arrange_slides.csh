#!/bin/csh

# This file allows BRANCH links in a file.
# The strategy is this:
# The source page can contain a BRANCH tag within the body,
# like we already do with NEXT and PREV.  This will redirect
# to another page, which is listed in a later section of the file.
# We cache the page containing the BRANCH directive...
set branch_cache=/tmp/branches
set tmp_page=/tmp/page.htm

# this is an extra comment

set top=aic17_contents
set title='Measuring and Modeling Shared Visual Attention'

set slide_dir=../calg_slides

# first check and see that no slides are duplicated...
# if we want to use a slide in multiple positions, we will have
# to rename it, but for now we don't allow that...

# BUG using grep means that no slide name can be a substring of another slide name!?

/bin/rm -f *.htm

foreach slide ( `cat slide_order | grep -v BRANCH` )
  set n=`grep $slide slide_order | wc -l`
  if( $n != 1 ) then
    echo Warning:  it looks like slide $slide has been used $n times
  endif
end

set n_lines=`cat slide_order | wc -l`
set n_slides=`cat slide_order | grep -v BRANCH | wc -l`
echo $n_lines lines, $n_slides slides

set i_branch=1
set i_slide=1
set i_line=1
set next=2
set prev_file=`head -1 slide_order`
while( $i_line <= $n_lines )

  @ next = $i_line + 1
  if( $next > $n_lines ) set next=$n_lines

  # get this line
  set this_line=`head -$i_line slide_order | tail -1`
  set is_branch=`echo $this_line | grep BRANCH | wc -l`
#echo This line is $this_line, is_branch = $is_branch, slide = $i_slide, line = $i_line
  if( ! $is_branch ) then
    set this_file=`head -$i_line slide_order | tail -1`

    set next_file=`head -$next slide_order | tail -1`
    set next_is_branch=`echo $next_file | grep BRANCH | wc -l`
    if( $next_is_branch ) then
      echo Next line is a branch
      set next_is_insert=`echo $next_file | grep INSERT | wc -l`
      set next_is_end=`echo $next_file | grep END | wc -l`
      if( $next_is_insert ) then
        @ next ++
        set next_file=`head -$next slide_order | tail -1`
      else if( $next_is_end ) then
        set branch_data=`head -$i_branch $branch_cache | tail -1`
        set next_file=$branch_data[2]
        echo branch_data = $branch_data, next_file = $next_file
      else
        set next_file=$this_file
      endif
    endif

    if( $i_slide == 1 ) set first_page=$this_file
    if( $i_slide == $n_slides ) set last_page=$this_file

    #echo "this_file = $this_file     prev_file = $prev_file    next_file = $next_file"

    echo s/UP_PAGE/$top/ > sub.sed
    echo s/BACK_PAGE/$prev_file/ >> sub.sed
    echo s/NEXT_PAGE/$next_file/ >> sub.sed
    echo s/PAGE_TITLE/$this_file/ >> sub.sed
    # BUG - subst branches too!

    sed -f sub.sed < $slide_dir/html/$this_file.htm > $this_file.htm

    set prev_file=$this_file

    @ i_slide ++
  else if( $this_line == INSERT_BRANCH ) then
    set next_file=`head -$next slide_order | tail -1`
    echo $prev_file $next_file >> $branch_cache
    #echo Do not know how to handle branch directive
  else if( $this_line == BEGIN_BRANCH ) then
    # We have to reset prev to the slide
    # before where the branch was inserted
    set branch_data=`head -$i_branch $branch_cache | tail -1`
    set prev_file=$branch_data[1]
    echo branch_data = $branch_data, prev_file = $prev_file
    # this is also a good place to substitute the branch target,
    # which is in the next line
    set i_start=$i_line
    @ i_start ++
    set branch_file=`head -$i_start slide_order | tail -1`
    echo s/BRANCH/$branch_file/ > sub.sed
    sed -f sub.sed < $prev_file.htm > $tmp_page
    mv $tmp_page $prev_file.htm
  else if( $this_line == END_BRANCH ) then
    # Not tested whether this works for multiple branches...
    # This strategy only works for one branch insertion per page.
    @ i_branch ++
  else
    echo Error - unhandled branch directive:  $this_line
    exit
  endif
  @ i_line ++
end

/bin/rm sub.sed

#chmod -w *.htm

set first=`head -1 slide_order`
if( -e index.html ) /bin/rm -f index.html
ln $first.htm index.html


if( -e $branch_cache ) then
  echo Contents of branch cache:
  cat $branch_cache
  /bin/rm $branch_cache
endif

if( -e $tmp_page ) then
  /bin/rm $tmp_page
endif


