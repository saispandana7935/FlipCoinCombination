#! /bin/bash -x

read -p "enter number of times coins flipped " N
isHead=1
iaTail=0
headCount=0
tailsCount=0
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
	percent=$(($headCount*100/$N))
