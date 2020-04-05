#! /bin/bash -x

#Constants
START_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

#Variable
position_Of_Player=0
i=0

#Function to generate random between 1-6
function rollTheDie() {

	addNumber=$((RANDOM%6 +1))
	((i++))
}

#Function to generate random for cases
function getOption() {

	option=$((RANDOM%3))
}

#Function to check for NO_PLAY, SNAKE and LADDER
function toCheck() {

	rollTheDie
	getOption
	case $option in
		$NO_PLAY)
			position_Of_Player=$position_Of_Player
			;;
		$LADDER)
			position_Of_Player=$(($position_Of_Player+$addNumber))
			;;
		$SNAKE)
			position_Of_Player=$(($position_Of_Player-$addNumber))
			;;
	esac

  if [ $position_Of_Player -lt $START_POSITION ]
  then
    position_Of_Player=$START_POSITION
	elif [ $position_Of_Player -gt $WINNING_POSITION ]
	then
		position_Of_Player=$(($position_Of_Player-$addNumber))
	fi

	checkWinningCondition

}

#Function to show number of count the roll die and position of winning
function checkWinningCondition() {

	if [ $position_Of_Player -eq $WINNING_POSITION ]
	then
		echo "Position of winning: " $position_Of_Player
		echo "which times Roll a Die: " $i
	fi

}

#Function to checked player is reached winning position Or NOT
function main() {

	while [ $position_Of_Player -ne $WINNING_POSITION ]
	do
		toCheck
	done

}

#Main function call
main
