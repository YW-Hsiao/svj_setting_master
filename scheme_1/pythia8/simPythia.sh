#!/bin/bash
# Program:
#    This program is to do the Pythia simultaion about SVJ s-channel with CKKW-L and MLM merging.
#    And it is with and without decays of 4900211/4900213.
#    Main:numberOfEvents = 20000, Random:seed = 100
#    LHEFInputs:nSubruns = 1, Main:subrun = 0
#    CKKW-L:
#    Merging:doKTMerging = on, Merging:TMS = 100
#    Merging:Process = pp>{xd,4900101}{xd~,-4900101}
#    Merging:mayRemoveDecayProducts = off
#    MLM:
#    JetMatching:merge = on, JetMatching:qCut = 100
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/03/10 First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_1"
path_data="/youwei_u3/svj_data_master/scheme_1"
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
nohup ./main89 $path_pythia8/svj_ckkwl_w.cmnd $path_hepmc/svj_ckkwl_w.hepmc > $path_hepmc/svj_ckkwl_w.log 2>&1 &
nohup ./main89 $path_pythia8/svj_ckkwl_wo.cmnd $path_hepmc/svj_ckkwl_wo.hepmc > $path_hepmc/svj_ckkwl_wo.log 2>&1 &
nohup ./main89 $path_pythia8/svj_mlm_w.cmnd $path_hepmc/svj_mlm_w.hepmc > $path_hepmc/svj_mlm_w.log 2>&1 &
nohup ./main89 $path_pythia8/svj_mlm_wo.cmnd $path_hepmc/svj_mlm_wo.hepmc > $path_hepmc/svj_mlm_wo.log 2>&1 &

echo "*------  Done  ------*"
