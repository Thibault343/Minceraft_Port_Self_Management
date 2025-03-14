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
In the first time you need to define the rat file use for your serveur.
Replace minecraft_server.jar with the name of your file at line 6 of the script.
```bash
# Name of the Minecraft server .jar file
jar_file="minecraft_server.jar" #Complete with the name of your file
```

## Automation
For automatisate this script we gonna use cron.
In the first time let's verify if cron is install.
> [!IMPORTANT]  
> If your not in root. you gonna need to use sudo for crontab command.
```bash
crontab -l
```
Let's open the crontab editor.
> [!WARNING]  
> You have the choise of the editor but by default is nano, if your more familliar with another you can try.
> But personnaly i choose the default one, Nano.
```bash
crontab -e
```
Let's start to config.
In the file your gonna write.
He gonna execute the script every twenty minutes.
```bash
*/20 * * * * /scripts/monitor.sh
```
# Parameters
## Time Between Checking
For the parameter of when execute the script.
You can change the value of 20 to 2 or 5.
You select days of the year or a lots of othes parameters
> [!IMPORTANT]  
> [Minute] [hour] [Day_of_the_Month] [Month_of_the_Year] [Day_of_the_Week] [command]
[Cron Documentation](https://wiki.debian.org/cron)
