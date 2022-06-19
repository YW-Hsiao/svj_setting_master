#!/bin/bash
# Program:
#    This program is to test Z boson background.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/06/15 First release.

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/test_background/Z_jets"
path_data="/youwei_u3/svj_data_master/test_background/Z_jets"
path_MG5v273="/root/MG5_aMC_v2_7_3"  # Where is your mg5_aMC

# Check your setting and data path!!
# Check your output & launch path, nevents, and ECM of .txt file!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of MadGraph5: $path_MG5v273"
echo "pp to Z"

cd $path_MG5v273
nohup python ./bin/mg5_aMC $path_setting/proc_z.txt > $path_data/proc_z.log 2>&1 &
nohup python ./bin/mg5_aMC $path_setting/proc_z_lplm.txt > $path_data/proc_z_lplm.log 2>&1 &
nohup python ./bin/mg5_aMC $path_setting/proc_lplm.txt > $path_data/proc_lplm.log 2>&1 &

echo "*------  Done  ------*"
