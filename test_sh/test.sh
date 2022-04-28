#!/bin/bash
# Program: Test scanning Lambda_d and rinv.

# test 1: sed
# sed -e 's/LAMBDA/100/g' -e 's/RINV/0.6/g' test.cmnd > test_output.cmnd
sed -e "s/LAMBDA/100/g" -e "s/RINV/0.6/g" test.cmnd > test_output.cmnd


# what I want
# Lambda_d=(5 10 100 300)
# rinv=(0 0.1 0.2 0.3 0.6 0.9 1)

# simple test
Lambda_d=(5 100)
rinv=(0 0.1 0.2 0.3)
for ((i=0; i < ${#Lambda_d[@]}; i++))
do
    echo "*------  $(($i+1)). Lambda_d = ${Lambda_d[$i]}"
    for j in ${rinv[@]}
    do
        r_111=$(echo "print(1-$j)" | python3)
        r_113=$(echo "print((1-$j)/5)" | python3)
        r_cmnd=$(echo "print($j*10)" | python3)
        rquark_111=$(printf "%1.2f" $r_111)
        rquark_113=$(printf "%1.2f" $r_113)
        rinv_cmnd=$(printf "%1.0f" $r_cmnd)
        # echo "${Lambda_d[$i]}, rinv = $j, rquark_111 = $r_111, $rquark_111, rquark_113 = $r_113, $rquark_113"
        echo "rinv = $j, rquark_111 = $rquark_111, rquark_113 = $rquark_113, rinv_cmnd = $rinv_cmnd"
        # echo $j $rquark_111 $rquark_113 $rinv_cmnd
        # echo '${Lambda_d[$i]}' '$j'
        # echo "${Lambda_d[$i]}" "$j"
        # echo "sed -e "s/LAMBDA/${Lambda_d[$i]}/g" -e "s/RINV/$j/g" -e "s/RQUARK_111/$rquark_111/g" -e "s/RQUARK_113/$rquark_113/g" test.cmnd > ./cmnd/Lambdad${Lambda_d[$i]}_rinv$rinv_cmnd.cmnd"
        echo ""
        sed -e "s/LAMBDA/${Lambda_d[$i]}/g" -e "s/RINV/$j/g" -e "s/RQUARK_111/$rquark_111/g" -e "s/RQUARK_113/$rquark_113/g" test.cmnd > ./cmnd/Lambdad${Lambda_d[$i]}_rinv$rinv_cmnd.cmnd
    done
done

echo "I got it!!"
