#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ] ; then
    echo "please run this as root user"
    exit 1
fi

echo "installing mysql -y"
dnf install mysql

if [ $? -ne 0 ] ; then
   echo "installing mysql is failed"
   exit 1
else
    echo "installing mysql is success"
fi
