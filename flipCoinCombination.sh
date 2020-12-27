#! /bin/bash -x

read -p "enter number of times coins flipped " N
isHead=1
isTail=0
headCount=0
tailsCount=0
declare -A Percentage
declare -A CoinFlip
for((i=1; i<=N; i++))
do
	coinFlip=$((RANDOM%2))
	if [ $coinFlip -eq $isHead ]
	then
		CoinFlip[Heads]=$isHead
		((headCount++))
	else

		CoinFlip[Tails]=$isTail
		((tailsCount++))
	fi
done
	Percentage["H"]=$(($headCount*100/$N))

HHcount=0
HTcount=0
THcount=0
TTcount=0
declare -A Doublet
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
HHHcount=0
HHTcount=0
HTHcount=0
THHcount=0
TTHcount=0
HTTcount=0
THTcount=0
TTTcount=0
declare -A Triplet
for((i=1; i<=N; i++))
do
	coinFlip1=$((RANDOM%2))
	coinFlip2=$((RANDOM%2))
	coinFlip3=$((RANDOM%2))
	if [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isHead -a $soinFlip3 -eq $isHead ]
	then
		((HHHcount++))
		Triplet[HHH]=$isHead
		Triplet[HHH]+=$isHead
		Triplet[HHH]+=$isHead
		HHHpercent=$(($HHHcount*100/$N))
		Percentage["HHH"]=$HHHpercent
	elif [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isTail -a $coinFlip3 -eq $isHead ]
	then
		((HTHcount++))
		Triplet[HTH]=$isHead
		Triplet[HTH]+=$isTail
		Triplet[HTH]+=$isHead
		HTHpercent=$(($HTHcount*100/$N))
		Percentage["HTH"]=$HTHpercent

	elif [ $coinFlip1 -eq $isTail  -a $coinFlip2 -eq $isHead -a $coinFlip -eq $isHead ]
	then
		((THHcount++))
		Triplet[THH]=$isTail
		Triplet[THH]+=$isHead
		Triplet[THH]+=$isHead
		THHpercent=$(($THHcount*100/$N))
		Percentage["THH"]=$THHpercent
	elif [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isHead -a $coinFlip3 -eq $isTail ]
	then
		((HHTcount++))
		Triplet[HHT]=$isHead
		Triplet[HHT]+=$isHead
		Triplet[HHT]+=$isTail
		HHTpercent=$(($HHTcount*100/$N))
		Percentage["HHT"]=$HHTpercent
	elif [ $coinFlip1 -eq $isHead  -a $coinFlip2 -eq $isTail -a $coinFlip3 -eq $isTail ]
	then
		((HTTcount++))
		Triplet[HTT]=$isHead
		Triplet[HTT]+=$isTail
		Triplet[HTT]+=$isTail
		HTTpercent=$(($HTTcount*100/$N))
		Percentage["HTT"]=$HTTpercent

	elif [ $coinFlip1 -eq $isTail  -a $coinFlip2 -eq $isHead -a $coinFlip3 -eq $isTail ]
	then
		((THTcount++))
		Triplet[THT]=$isTail
		Triplet[THT]+=$isHead
		Triplet[THT]+=$isTail
		THTpercent=$(($THTcount*100/$N))
		Percentage["THT"]=$THTpercent
	elif [ $coinFlip1 -eq $isTail  -a $coinFlip2 -eq $isTail -a $coinFlip3 -eq $isHead ]
	then
		((TTHcount++))
		Triplet[TTH]=$isTail
		Triplet[TTH]+=$isTail
		Triplet[TTH]+=$isHead
		TTHpercent=$(($TTHcount*100/$N))
		Percentage["TTH"]=$TTHpercent

	else
		((TTTcount++))
		Triplet[HHH]=$isTail
		Triplet[HHH]+=$isTail
		Triplet[HHH]+=$isTail
		TTTpercent=$(($TTTcount*100/$N))
		Percentage["TTT"]=$TTTpercent

	fi
done
for key in ${!Percentage[@]}
do
	echo $key : ${Percentage[$key]}
done
winningCombination=$( printf '%s\n' ${Percentage[@]} | sort -n | tail -1 )

