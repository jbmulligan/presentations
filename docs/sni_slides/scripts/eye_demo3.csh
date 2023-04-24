#
# do nothing

cd $HOME/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009night  >& /dev/null
setenv SHOWING 1
#setenv eyefile /home/jbm/broca2/data/sni/movies/p9.1009night.reye.jpg
#$QUIP < sort_imgs.scr >& /dev/null
#$QUIP < view_tree.scr >& /dev/null
$QUIP < tree_demo.scr

