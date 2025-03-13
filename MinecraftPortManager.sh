#!/bin/bash

# Name of your Minecraft server .jar file
jar_file="minecraft_server.jar"

# Function to open port 25565
open_port() {
    echo "The Minecraft server is started. Opening port 25565..."
    sudo iptables -A INPUT -p tcp --dport 25565 -j ACCEPT
}

# Function to close port 25565
close_port() {
    echo "The Minecraft server is shut down. Closing port 25565..."
    sudo iptables -D INPUT -p tcp --dport 25565 -j ACCEPT
}

# Check if the Minecraft server is running
if pgrep -f "java -jar $jar_file" > /dev/null; then
    open_port
else
    close_port
fi
