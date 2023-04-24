#!/bin/csh
cd ~jbm/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009night >& /tmp/script_errors
setenv SHOWING 1
$QUIP framelists/frame_list.A.1.$RUN_STEM.asc < edit_model.scr >>& /tmp/script_errors

