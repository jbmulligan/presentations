#!/bin/csh
cd ~/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009night
jpsee groups.$RUN_STEM.jpg

