#!/bin/bash

# Prompt user for name, age, and country
read -p "Enter your name: " name
read -p "Enter your age: " age
read -p "Enter your country: " country

# Validate age is numeric
if ! [[ $age =~ ^[0-9]+$ ]]; then
    echo "Error: Age must be a number."
    exit 1
fi

# Determine age category
if [ $age -lt 18 ]; then
    category="Minor"
elif [ $age -ge 18 ] && [ $age -le 65 ]; then
    category="Adult"
else
    category="Senior"
fi

# Log user information
log_file="logs/user_info.log"
echo "Date: $(date +'%Y-%m-%d %H:%M:%S') | Name: $name | Age: $age | Country: $country | Category: $category" >> $log_file
