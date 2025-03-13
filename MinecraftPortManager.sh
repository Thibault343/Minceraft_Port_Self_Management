#!/bin/bash

# Get the current date and time
echo "[$(date)] Checking Minecraft server status..." >> PortLogManager.log

# Name of the Minecraft server .jar file
jar_file="minecraft_server.jar"

# Function to open port 25565 (if not already open)
open_port() {
    if ! sudo iptables -C INPUT -p tcp --dport 25565 -j ACCEPT 2>/dev/null; then
        echo "[$(date)] Minecraft server is running. Opening port 25565..." >> PortLogManager.log
        sudo iptables -A INPUT -p tcp --dport 25565 -j ACCEPT
    else
        echo "[$(date)] Port 25565 is already open." >> PortLogManager.log
    fi
}

# Function to close port 25565 (if it exists)
close_port() {
    if sudo iptables -C INPUT -p tcp --dport 25565 -j ACCEPT 2>/dev/null; then
        echo "[$(date)] Minecraft server is stopped. Closing port 25565..." >> PortLogManager.log
        sudo iptables -D INPUT -p tcp --dport 25565 -j ACCEPT
    else
        echo "[$(date)] Port 25565 was not open." >> PortLogManager.log
    fi
}  

# Check if the Minecraft server is running
if pgrep -f "$jar_file" > /dev/null; then
    open_port
else
    close_port
fi
