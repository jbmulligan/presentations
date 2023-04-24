#!/bin/csh

cd $HOME/working/exps/uhco13/stimuli
setenv DEFAULT_PLATFORM Apple
setenv DEFAULT_GPU Iris
$QUIP < fdm_demos.scr # >& /tmp/fdm_output
exit

