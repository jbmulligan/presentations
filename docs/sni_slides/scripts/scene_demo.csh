#
# do nothing

cd $HOME/working/exps/sni/headpose_mosaic
setenv PROJECT sni
setenv DEBUG 1
source ../scripts/set_run.shf p9.1009day >& /dev/null
coq < mosaic_demo.scr # >& /dev/null

