#!/bin/bash
# Program:
#     This program is to do the analysis for python script analysis_script_v1.py.
#     28 .root files: Labmda_d = 5, 10, 100, 300;
#                     rinv = 0, 0.1, 0.2, 0.3, 0.6, 0.9, 1.
#     If you want to re-execuate this shell script, please delete and make this folder
#     'rm analysis_script_v1' and 'mkdir analysis_script_v1'
#     
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History (v.1.0): 2022/05/04 First release.


# Setup environment and variables
path_sh="/youwei_home/svj_setting_master/scheme_2/analysis_script_v1"
path_python_script="/youwei_home/MyHEPTools/svj_analysis"
python_script="analysis_script_v1.py"
path_data="/youwei_u3/svj_data_master/scheme_2/root"
R=0.4
JetClusteringAlgorithm=-1
pTmin_pyjet=0
pT_min=20
eta_max=2.5
nevents=20000
path_output="/youwei_u3/svj_data_master/scheme_2/analysis_script_v1"
# rinv=0.3
# Lambdad=5
remark="ckkwl"
Lambda_d=(5 10 100 300)
rinv=(0 0.1 0.2 0.3 0.6 0.9 1)

# Check your .root file path and all Python parameters
echo "Date: $(date)"
echo "*------  Start Running  ------*"
echo "Path of the shell script : $path_sh"
echo "Path of the python script: $path_python_script"
echo "Path of the .root file   : $path_data"
echo "Path of the output data  : $path_output"

echo "Using the $python_script analyzes"
for ((i=0; i < ${#Lambda_d[@]}; i++))
do
    echo "*------  $(($i+1)). Lambda_d = ${Lambda_d[$i]}"
    for j in ${rinv[@]}
    do
        r_cmnd=$(echo "print($j*10)" | python3)
        rinv_cmnd=$(printf "%1.0f" $r_cmnd)
        file_name="svj_Lambdad${Lambda_d[$i]}_rinv${rinv_cmnd}"
        folder_name="Lambdad${Lambda_d[$i]}_rinv${rinv_cmnd}"
        mkdir $path_output/$folder_name
        echo "rinv = $j"
        # echo "nohup python3 $path_python_script/$python_script $path_data/$file_name.root 0.4 -1 0 20 2.5 20000 $path_output/$folder_name $j ${Lambda_d[$i]} $remark > $path_output/$folder_name/$file_name.log 2>&1 &"
        nohup python3 $path_python_script/$python_script $path_data/$file_name.root 0.4 -1 0 20 2.5 20000 $path_output/$folder_name $j ${Lambda_d[$i]} $remark > $path_output/$folder_name/$file_name.log 2>&1 &
    done
done

echo "*------  Done  ------*"
echo "Date: $(date)"