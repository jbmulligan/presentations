#!/bin/csh

set s=/tmp/sftp_script.$$
cat < /dev/null > $s

echo cd working/public_html/home/presentations/sni_slides/images > $s

foreach file ( `cat filelist.asc` )
  echo get $file >> $s
end

sftp -b $s jbm@broca.arc.nasa.gov

/bin/rm $s

