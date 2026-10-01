#!/bin/bash
userid=$(id -u)
LOGS_DIR=/var/log/shell_script
LOG_FILE=$LOGS_DIR/$0.log

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
dnf list installed mysql  &>> $LOG_FILE
if [ $? -eq 0 ] ; then
    echo "mysql already installed ..... skipping" | tee -a $LOG_FILE
else
    echo "installing mysql "
    dnf install mysql -y &>> $LOG_FILE
    validate mysql $?
fi

dnf list installed nginx  &>> $LOG_FILE
if [ $? -eq 0 ] ; then
    echo "nginx already installed ..... skipping" | tee -a $LOG_FILE
else
    echo "installing nginx "
    dnf install nginx -y  &>> $LOG_FILE
    validate nginx $?
fi