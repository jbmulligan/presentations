#!/bin/csh
cd ~/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009night
$QUIP E < view_tree3.scr #>& /dev/null

