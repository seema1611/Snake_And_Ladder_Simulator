#! /bin/bash -x

#Constants
START_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2


#Variable
position_Of_Player=0

#Function to generate random between 1-6
function rollTheDie() {

	addNumber=$((RANDOM%6 +1))
}

#Function to generate random for cases
function getOption() {

	option=$((RANDOM%3))
}

#Function to check for NO_PLAY, SNAKE and LADDER
function main() {

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

}

#Main function call
main
