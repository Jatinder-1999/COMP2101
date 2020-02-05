#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
range=6
offset=1
# roll the dice and save the results
die1=$(( RANDOM % range + offset))
die2=$(( RANDOM % range + offset ))
# sum up the rolls
sum=$(( die1 + die2 ))
#average
avg=$(($sum/2))
# display the results
echo "Rolled $die1, $die2 for sum: $sum and average: $avg"
