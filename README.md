# task1-server-stats.sh
dev-roadmap-task-one

echo"show the sever procress"
top -bn1 

echo"memory usage"
free -m

echo"Disk usage"
df -h

echo"cpu usage"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo"uptime"
uptime -p

echo"os version"
uname -a

echo"load average"
uptime | awk -F'load average:' '{ print $2 }'

echo"logged user"
who
