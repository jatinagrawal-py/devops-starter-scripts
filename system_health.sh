#!/bin/bash

##############################################
# Script: system_health.sh
# Author : Jatin Agrawal
# Date : 06-06-2025
# Description: Displays system health info including
# CPU load, memory usage, disk usage, battery, and
# top memory-consuming processes.
##############################################

echo "==== SYSTEM HEALTH REPORT ===="

# Display CPU load averages for 1, 5, and 15 minutes
echo -e "\n>> CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'

# Show free and used memory in human-readable format
echo -e "\n>> Memory Usage:"
free -h

# Show disk usage with human-readable sizes; 'total' combines all
echo -e "\n>> Disk Usage:"
df -h --total | grep total

# Display battery status (if the 'acpi' tool is installed)
echo -e "\n>> Battery Status:"
if command -v acpi &> /dev/null; then
    acpi -b
else
    echo "Battery information not available (acpi not installed)."
fi

# List top 5 memory-consuming processes
echo -e "\n>> Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6

echo -e "\n==== End of Report ===="