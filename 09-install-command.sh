#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "ERROR: Please run this script with root access"
    exit 1
else
    echo "You are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "MYSQL is not installed... going to install it"
    dnf install mysql -y

    if [ $? -eq 0 ]; then
        echo "Installing MYSQL is ... SUCCESS"
    else
        echo "Installing MYSQL is ... FAILURE"
        exit 1
    fi
else
    echo "MYSQL is already installed... Nothing to do"
    exit 0
fi