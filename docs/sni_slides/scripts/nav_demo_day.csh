#
# do nothing

cd $HOME/working/exps/sni/navigator
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009day >& /dev/null
$QUIP < beta.scr # >& /tmp/sni_errs

#
#cd $HOME/working/exps/sni/demo
#$QUIP < show_eyes.scr >& /dev/null



