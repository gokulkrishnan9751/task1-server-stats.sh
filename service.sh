#!/bin/bash

echo "==============================="
echo "   SERVER PERFORMANCE STATS"
echo "==============================="

echo ""
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo ""
echo "Memory Usage:"
free -m | awk 'NR==2{
    total=$2;
    used=$3;
    free=$4;
    percent=(used/total)*100;
    printf "Total: %sMB, Used: %sMB, Free: %sMB, Usage: %.2f%%\n", total, used, free, percent
}'

echo ""
echo "Disk Usage:"
df -h / | awk 'NR==2{
    printf "Total: %s, Used: %s, Free: %s, Usage: %s\n", $2, $3, $4, $5
}'

echo ""
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo ""
echo "==============================="
echo "        END OF REPORT"
echo "==============================="