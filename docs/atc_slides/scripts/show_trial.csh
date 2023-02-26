#!/bin/csh

# show some recordings

#ed atc
setenv PROJECT atc
cd ~/exps/$PROJECT

cd ncalib
setenv DEBUG_LEVEL 1
#setrun jbm.1.8
source ../scripts/set_run.shf jbm.1.8
#source ../scripts/set_run.shf jbm.1.7

#atc 1 < vis_trial.scr
atc 1 < vis_trial.scr 


