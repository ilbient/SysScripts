#Skript na odinstalaciu programov na systeme Linux Mint 22
#Vytvoril Peter Dzurina
#Zaciatok Prac : 27/12/2024
#Main HW - ThinkPad X220

#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "${YELLOW}Zadaj nazov aplikacie v systeme Linux Mint 22 ktoru chces odinstalovat. ${NC}"
read choice

# Check if the package is installed
if dpkg -l | grep -q "^ii  $choice "; then
    #Odinstalovanie Balika
    echo "${YELLOW}Balik \"$choice\" sa odinstaluje.${NC}"
    sudo apt remove --purge -y "$choice"

    #Vycistenie nepotrebnych zavislosti
    echo "${YELLOW}Vycistenie nepotrebnych zavislosti.${NC}"
    sudo apt autoremove -y

    #Kontrola zvysnych suborov 
    echo "${GREEN}Hladanie, ci nieco neostalo v .cache alebo .config${NC}"
    leftover_files=$(ls -a ~ | grep "$choice")
    if [ -n "$leftover_files" ]; then
        echo "${RED}Nasli sa zvysne subory:${NC}"
        echo "$leftover_files"
    else
        echo "${YELLOW}Ziadne zvysne subory neboli najdene.${NC}"
    fi
else
    echo -e "${RED}Balik \"$choice\" nie je nainstalovany.${NC}"
fi

