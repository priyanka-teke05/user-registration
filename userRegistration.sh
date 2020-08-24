#!/bin/bash -x

#used for an exterbnal globbing
shopt -s extglob

echo "Welcome to User Registration Problem"

declare -A emailSample

#Patterns
readonly NAME_PATTERN="^[[:upper:]]{1}[[:lower:]]{2,}$"
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

#Validate password of atleast 8 chars long and atleast 1 uppercase letter and numberic and special characters
function validatePassword() {
	local password=$1
	if [[ ${#password} -ge 8 && "$password" == *[[:lower:]]* && "$password" == *[[:upper:]]* && "$password" == *[0-9]* && "${password//[^@#$%&*+=-]/}" ]]
	then
   	echo "valid password"
	else
   	echo "invalid password"
	fi
}

#validate all sample emails
function validateAllEmailSample()
{
	#valid email id
	emailSample[email-1]="abc@yahoo.com"
	emailSample[email-2]="abc-100@yahoo.com"
	emailSample[email-3]="abc.100@yahoo.com"
	emailSample[email-4]="abc111@abc.com"
	emailSample[email-5]="abc-100@abc.net"
	emailSample[email-6]="abc.100@abc.com.au"
	emailSample[email-7]="abc@1.com"
	emailSample[email-8]="abc@gmail.com.com"

	#invalid email id
	emailSample[email-9]="abc-gmail.com"
	emailSample[email-10]="abc@.com.my"
	emailSample[email-11]="abc123@gmail.a"
	emailSample[email-12]="abc123@.com"
	emailSample[email-13]="abc123@.com.com"
	emailSample[email-14]=".abc@abc.com"
	emailSample[email-15]="abc()*@gmail.com"
	emailSample[email-16]="abc@%*.com"
	emailSample[email-17]="abc..2002@gmail.com"
	emailSample[email-18]="abc.@gmail.com"
	emailSample[email-19]="abc@abc@gmail.com"
	emailSample[email-20]="abc@gmail.com.1a"
	emailSample[email-21]="abc@gmail.com.aa.au"

	for i in ${!emailSample[@]}
	do
		[[ ${emailSample[$i]} =~ $EMAIL_PATTERN ]] && echo "$i : ${emailSample[$i]} - Valid email" || echo "$i : ${emailSample[$i]} - Invalid email"
	done
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
validateUserMobileNumber

#read password
read -p "Enter Password(At least 8 characters long and atleast 1 uppercase letter 1 numeric and special characters)  : " password
validatePassword $password

validateAllEmailSample
