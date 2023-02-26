#!/bin/csh

echo Type ENTER to run info with logging...
set x=$<

ginfo --dribblelog foo

echo Type ENTER to view log file...
set x=$<

more foo

echo Type ENTER to replay log file...
set x=$<

ginfo --replay foo

