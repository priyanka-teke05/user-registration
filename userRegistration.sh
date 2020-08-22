#!/bin/bash -x

#used for an exterbnal globbing
shopt -s extglob

echo "Welcome to User Registration Problem"

#Patterns
readonly NAME_PATTERN="^[A-Z]{1}[a-z]{2,}$"

#Validating user name
function validateUserName()
{
	local userDetails=$1 pattern=$2
	[[ $userDetails =~ $pattern ]] && echo "Valid Name" || echo "Invalid Name"
}

#read first name
read -p "Enter First Name : " firstName
validateUserName $firstName $NAME_PATTERN

#read last name
read -p "Enter Last Name : " lastName
validateUserName $lastName $NAME_PATTERN
