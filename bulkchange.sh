#!/bin/bash

# Read the email addresses from the file
emails=$(cat /root/email_file.txt)

# Create an empty file to store the results
touch results.txt

# Loop through the email addresses
for email in $emails
do
  # Generate a random password
  password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16 ; echo '')

  # Run the plesk command to set the password for the email address
  plesk bin mail -u $email -passwd $password

  # Append the email and password to the results file
  echo "$email,$password" >> results.txt
done
