#! /bin/bash -x

#Constants
START_POSITION=0

#Function to generate random between 1-6
function rollTheDie() {

	echo $((RANDOM%6 +1))
}

rollTheDie
