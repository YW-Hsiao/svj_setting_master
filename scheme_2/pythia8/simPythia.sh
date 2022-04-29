#!/bin/bash
# Program:
#    This program is to do the Pythia simultaion about SVJ s-channel with CKKW-L merging.
#    And it is without decays of 4900211/4900213.
#    Main:numberOfEvents = 20000, Random:seed = 100
#    LHEFInputs:nSubruns = 1, Main:subrun = 0
#    CKKW-L:
#    Merging:doKTMerging = on, Merging:TMS = 100
#    Merging:Process = pp>{xd,4900101}{xd~,-4900101}
#    Merging:mayRemoveDecayProducts = off
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/04/29 First release.

# Setup environment and variables
now=$(date)
path_setting="/youwei_home/svj_setting_master/scheme_2"
path_data="/youwei_u3/svj_data_master/scheme_2"
path_pythia8="$path_setting/pythia8"
path_hepmc="$path_data/hepmc"
path_pythia8245_examples="/root/pythia8245/examples"
Lambda_d=(5 10 100 300)
rinv=(0 0.1 0.2 0.3 0.6 0.9 1)

# Check your setting and data path!!
# Check your Beams:LHEF path, number of events, and random seed of .cmnd file!!
# Check you have executed "make main89"!!
echo "*------  Start Running  ------*"
echo "date: $now"
echo "Path of .cmnd and shell script: $path_pythia8"
echo "Path of .hepmc and .log files: $path_hepmc"
echo "Path of the Pythia examples main89: $path_pythia8245_examples"

echo "Generate .cmnd files with different Lambda_d and rinv"
for ((i=0; i < ${#Lambda_d[@]}; i++))
do
    echo "*------  $(($i+1)). Lambda_d = ${Lambda_d[$i]}"
    for j in ${rinv[@]}
    do
        r_111=$(echo "print(1-$j)" | python3)
        r_113=$(echo "print((1-$j)/5)" | python3)
        r_cmnd=$(echo "print($j*10)" | python3)
        rq_111=$(printf "%1.2f" $r_111)
        rq_113=$(printf "%1.2f" $r_113)
        rinv_cmnd=$(printf "%1.0f" $r_cmnd)
        file_name="svj_Lambdad${Lambda_d[$i]}_rinv${rinv_cmnd}"
        echo "rinv = $j, rq_111 = $rq_111, rq_113 = $rq_113, rinv_cmnd = $rinv_cmnd"
        echo ""
        sed -e "s/LAMBDA/${Lambda_d[$i]}/g" -e "s/RINV/$j/g" -e "s/RQ_111/$rq_111/g" -e "s/RQ_113/$rq_113/g" svj.cmnd > ./$file_name.cmnd
    done
done

echo "Scan Lambda_d and rinv"
cd $path_pythia8245_examples
for ((i=0; i < ${#Lambda_d[@]}; i++))
do
    echo "*------  $(($i+1)). Lambda_d = ${Lambda_d[$i]}"
    for j in ${rinv[@]}
    do
        r_cmnd=$(echo "print($j*10)" | python3)
        rinv_cmnd=$(printf "%1.0f" $r_cmnd)
        file_name="svj_Lambdad${Lambda_d[$i]}_rinv${rinv_cmnd}"
        # echo "nohup ./main89 $path_pythia8/$file_name.cmnd $path_hepmc/$file_name.hepmc > $path_hepmc/log/$file_name.log 2>&1 &"
        nohup ./main89 $path_pythia8/$file_name.cmnd $path_hepmc/$file_name.hepmc > $path_hepmc/log/$file_name.log 2>&1 &
    done
done

echo "*------  Done  ------*"