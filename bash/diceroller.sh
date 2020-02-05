#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

# Rolling the six-sided dice and displaying the result
echo "Rolling two six-sided dice -
$(( RANDOM % 6 + 1)) and $(( RANDOM % 6 + 1 )) rolled.
"

#five six-sided dice and its result
echo "Rolling five six-sided dice -
$(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1 )), $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1)) and $(( RANDOM % 6 + 1)) rolled.
"
