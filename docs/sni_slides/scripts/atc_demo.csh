#!/bin/csh

cd $HOME/exps/atc/collect

atc < demo1.scr
atc < demo2.scr

cd $HOME/working/env/atc

atc < click_model_demo.scr
atc < auto_model_demo.scr

