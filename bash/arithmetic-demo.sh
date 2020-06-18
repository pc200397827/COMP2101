#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

read -p "Input Number 1? " firstnumber #prompting for user input and saving in variable
read -p "Input Number 2? " secondnumber
read -p "Input Number 3? " thirdnumber  
sum=$((firstnumber + secondnumber + thirdnumber)) # doing sum of 3 variable
product=$((firstnumber * secondnumber * thirdnumber)) # finding product by processing the variable. basically syntax calls variable's value

cat <<EOF
The sum of $firstnumber , $secondnumber and $thirdnumber numbers is $sum
The product of $firstnumber , $secondnumber and $thirdnumber numbers is $product
EOF
