#!/bin/csh

# We have to install the signal file...
#set echo

cd $HOME/exps/pulfrich/demos

setenv PROJECT pulfrich
setenv DEBUG_LEVEL 0
setenv EYE_CAMERA_INDEX 0
source ../scripts/set_run.shf jbm.9.1
#$QUIP < color.scr >& /dev/null
$QUIP < color.scr  # >& /tmp/quip_errors

