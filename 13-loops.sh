#!/bin/bash
userid=$(id -u)
LOGS_DIR=/var/log/script_dir
LOG_FILE=$LOGS_DIR/$0.log

TIMESTAMP=$(date "+%y-%m-%d  %h-%m-%s")

if [ $userid -ne 0 ] ; then
    echo "pls run this as root user"
    exit 1
fi

validate(){
    if [ $2 -ne 0 ] ; then
       echo " $TIMESTAMP [ERROR] installing $package is ..... failed"
    else 
    echo " $TIMESTAMP [INFO]  installing  $package is .......success"
    
}

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -eq 0 ] ; then
       echo " $TIMESTAMP [INFO] installing $package is already done ..... skipping" | tee -a $LOG_FILE
    else    
        echo "installing $package" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        validate $package $?
    fi
done