#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ] ; then
    echo "please run this as root user"
    exit 1
fi

validate() {
     if [ $2 -ne 0 ] ; then
       echo "installing $1 is failed"
        exit 1
    else
    echo "installing $1 is success"
    fi
}
dnf list installed mysql
if [ $? -eq 0 ] ; then
    echo "mysql already installed ..... skipping"
    exit 1
else
    echo "installing mysql "
    dnf install mysql -y
    validate mysql $?
fi

dnf list installed nginx
if [ $? -eq 0 ] ; then
    echo "nginx already installed ..... skipping"
else
    echo "installing nginx "
    dnf install nginx -y
    validate nginx $?
fi