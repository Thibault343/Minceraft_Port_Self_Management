# Description
This script is use for opening the port when the minecraft server is running and close it when the server is not.
Its realy helpfull if youre didn't use your minecraft server 24/24.

This script use IPtables for the firewall and cron for the automatisation of the script.

# Setup
## Prerequies
Before installing, make sure iptables is properly configured on your server. If not, set up your firewall rules accordingly.
## Installation
### Download the repository
Clone or download the repository anywhere on your server:
```bash
git clone https://github.com/Thibault343/Minecraft_Port_Self_Management
cd Minecraft_Port_Self_Management 
```
### Install required packages
Install cron:
```bash
sudo apt update && sudo apt install cron -y

```
### Enable and start Cron
```bash
sudo systemctl enable --now cron
```
### Make sure the script is executable
```bash
chmod +x MinecraftPortManager.sh
```
## Settings
### Define the server file
In the first time you need to define the jat file use for your serveur.
Replace minecraft_server.jar with the name of your file at line 6.
```bash
# Name of the Minecraft server .jar file
jar_file="minecraft_server.jar" #Complete with the name of your file
```

## Automation

# Parameters
## Time Between Checking
