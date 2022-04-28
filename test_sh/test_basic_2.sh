#!/bin/bash
# Program: Test basic operation.

# test 1: printf
echo "*--------------------  Test 1: printf  --------------------*"
printf "%03d\n" 8
printf "%1.1f\n" 8

num=8;
zero_num=$(printf "%03d" $num);
echo "$zero_num"


# test 2: echo vs. printf
echo "*--------------------  Test 2: echo vs. printf  --------------------*"
echo "----------  Use echo to calculate"
f=$(echo "print(1-0.3)" | python3)
echo "echo $f"
printf "%-10s %1.2f\n" "printf" $f

echo "----------  Use printf to calculate"
f=$(printf "print((1-0.3)/5)" | python3)
echo "echo $f"
printf "%-10s %1.2f\n" "printf" $f

# test 3: echo and printf (This is what I want!!)
echo "*--------------------  Test 4: echo and printf (This is what I want!!)  --------------------*"
f=$(echo "print((1-0.3)/5)" | python3)
ff=$(printf "%1.2f" $f)
echo "(1 - 0.3)/5 = $f"
echo "(1 - 0.3)/5 = $ff"


# test 4:
echo "*--------------------  Test 4:  --------------------*"
arr=(1 3 5 7)
for i in ${arr[@]}
do
    f1=$(awk 'BEGIN{print $i/10}')
    f2=$(echo "print($i/10)" | python3)
    echo "$(($i*2)), f1 = $f1, f2 = $f2"
done

echo "awk doesn't work in for loop."
