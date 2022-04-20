#!/bin/bash
# Program:
#    This program is to do the MadGraph simulation about s-channel with CKKW-L jet merging.
#    Zpxdxdx_s_ckkwl.txt is nevents 20000, ECM = 13 TeV,
#    ickkw 0, ktdurham 10(xqcut 0/5)/ 20(xqcut 10)/ 30(xqcut 0/20)/ 100(xqcut 10/30)
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/04/10 First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/test_1"
path_data="/youwei_u3/svj_data_master/test_1"
path_MG5v293="/root/MG5_aMC_v2_9_3"  # Where is your mg5_aMC

# Check your setting and data path!!
# Check your output & launch path, nevents, and ECM of .txt file!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of .txt and shell scrpit: $path_setting"
echo "Path of data and .log file: $path_data"
echo "Path of MadGraph5: $path_MG5v293"

cd $path_MG5v293
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms10_xqcut0.txt > $path_data/Zpxdxdx_s_ckkwl_tms10_xqcut0.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms10_xqcut5.txt > $path_data/Zpxdxdx_s_ckkwl_tms10_xqcut5.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms20_xqcut10.txt > $path_data/Zpxdxdx_s_ckkwl_tms20_xqcut10.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms30_xqcut0.txt > $path_data/Zpxdxdx_s_ckkwl_tms30_xqcut0.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms30_xqcut20.txt > $path_data/Zpxdxdx_s_ckkwl_tms30_xqcut20.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms100_xqcut10.txt > $path_data/Zpxdxdx_s_ckkwl_tms100_xqcut10.log 2>&1 &
nohup python3 ./bin/mg5_aMC $path_setting/Zpxdxdx_s_ckkwl_tms100_xqcut30.txt > $path_data/Zpxdxdx_s_ckkwl_tms100_xqcut30.log 2>&1 &

echo "*------  Done  ------*"