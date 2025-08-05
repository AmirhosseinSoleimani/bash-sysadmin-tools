#!/bin/bash

# --- CPU Usage ---
cpu_usage() {
    echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')"
}

# --- Memory Usage ---
memory_usage() {
    echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
}

# --- Disk Usage ---
disk_usage() {
    echo "Disk Usage: $(df -h | grep '^/dev' | awk '{print $5 " " $1}')"
}

# --- Network Usage ---
network_usage() {
    echo "Network Usage: $(ifstat -i eth0 1 1 | tail -n 1 | awk '{print $1 " RX, " $2 " Tx"}')"
}

# --- Collect System Stats ---
collect_system_stats() {
    echo "$(date) - System Stats"
    cpu_usage
    memory_usage
    disk_usage
    network_usage
}

# --- Call the function ---
collect_system_stats