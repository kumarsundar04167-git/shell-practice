#!/bin/bash
num=$1
if [$num -lt 20]; then
 echo "given $num is less than 20"
 elif [$num -eq 20]; then
 echo "given $num is equal to 20"
else 
 echo "given $num is greater than 20"
fi