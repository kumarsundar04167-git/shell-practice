#!/bin/bash
timestamp=$(date)
echo "timestamp is:$timestamp"

start_time=$(date +%s)
sleep 10
end_time=$(date +%s)
total_time=(($end_time - $start_time))
echo "total time is $total_time seconds"