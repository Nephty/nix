#!/run/current-system/sw/bin/bash

# Get the CPU usage as a percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Check the CPU usage and format the output accordingly
if (( $(echo "$CPU_USAGE < 10") )); then
    echo 0$CPU_USAGE%
elif (( $(echo "$CPU_USAGE < 100") )); then
    echo $CPU_USAGE%
else
    echo $CPU_USAGE%
fi

