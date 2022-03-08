#!/bin/bash
# Program:
#     This program is to change PID for s-channel.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/03/07
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_sChCkkwl="/youwei_u3/svj_data_master/test_0"
path_lhe_1="$path_sChCkkwl/s_ckkwl_tms20_14_10000/Events/run_01"
path_lhe_2="$path_sChCkkwl/s_ckkwl_tms20_14_20000/Events/run_01"
path_lhe_3="$path_sChCkkwl/s_ckkwl_tms20_13_20000/Events/run_01"


echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_sChCkkwl"
echo "Path of .log file: $path_sChCkkwl"

cd $path_lhe_1
gzip -d unweighted_events.lhe.gz > $path_sChCkkwl/changePID_14_10000.log 2>&1
echo "------Change PID------" >> $path_sChCkkwl/changePID_14_10000.log 2>&1
sed -i 's/5000521/4900101/g' unweighted_events.lhe
grep 4900101 unweighted_events.lhe >> $path_sChCkkwl/changePID_14_10000.log 2>&1

cd $path_lhe_2
gzip -d unweighted_events.lhe.gz > $path_sChCkkwl/changePID_14_20000.log 2>&1
echo "------Change PID------" >> $path_sChCkkwl/changePID_14_20000.log 2>&1
sed -i 's/5000521/4900101/g' unweighted_events.lhe
grep 4900101 unweighted_events.lhe >> $path_sChCkkwl/changePID_14_20000.log 2>&1

cd $path_lhe_3
gzip -d unweighted_events.lhe.gz > $path_sChCkkwl/changePID_13_20000.log 2>&1
echo "------Change PID------" >> $path_sChCkkwl/changePID_13_20000.log 2>&1
sed -i 's/5000521/4900101/g' unweighted_events.lhe
grep 4900101 unweighted_events.lhe >> $path_sChCkkwl/changePID_13_20000.log 2>&1
