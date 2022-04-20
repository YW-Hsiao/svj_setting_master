#!/bin/bash
# Program:
#    This program is to do the Pythia simultaion about SVJ s-channel with CKKW-L merging.
#    Main:numberOfEvents = 20000, Random:seed = 100
#    LHEFInputs:nSubruns = 1, Main:subrun = 0
#    CKKW-L:
#    Merging:doKTMerging = on, Merging:TMS = 10, 20, 30, 100
#    Merging:Process = pp>{xd,4900101}{xd~,-4900101}
#    Merging:mayRemoveDecayProducts = off
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/04/20 First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/test_1"
path_data="/youwei_u3/svj_data_master/test_1"
path_pythia8="$path_setting/pythia8"
path_hepmc="$path_data/hepmc"
path_pythia8245_examples="/root/pythia8245/examples"

# Check your setting and data path!!
# Check your Beams:LHEF path, number of events, and random seed of .cmnd file!!
# Check you have executed "make main89"!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of .cmnd and shell script: $path_pythia8"
echo "Path of .hepmc and .log files: $path_hepmc"
echo "Path of the Pythia examples main89: $path_pythia8245_examples"

cd $path_pythia8245_examples
nohup ./main89 $path_pythia8/svj_ckkwl_tms10_xqcut0.cmnd $path_hepmc/svj_ckkwl_tms10_xqcut0.hepmc > $path_hepmc/svj_ckkwl_tms10_xqcut0.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms10_xqcut5.cmnd $path_hepmc/svj_ckkwl_tms10_xqcut5.hepmc > $path_hepmc/svj_ckkwl_tms10_xqcut5.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms20_xqcut10.cmnd $path_hepmc/svj_ckkwl_tms20_xqcut10.hepmc > $path_hepmc/svj_ckkwl_tms20_xqcut10.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms30_xqcut0.cmnd $path_hepmc/svj_ckkwl_tms30_xqcut0.hepmc > $path_hepmc/svj_ckkwl_tms30_xqcut0.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms30_xqcut20.cmnd $path_hepmc/svj_ckkwl_tms30_xqcut20.hepmc > $path_hepmc/svj_ckkwl_tms30_xqcut20.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms100_xqcut10.cmnd $path_hepmc/svj_ckkwl_tms100_xqcut10.hepmc > $path_hepmc/svj_ckkwl_tms100_xqcut10.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_tms100_xqcut30.cmnd $path_hepmc/svj_ckkwl_tms100_xqcut30.hepmc > $path_hepmc/svj_ckkwl_tms100_xqcut30.log 2>&1 &

echo "*------  Done  ------*"