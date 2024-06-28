# Connect to wifi
nmcli dev wifi list
nmcli dev wifi connect $BSSID password $PSWD

# Quick network check
nload wlan0
