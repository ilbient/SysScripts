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

echo -e "${YELLOW}Zadaj nazov aplikacie v systeme Linux Mint 22 ktoru chces odinstalovat. ${NC}"
read choice

#Odinstalovanie Balika
echo -e "Balik "$choice" sa odinstaluje. "
	sudo apt remove --purge "$choice"

#Vycistenie nepotrebnych zavislosti
echo -e "Vycistenie nepotrebnych zavislosti."
	sudo apt autoremove

#Kontrola zvysnych suborov 
#Ak Rygel vytvoril nejaké konfiguračné súbory alebo priečinky 
#vo vašom domovskom adresári (napr. .config alebo .cache), 
#môžete ich manuálne odstrániť. Prehľadajte ich takto:

echo -e "Hladanie, ci nieco neostalo v .cache alebo .config"
	ls -a ~ | grep "$choice"

