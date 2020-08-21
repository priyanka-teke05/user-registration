#!/bin/bash -x

#used for an exterbnal globbing
shopt -s extglob

echo "Welcome to User Registration Problem"

#Patterns
firstNamePattern="^[A-Z]{1}[a-z]{2,}$"

read -p "Enter First Name : " firstName

#Validating user first name
function validateUserFirstName()
{
	local userDetails=$1 pattern=$2
	if [[ $userDetails =~ $pattern ]]
	then
		echo "Valid Name"
	else
		echo "Invalid name"
	fi
}

validateUserFirstName $firstName $firstNamePattern
