#!/bin/csh

cd $HOME/exps/uhco02/eyemov
setenv PROJECT uhco02
setenv EYE_CAMERA_INDEX 2
setenv DEBUG_LEVEL 0
source ../scripts/set_run.shf jbm.7.1
setenv NO_SHOW_PARAMS 1
setenv NO_SHOW_DIM 1
#setenv SHOW_CONTRAST 1
$QUIP x < show_curves2.scr
$QUIP y < show_curves2.scr
setenv EYE_CAMERA_INDEX 3
$QUIP x < show_curves2.scr
$QUIP y < show_curves2.scr

$QUIP jbm < plot7.scr
$QUIP sbs < plot7.scr
$QUIP fev < plot7.scr

