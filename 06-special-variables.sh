#!/bin/bash
echo "all variables passed to the script: $@"
echo "number of variables passed to the script: $#"
echo "first variable: $1"
echo "second variable: $2"
echo "script name: $0"
echo "who is running: $user"
echo "which directory: $pwd"
echo "home directory: $home"
echo "PID of current script: $$"
echo "PID of the baground command running just now: $!"
echo "line number: $LINENO"
echo "script executed in $SECONDS seconds"
echo "random number: $RANDOM"
echo "exit code of previous command: $?"
wait $!
sleep 05 &