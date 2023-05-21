#!/bin/csh

cd $HOME/working/experiments/uhco13/stimuli
setenv DEFAULT_PLATFORM Apple
setenv DEFAULT_GPU Iris
$QUIP < fdm_demos.scr # >& /tmp/fdm_output
exit

