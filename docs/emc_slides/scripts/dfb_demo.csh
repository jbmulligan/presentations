#!/bin/csh

cd $HOME/working/presentations/emc_slides/scripts
$QUIP < dfb.scr # >& /dev/null

#setenv HIDE_BG
#$QUIP < plot_dfb.scr # >& /dev/null

#echo get_demo_spectra.scr BEGIN
#setenv PLOTTING 1
#$QUIP < get_demo_spectra.scr # >& /tmp/demo_spectra_errors

