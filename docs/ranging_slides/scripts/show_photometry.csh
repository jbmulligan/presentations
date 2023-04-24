#

cd $HOME/working/public_html/home/presentations/ranging_slides/movies
xine -g -pq -G 640x480+300+150 photometry_demo.mpg >& /dev/null

echo xine done
cd $HOME/working/exps/photometry
source set_run.shf xav6
vt < 2_play_demo.scr >& /dev/null

exit

