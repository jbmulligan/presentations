#!/bin/csh
cd ~/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009day
jpsee groups.$RUN_STEM.jpg

