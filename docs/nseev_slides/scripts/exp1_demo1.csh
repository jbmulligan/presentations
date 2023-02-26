#!/bin/csh

echo STARTING > /tmp/tracefile
cd ~jbm/working/exps/nseev/collect
setenv PROJECT nseev
source ../scripts/set_run.shf tst.2.2d >>& /tmp/tracefile
vt < exp2_demo.scr >>& /tmp/tracefile


