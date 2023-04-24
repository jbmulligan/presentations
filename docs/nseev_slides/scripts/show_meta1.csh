#!/bin/csh

cd ~jbm/working/public_html/home/presentations/nseev_slides/scripts
vt ../images/lit_survey2.png "RT_vs_eccentricity" 100 400 < show_image.scr &
sleep 1
vt ../images/lit_survey1.png "Error_rate_vs_eccentricity" 100 30 < show_image.scr &

