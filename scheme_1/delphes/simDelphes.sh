#!/bin/bash
# Program:
#    This program is to do the Delphes simultaion about s-channel with CKKW-L and MLM merging.
#    I use the /root/Delphes-3.4.2/cards/delphes_card_ATLAS.tcl
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2022/03/10 First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_1"
path_data="/youwei_u3/svj_data_master/scheme_1"
path_delphes="$path_setting/delphes"
path_tcl_cards="/root/Delphes-3.4.2/cards"
path_hepmc="$path_data/hepmc"
path_root="$path_data/root"
path_Delphes342="/root/Delphes-3.4.2"

# Check your setting and data path!!
# Check your .tcl file!!
# Check you have executed "make"!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of shell script: $path_delphes"
echo "Path of .tcl file: $path_tcl_cards"
echo "Path of .hepmc file: $path_hepmc"
echo "Path of .root and .log files: $path_root"
echo "Path of Delphes DelphesHepMC: $path_Delphes342"

cd $path_Delphes342
nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/ckkwl_w.root $path_hepmc/svj_ckkwl_w.hepmc > $path_root/ckkwl_w.log 2>&1 &
nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/ckkwl_wo.root $path_hepmc/svj_ckkwl_wo.hepmc > $path_root/ckkwl_wo.log 2>&1 &
nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/mlm_w.root $path_hepmc/svj_mlm_w.hepmc > $path_root/mlm_w.log 2>&1 &
nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/mlm_wo.root $path_hepmc/svj_mlm_wo.hepmc > $path_root/mlm_wo.log 2>&1 &

echo "*------  Done  ------*"
