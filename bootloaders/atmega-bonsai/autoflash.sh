#!/bin/bash

# schreibe auf die Datei eeprom_img.hex
sudo avrdude -p m128rfa1 -c dragon_jtag -U eeprom:r:eeprom_img.hex:i

# lese aus der datei eeprom_img.hex und weise die Zeile 4 der
# Variable mac_zeile zu
mac_zeile=$(tail -2 eeprom_img.hex |head -1 )

# lese die Zeichen 18 bis 33 und weise dies den variablen m1 - m8 zu
m8=$(echo ${mac_zeile} |cut -c 18-19)
m7=$(echo ${mac_zeile} |cut -c 20-21)
m6=$(echo ${mac_zeile} |cut -c 22-23)
m5=$(echo ${mac_zeile} |cut -c 24-25)
m4=$(echo ${mac_zeile} |cut -c 26-27)
m3=$(echo ${mac_zeile} |cut -c 28-29)
m2=$(echo ${mac_zeile} |cut -c 30-31)
m1=$(echo ${mac_zeile} |cut -c 32-33)

# an die variable mac uebergeben
mac=$(echo ${m1}:${m2}:${m3}:${m4}:${m5}:${m6}:${m7}:${m8})

echo "Gelesene MAC Adresse: " ${mac}
read -p "Stimmt die Adresse? CTRL-C Abbrechen, ENTER fuer Weiter!"
make clean
make osd EUI64_ADDRESS="${mac}"
sudo make osd_isp
