#!/bin/csh

cd $HOME/working/experiments/uhco13/stimuli
setenv DEFAULT_PLATFORM Apple
#setenv DEFAULT_GPU Iris	# for mac mini?

# silverhawk laptop
setenv DEFAULT_GPU AMD_Radeon_Pro_555_Compute_Engine

$QUIP < fdm_demos.scr # >& /tmp/fdm_output
exit

