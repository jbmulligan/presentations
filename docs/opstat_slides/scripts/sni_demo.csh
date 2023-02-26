#!/bin/csh

cd $HOME/working/exps/sni/navigator
setenv PROJECT sni
setenv DEBUG_LEVEL 1
source ../scripts/set_run.shf p9.1009day
vt < beta.scr >& /tmp/vterrs

