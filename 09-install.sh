#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ] ; then
    echo "please run this as root user"
    exit 1
fi

dnf list installed mysql
if [ $? -eq o ] ; then
    echo "mysql already installed ..... skipping"
else
    echo "installing mysql "
    dnf install mysql -y

    if [ $? -ne 0 ] ; then
       echo "installing mysql is failed"
        exit 1
    else
    echo "installing mysql is success"
    fi
fi

dnf list installed nginx
if [ $? -eq 0 ] ; then
    echo "nginx already installed ..... skipping"
else
    echo "installing nginx "
    dnf install mysql -y

    if [ $? -ne 0 ] ; then
       echo "installing nginx is failed"
        exit 1
    else
    echo "installing nginx is success"
    fi
fi