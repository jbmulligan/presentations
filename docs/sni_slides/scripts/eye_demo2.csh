#
# do nothing

#cd $HOME/working/exps/sni/pupil
cd $HOME/working/exps/sni/catalog
setenv PROJECT sni
source ../scripts/set_run.shf p9.1009night  >& /dev/null
setenv SHOWING 1
#setenv eyefile /home/jbm/broca2/data/sni/movies/p9.1009night.reye.jpg
setenv eyefile $HOME/working/exp_data/sni/movies/p9.1009night.reye.jpg
#$QUIP < sort_imgs.scr # >& /dev/null
$QUIP 0.95 X < sort_imgs.scr # >& /dev/null
