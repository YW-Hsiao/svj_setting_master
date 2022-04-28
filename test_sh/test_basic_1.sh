#!/bin/bash
# Program: Test basic operation.

# test 1: sed
echo "*--------------------  Test 1: sed  --------------------*"
sed -e 's/LAMBDA/100/g' -e 's/RINV/0.6/g' test.cmnd > test_output.cmnd


# test 2: for loop
echo "*--------------------  Test 2: for loop  --------------------*"
echo "---------- method 1:"
for i in 1 2 3; do
    echo "number: $i"
done

echo "---------- method 2:"
arr=(1 3 5 7)
echo "list           = ${arr[@]}"
echo "length of list =" ${#arr[*]} ${#arr[@]}
for i in ${arr[@]}
do
    echo $(($i*2))
done

echo "---------- method 3:"
for ((i=0; i < ${#arr[@]}; i++))
do
    echo $i ${arr[$i]} $((2*${arr[$i]}))
done

echo "---------- 2 loops"
for i in 0 1 2
do
    echo "i = $i"
    for j in 0 1 2
    do
        echo "$i, j = $j"
    done
done


# test 3: calculation
echo "*--------------------  Test 3: calculation  --------------------*"
echo "---------- integer:"
a=2
b=4
echo "a + b + 1 = "$((a+b+1))
echo "a + b + 1 = $((a+b+1))"
echo "a x b = $((a*b))"
echo "a / b = $((a/b))"
echo "b / a = $((b/a))"

echo "---------- float: bc"
echo "1 - 0.3 = $((1-0.3))" # failure
# A.
f=$(echo "4.3+2.4"|bc)
echo "4.3 + 2.4 = $f"
# B.
f=$(echo "1-0.3"|bc)
echo "1 - 0.3   = $f, but it there is no 0. ."
echo "0.001 + 0.002"|bc
# C. $ echo "scale=3; 1/13"| bc
f=$(echo "scale=3; 1/13"| bc)
echo "1 / 13 = $f"
# D. $ echo "1 13" | awk '{printf("%0.3f\n",$1/$2)}'
f=$(echo "1 13" | awk '{printf("%0.3f\n",$1/$2)}')
echo "1 / 13 = $f, it is trouble."

echo "---------- float: awk"
# A.
f=$(awk 'BEGIN{print 4.5+3.4 }')
echo "4.5 + 3.4 = $f"
# B.
f=$(awk 'BEGIN{print 1-0.3 }')
echo "1 - 0.3   = $f, this is better way."
# C.
f=$(awk 'BEGIN{print 0.001+0.002}')
echo "0.001 + 0.002 = $f"

echo "---------- float: python"
# A
echo 'print(1/3)' | python3
# B
f=$(echo 'print(1/3)' | python3)
echo $f
# C
f=$(echo "print(1-0.3)" | python3)
echo "1 - 0.3       = $f, this is great way."
# D
f=$(echo "print(4.5+3.4)" | python3)
echo "4.5 + 3.4     = $f"
# E
f=$(echo "print(0.001+0.002)" | python3)
echo "0.001 + 0.002 = $f"


echo "*--------------------  Test 4: more float  --------------------*"
echo "---------- cool!"
# A.
# from https://stackoverflow.com/questions/8402181/how-do-i-get-bc1-to-print-the-leading-zero
echo "0.1 + 0.1" | bc | sed 's/^\./0./'
f=$(echo "0.1 + 0.1" | bc | sed 's/^\./0./')
echo "0.1 + 0.1 = $f, I think this may be also good way."
# B. it is not good...
f=$(echo "-1 + 0.9" | bc | sed 's/^\./0./')
echo "-1 + 0.9 = $f, but for the negative value, it doesn't work..."
# C. modify the negative value
# from https://stackoverflow.com/questions/16482353/adding-a-leading-zero-to-a-float-number-in-a-bash-script
f=$(echo "-1 + 0.9" | bc | sed -e 's/^\./0./' -e 's/^-\./-0./')
echo "-1 + 0.9 = $f"


# test 5: additional
echo "*--------------------  Test 5: additional  --------------------*"
# echo "A. loop:"
# b=("0" "1" "2" "3")
# for i in ${b[@]}
# do
#     echo $((i*2))
# done

# echo "B. calculation:"
# # test a="" and b=""
# a="3"
# b="6"
# echo "a + b = $((a+b))"

# x=10
# y='3'
# echo "Result1: $((x+y))"
# echo "Result2: $((${x}+${y}))"
