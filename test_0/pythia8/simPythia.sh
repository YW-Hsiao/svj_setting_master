#!/bin/bash
# Program:
#     This program is to do the Pythia simultaion about s-channel with CKKW-L.
#     I copy my s-ch. .cmnd https://github.com/YW-Hsiao/SVJ/blob/main/Tutorial_v2/DelPy_cmnd/rinv03/test0_2.cmnd
#     Main:numberOfEvents = 10000 & 20000, Random:seed = 100
#     Merging:doKTMerging = on, Merging:Process = pp>{xd,4900101}{xd~,-4900101}
#     Merging:mayRemoveDecayProducts = off
#     Merging:TMS = 20
#     LHEFInputs:nSubruns = 1, Main:subrun = 0
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/03/07
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_sChCkkwl="/youwei_home/svj_setting_master/test_0"
path_sChCkkwl_2="/youwei_u3/svj_data_master/test_0/hepmc"
path_hepmc="$path_sChCkkwl/pythia8"
path_examples="/root/pythia8245/examples"


# Check your .cmnd file Beams:LHEF path, number of events, and random seed!!   ###
# Check you have executed "make main89"!!
echo "Start Running"
echo "date: $now"
echo "Path of script: $path_hepmc"
echo "Path of Pythia examples main89: $path_examples"
echo "Path of .cmnd, .log, and .hepmc files: $path_hepmc"

cd $path_examples
nohup ./main89 $path_hepmc/svj_ckkwl_14_10000.cmnd $path_sChCkkwl_2/svj_ckkwl_14_10000.hepmc > $path_sChCkkwl_2/svj_ckkwl_14_10000.log 2>&1 &
nohup ./main89 $path_hepmc/svj_ckkwl_14_20000.cmnd $path_sChCkkwl_2/svj_ckkwl_14_20000.hepmc > $path_sChCkkwl_2/svj_ckkwl_14_20000.log 2>&1 &
nohup ./main89 $path_hepmc/svj_ckkwl_13_20000.cmnd $path_sChCkkwl_2/svj_ckkwl_13_20000.hepmc > $path_sChCkkwl_2/svj_ckkwl_13_20000.log 2>&1 &
