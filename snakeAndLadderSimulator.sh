#! /bin/bash -x

#Constants
START_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

#Variable
position_Of_Player=0
playerTurn=0
first_Player_Position=$START_POSITION
second_Player_Position=$START_POSITION

#First player turn
function firstPlayer() {

	echo "--First Player--"
	position_Of_Player=$first_Player_Position
	toCheck
	first_Player_Position=$position_Of_Player
	echo "Position of First player: " $first_Player_Position
	playerTurn=1
}

#Second player turn
function secondPlayer() {

  	echo "--Second Player--"
  	position_Of_Player=$second_Player_Position
  	toCheck
  	second_Player_Position=$position_Of_Player
	echo "Position of Second player: " $second_Player_Position
	playerTurn=0
}


#Function to generate random between 1-6
function rollTheDie() {
	addNumber=$((RANDOM%6 +1))
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

	toCheckAllCondition
}

#function to check all condition
function toCheckAllCondition() {

  if [ $position_Of_Player -lt $START_POSITION ]
  then
    position_Of_Player=$START_POSITION
  elif [ $position_Of_Player -gt $WINNING_POSITION ]
  then
    position_Of_Player=$(($position_Of_Player-$addNumber))
  fi

}

#Function to show number of count the roll die and position of winning
function checkWinningCondition() {

	if [ $first_Player_Position -eq $WINNING_POSITION ]
	then
		echo "First Player won"
	elif [ $second_Player_Position -eq $WINNING_POSITION ]
	then
		echo "Second Player Won"
	fi

}


#Function to checked player is reached winning position Or NOT
function main() {

	while [ $position_Of_Player -ne $WINNING_POSITION ]
	do

		if [ $playerTurn -eq 0 ]
		then
			firstPlayer
		else
			secondPlayer
		fi
	checkWinningCondition

	done
}

#Main function call
main
