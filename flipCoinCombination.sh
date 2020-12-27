#! /bin/bash -x
coinFlip=$((RANDOM%2))
isHead=1
iaTail=0
if [ $coinFlip -eq 1 ]
then
	echo "Heads"
else
	echo "Tails"
fi
