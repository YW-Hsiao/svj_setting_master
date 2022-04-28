#!/bin/bash
# Program:
#    This program is to change PID for s-channel.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/04/28 First release.

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_2"
path_data="/youwei_u3/svj_data_master/scheme_2"
path_lhe="$path_data/s_ckkwl/Events/run_01"

# Check your setting and data path!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of shell scrpit: $path_setting"
echo "Path of data and .log file: $path_data"

echo "Change PID of data"
cd $path_lhe
gzip -d unweighted_events.lhe.gz > $path_data/changePID.log 2>&1
echo "*------  Change PID  ------*" >> $path_data/changePID.log 2>&1
sed -i 's/5000521/4900101/g' unweighted_events.lhe
grep 4900101 unweighted_events.lhe >> $path_data/changePID.log 2>&1

echo "*------  Done  ------*"