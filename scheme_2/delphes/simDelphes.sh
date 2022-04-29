#!/bin/bash
# Program:
#    This program is to do the Delphes simultaion about s-channel with CKKW-L merging.
#    I use the /root/Delphes-3.4.2/cards/delphes_card_ATLAS.tcl
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/04/29 First release.

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_2"
path_data="/youwei_u3/svj_data_master/scheme_2"
path_delphes="$path_setting/delphes"
path_tcl_cards="/root/Delphes-3.4.2/cards"
path_hepmc="$path_data/hepmc"
path_root="$path_data/root"
path_Delphes342="/root/Delphes-3.4.2"
Lambda_d=(5 10 100 300)
rinv=(0 0.1 0.2 0.3 0.6 0.9 1)

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

echo "Scan Lambda_d and rinv"
cd $path_Delphes342
for ((i=0; i < ${#Lambda_d[@]}; i++))
do
    echo "*------  $(($i+1)). Lambda_d = ${Lambda_d[$i]}"
    for j in ${rinv[@]}
    do
        r_cmnd=$(echo "print($j*10)" | python3)
        rinv_cmnd=$(printf "%1.0f" $r_cmnd)
        file_name="svj_Lambdad${Lambda_d[$i]}_rinv${rinv_cmnd}"
        # echo "nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/$file_name.root $path_hepmc/$file_name.hepmc > $path_root/log/$file_name.log 2>&1 &"
        nohup ./DelphesHepMC $path_tcl_cards/delphes_card_ATLAS.tcl $path_root/$file_name.root $path_hepmc/$file_name.hepmc > $path_root/log/$file_name.log 2>&1 &
    done
done

echo "*------  Done  ------*"