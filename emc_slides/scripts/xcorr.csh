#!/bin/csh
cd $HOME/working/exps/pulfrich/eyemov
setenv PROJECT pulfrich
setenv DEBUG_LEVEL 1
setenv EYE_CAMERA_INDEX 0
source ../scripts/set_run.shf jbm.9.1
#setenv CHATTY 1
$QUIP < exp9_demo.scr # >& /tmp/xcorr_out # >& /dev/null
#$QUIP < exp9_demo.scr

