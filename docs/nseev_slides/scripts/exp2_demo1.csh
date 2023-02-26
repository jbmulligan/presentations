#!/bin/csh

cd ~jbm/working/exps/nseev/collect
setenv PROJECT nseev
source ../scripts/set_run.shf tst.3.1 >& /dev/null
vt < exp3_demo.scr >& /dev/null


