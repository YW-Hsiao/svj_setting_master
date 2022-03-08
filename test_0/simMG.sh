#!/bin/bash
# Program:
#     This program is to do the MadGraph simultaion about s-channel with CKKW-L jet merging.
#     Zpxdxdx.txt is with nevents 10000 & 20000, ECM=13 & 14 TeV
#     ickkw 0, xqcut 0.0, ktdurham 20
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/03/07
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_sChCkkwl="/youwei_home/svj_setting_master/test_0"
path_sChCkkwl_2="/youwei_u3/svj_data_master/test_0"
path_MG5v273="/root/MG5_aMC_v2_9_3"  # Where is your mg5_aMC


# Check your .txt file output & launch path, nevents, and ECM!!   ###
echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_sChCkkwl"
echo "Path of MG5: $path_MG5v273"
echo "Path of .txt and .log file: $path_sChCkkwl"

cd $path_MG5v273
nohup ./bin/mg5_aMC $path_sChCkkwl/Zpxdxdx_s_ckkwl_tms20_14_10000.txt > $path_sChCkkwl_2/Zpxdxdx_s_ckkwl_tms20_14_10000.log 2>&1 &
nohup ./bin/mg5_aMC $path_sChCkkwl/Zpxdxdx_s_ckkwl_tms20_14_20000.txt > $path_sChCkkwl_2/Zpxdxdx_s_ckkwl_tms20_14_20000.log 2>&1 &
nohup ./bin/mg5_aMC $path_sChCkkwl/Zpxdxdx_s_ckkwl_tms20_13_20000.txt > $path_sChCkkwl_2/Zpxdxdx_s_ckkwl_tms20_13_20000.log 2>&1 &
