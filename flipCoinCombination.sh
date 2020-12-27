#! /bin/bash -x

read -p "enter number of times coins flipped " N
isHead=1
isTail=0
HHcount=0
HTcount=0
THcount=0
TTcount=0
declare -A Doublet
declare -A Percentage
for((i=1; i<=N; i++))
do
	coinFlip1=$((RANDOM%2))
	coinFlip2=$((RANDOM%2))
	if [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isHead ]
	then
		((HHcount++))
		Doublet[HH]=$isHead
		Doublet[HH]+=$isHead
		HHpercent=$(($HHcount*100/$N))
		Percentage["HH"]=$HHpercent
	elif [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isTail ]
	then
		((HTcount++))
		Doublet[HT]=$isHead
		Doublet[HT]+=$isTail
		HTpercent=$(($HTcount*100/$N))
		Percentage["HT"]=$HTpercent

	elif [ $coinFlip1 -eq $isTail  -a $coinFlip2 -eq $isHead ]
	then
		((THcount++))
		Doublet[TH]=$isTail
		Doublet[TH]+=$isHead
		THpercent=$(($THcount*100/$N))
		Percentage["TH"]=$THpercent

	else
		((TTcount++))
		Doublet[TT]=$isTail
		Doublet[TT]+=$isTail
		TTpercent=$(($TTcount*100/$N))
		Percentage["TT"]=$TTpercent

	fi
done

echo ${Doublet[@]}
echo ${Percentage[@]}
