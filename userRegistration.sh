#!/bin/bash -x

#used for an exterbnal globbing
shopt -s extglob

echo "Welcome to User Registration Problem"

#Patterns
readonly NAME_PATTERN="^[A-Z]{1}[a-z]{2,}$"
readonly EMAIL_PATTERN="^([a-zA-Z]{3,}([.|_|+|-]?[a-zA-Z0-9]+)?[@][a-zA-Z0-9]+[.][a-zA-Z]{2,3}([.]?[a-zA-Z]{2,3})?)$"
readonly MOBILE_NUMBER_PATTERN="^[0-9]{1,3}[' '][0-9]{10}$"

#Validate user details
function validateUserDetails()
{
	local userDetails=$1 pattern=$2
	[[ $userDetails =~ $pattern ]] && echo "Valid Details" || echo "Invalid Details"
}

#Validate user mobile numbers
function validateUserMobileNumber()
{
	[[ $mobileNumber =~ $MOBILE_NUMBER_PATTERN ]] && echo "Valid Mobile Number" || echo "Invalid Mobile Number"
}

#read first name
read -p "Enter First Name : " firstName
validateUserDetails $firstName $NAME_PATTERN

#read last name
read -p "Enter Last Name : " lastName
validateUserDetails $lastName $NAME_PATTERN

#read email id
read -p "Enter Email Id : " emailId
validateUserDetails $emailId $EMAIL_PATTERN

#read mobile number
read -p "Enter Mobile Number : " mobileNumber
validateUserMobileNumber $mobileNumber $MOBILE_NUMBER_PATTERN
