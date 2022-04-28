#!/bin/bash
# Program:
#    This program is to do the MadGraph simulation about s-channel with CKKW-L jet merging.
#    Zpxdxdx_s.txt is nevents 20000 and ECM = 13 TeV,
#    ickkw 0, xqcut 0.0, ktdurham 100
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/04/28 First release.

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_2"
path_data="/youwei_u3/svj_data_master/scheme_2"
path_MG5v293="/root/MG5_aMC_v2_9_3"  # Where is your mg5_aMC

# Check your setting and data path!!
# Check your output & launch path, nevents, and ECM of .txt file!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of .txt and shell scrpit: $path_setting"
echo "Path of data and .log file: $path_data"
echo "Path of MadGraph5: $path_MG5v293"

cd $path_MG5v293
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s.txt > $path_data/Zpxdxdx_s.log 2>&1 &

echo "*------  Done  ------*"