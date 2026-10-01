#!/bin/bash
userid=$(id -u)
LOGS_DIR=/var/log/script_dir
LOG_FILE=$LOGS_DIR/$0.log
sudo mkdir -p $LOGS_DIR
TIMESTAMP=$(date "+%y-%m-%d  %h-%m-%s")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ] ; then
    echo "pls run this as root user"
    exit 1
fi

validate(){
    if [ $2 -ne 0 ] ; then
       echo -e " $TIMESTAMP $R [ERROR] $N installing $package is ..... $R failed $N"
       exit 1
    else 
       echo -e " $TIMESTAMP $Y [INFO] $N installing  $package is .......$G success $N"
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -eq 0 ] ; then
       echo -e " $TIMESTAMP $Y [INFO] $N installing $package is already done ..... $Y skipping $N" | tee -a $LOG_FILE
    else    
        echo "installing $package" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        validate $package $?
    fi
done