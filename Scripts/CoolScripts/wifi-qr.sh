#!/bin/bash 
 # 
 # Lazy boring 
 # Ubuntu-MM 
 # Idea from Xaomi 
 # Ko Ko Ye <kokoye2007@gmail.com> 
 # Ubuntu Myanmar LoCo Team 
  
 WIFIS='' 
 SSID='' 
 KEEY='' 
 PSK='' 
 HIDDEN='' 
 QSSID='' 
 QKEES='' 
 QSSIDO='' 
  
 RED=$(tput setaf 1) 
 GREEN=$(tput setaf 2) 
 BLUE=$(tput setaf 4) 
 RESET=$(tput sgr0) 
 BOLD=$(tput bold) 
 VERSION=0.1-1 
  
 ## NMCLI no need SUDO ## 0.1.1 
 #Check root or sudo 
 #if [ "$(id -u)" != "0" ]; then 
 #  echo "This script must be run as root" 1>&2 
 #  exit 1 
 #fi 
  
 #RAW DATA SAMPLE 
 #"WIFI:S:$SSID;P:$PASSWORD;T:$KEY_TYPE;H:$true;" 
 #qrencode -o - -t UTF8  
 #qrencode -l h -s 14 -o  
  
 #GUI Mainmenu 
 main_menu() { 
  
   CHOICE=$(zenity --list \ 
     --title="WiFi and QR Code" \ 
     --text="Choose:" \ 
     --radiolist \ 
     --width=300 --height=320 \ 
     --column="Check" --column="Option" \ 
     TRUE "Scan and connect" \ 
     FALSE "Share current WiFi" \ 
     FALSE "Share saved WiFi" \ 
     FALSE "See license" \ 
     FALSE "See version") 
  
   #Menu Select 
   if [[ "$CHOICE" =~ "Share saved WiFi" ]]; then 
     call_wifi_gui 
  
   elif [[ "$CHOICE" =~ "Share current WiFi" ]]; then 
     call_current_wifi_gui 
    
   elif [[ "$CHOICE" =~ "Scan and connect" ]]; then 
     call_wifi_scan_gui 
  
   elif [[ "$CHOICE" =~ "See license" ]]; then 
     zenity --text-info --title="WiFi QR Copyright" --filename=/usr/share/doc/wifi-qr/copyright --width=528 --height=780 
     main_menu 
  
   elif [[ "$CHOICE" =~ "See version" ]]; then 
     zenity --info --icon-name=wifi-qr --title="WiFi QR Version" --no-wrap --text=" This is wifi-qr version $VERSION" 
     main_menu 
   else 
         exit 0 
   fi 
 } 
  
  
 #GUI 
 call_wifi_gui() { 
   IFS=$'\r\n' GLOBIGNORE='*' command eval  'wifilist=($(nmcli  -g NAME,TYPE connection | grep 802-11-wireless | cut -f1 -d":"))' 
  
   WIFIS=$(zenity --list --column="SSID" \ 
           --width=300 --height=600 \ 
           --title="Select SSID" \ 
           "${wifilist[@]}") 
  
   if [ -z "$WIFIS" ]; then 
     exit 0 
   else 
     call_qr_gui 
   fi 
 } 
  
 call_qr_gui() { 
   call_wifi_pass 
   QR_FILE_NAME="wifi-qr-$(echo $WIFIS | tr -dc '[:alnum:]').png" 
   SAVE_QR_DIR="${HOME}/Pictures/" 
   QR_PNG="$(zenity --file-selection --save --confirm-overwrite --filename=$SAVE_QR_DIR/$QR_FILE_NAME)" 
   if [[ -z "$QR_PNG" ]]; then 
           main_menu 
   else 
     #QR_PNG="/tmp/wifi-qr-$(echo $WIFIS | tr -dc '[:alnum:]').png" 
     qrencode -l h -s 14 -o $QR_PNG "WIFI:S:$WIFIS;P:$KEEY;$PSSK$H;" 
     xdg-open $QR_PNG 
   fi 
 } 
 call_current_wifi_gui() { 
   current_wifi_ssid 
   call_qr_gui 
 } 
  
 #WiFi Command from terminal 
 call_wifi_terminal() { 
   IFS=$'\r\n' GLOBIGNORE='*' command eval  'wifilist=($(nmcli  -g NAME,TYPE connection | grep 802-11-wireless | cut -f1 -d":"))' 
   OLD_IFS=$IFS 
   IFS=$'\n' 
   for l in ${wifilist[@]}; do 
     array[$i]=$l 
     i=$(($i + 1)) 
   done 
  
   i=0 
   for m in ${array[@]}; do 
     echo 
     echo "$((i++))) $(basename "$m")" 
   done 
   IFS=$OLD_IFS 
  
   echo "" 
   echo -e "${BLUE}===========================================${RESET}" 
   echo -e "${BOLD}${WHITE}please choose WiFi ssid ${RESET}" 
   echo -e "${BLUE}===========================================${RESET}" 
   read -e wifissid 
   WIFIS=${array[$wifissid]} 
   echo -e "${BLUE}===========================================${RESET}" 
   echo -e "\nYou choose SSID is: $WIFIS\n ${RESET}" 
   echo -e "${BLUE}===========================================${RESET}" 
   terminal_qr 
 } 
  
 terminal_qr() { 
   call_wifi_pass 
   qrencode -o - -t UTF8 "WIFI:S:$WIFIS;P:$KEEY;$PSSK$H;" 
   echo  
 } 
  
  
 current_wifi_ssid() { 
   WIFIS="$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\: -f2 | tr -d '\r\n')" 
   echo -e "${BLUE}===========================================${RESET}" 
   echo -e "\nYou current active SSID is:${BOLD}${RED} $WIFIS\n ${RESET}" 
   echo -e "${BLUE}===========================================${RESET}" 
 } 
  
 #Data Extractor nmcli version 
 call_wifi_pass() { 
   SSID="$WIFIS" 
   KEEY=$(nmcli -g 802-11-wireless-security.psk  -s connection show "$WIFIS") 
   PSK=$(nmcli -g 802-11-wireless-security.key-mgmt  connection show "$WIFIS") 
   HIDN=$(nmcli -g 802-11-wireless.hidden connection show "$WIFIS") 
  
   if [[ "$PSK" == *"wpa"* ]]; then 
     PSSK="T:WPA;" 
   elif 
     [[ "$PSK" == "wep" ]] 
   then 
     PSSK="T:WEP;" 
   else 
    PSSK="" 
   fi 
   if [[ "$HIDN" == *"yes"* ]]; then 
       H="H:true;" 
   else 
     H="" 
   fi 
   echo -e "${GREEN}" 
   echo "" 
   echo "SSID:    $SSID" 
   echo "PASS:    $KEEY" 
   echo "TYPE:    $PSSK" 
   echo "HIDE:    $H" 
   echo "" 
   echo -e "${RESET}" 
 } 
  
 call_wifi_scan() { 
   # Vars 
   wifiqrdata='' 
   # Current directory to var 
   # tmp data-matrix holder 
   cwd="/tmp/" 
   qr_data="$cwd/wifi-qr-scan" 
   zbarcam --raw --prescale=320x240 /dev/video0 >$qr_data & 
  
   # Last job running in background eg. zbarcam 
   pid=$! 
  
   # Sleep loop until $qr_data file has content 
   while [[ ! -s $qr_data ]]; do 
     sleep 1 
     pgrep -x zbarcam >/dev/null && echo "Still Scanning" || exit 0 
     # cleanup - add a trap that will remove $qr_data and kill zbarcam 
     # if any of the signals - SIGHUP SIGINT SIGTERM it received. 
     trap "rm -f $qr_data ; kill -s 9 $pid; exit" SIGHUP SIGINT SIGTERM 
   done 
  
   kill -s 9 $pid 
   wifiqrdata=$(cat $qr_data) 
   rm -f $qr_data 
  
   # Check if the QR contains WiFi data or not 
   if echo $wifiqrdata | grep --quiet ^WIFI; then 
     ## Go Go GUI and CLI Mod 
     # ssid & key are not always in the same sequence - fix by using a dict and cut identifier for first key 
     declare -A wifiqrcred 
     wifiqrcred+=([$(echo $wifiqrdata | cut -b 6- | awk -F';' '{print $1}' | cut -d":" -f1)]=$(echo $wifiqrdata | cut -b 6- | awk -F';' '{print $1}' | cut -d":" -f2)) 
     wifiqrcred+=([$(echo "$wifiqrdata" | awk -F';' '{print $2}' | cut -d":" -f1)]=$(echo "$wifiqrdata" | awk -F';' '{print $2}' | cut -d":" -f2)) 
     wifiqrcred+=([$(echo "$wifiqrdata" | awk -F';' '{print $3}' | cut -d":" -f1)]=$(echo "$wifiqrdata" | awk -F';' '{print $3}' | cut -d":" -f2)) 
     wifiqrcred+=([$(echo "$wifiqrdata" | awk -F';' '{print $4}' | cut -d":" -f1)]=$(echo "$wifiqrdata" | awk -F';' '{print $4}' | cut -d":" -f2)) 
  
     QSSID=${wifiqrcred[S]} 
     QKEES=${wifiqrcred[P]} 
     QHIDE=${wifiqrcred[H]} 
     QTYPE=${wifiqrcred[T]} 
  
     if [[ "$QHIDE" == "true" ]]; then 
       echo -e "${GREEN}==================${RESET}" 
       echo -e "${BOLD}${WHITE}It's is HIDDEN ${RESET}" 
       echo -e "${GREEN}==================${RESET}" 
  
     elif nmcli device wifi list | grep -w "$QSSID"; then 
       echo -e "${GREEN}==================${RESET}" 
       echo -e "${BOLD}${WHITE}$QSSID is Online ${RESET}" 
       echo -e "${GREEN}==================${RESET}" 
       QSSIDO=ON 
  
     else 
       echo -e "${RED}==================${RESET}" 
       echo -e "${BOLD}${WHITE}Can't find $QSSID ${RESET}" 
       echo -e "${RED}==================${RESET}" 
       QSSIDO=OFF 
     fi 
  
   else 
     echo -e "${RED}==================${RESET}" 
     echo -e "${BOLD}${WHITE}It's not WiFi QR ${RESET}" 
     echo -e "${RED}==================${RESET}" 
     echo -e "${BLUE}==================${RESET}" 
     echo -e "${BOLD}${BLUE} $wifiqrdata ${RESET}" 
     echo -e "${BLUE}==================${RESET}" 
     QSSIDO=NOWIFI 
   fi 
  
 # key-mgmt type convert 
  
   if [[ -z "$QTYPE" ]] ; then 
     NTYPE="none" 
   elif [[ "$QTYPE" == "WEP" ]] ; then 
     NTYPE="ieee8021x" 
   elif [[ "$QTYPE" == "WPA" ]] ; then 
     NTYPE="wpa-psk" 
   else 
     echo "unknow or need to add key-mgmt type" 
   fi 
  
  
   # Append scan results to file 
   #echo $wifiqrdata >> $ScanResult 
 } 
  
  
 call_wifi_scan_terminal() { 
   call_wifi_scan 
      if [[ "$QSSIDO" == "NOWIFI" ]]; then 
         exit 0 
      elif [[ "$QHIDE" == "true" ]]; then 
         scan_connect_hidden 
      elif [[ "$QSSIDO" == "ON" ]]; then 
         scan_connect 
      else 
         echo "Can't find Network and Can't Connect" 
         exit 0 
      fi 
 } 
  
 call_wifi_scan_gui() { 
   call_wifi_scan 
   # Function with QR data 
   if [[ "$QSSIDO" =~ "ON" ]]; then 
     zenity --question --title="Connect to WiFi" --text="Connect to '$QSSID'?" --width=200 --height=120 --icon-name=network-wireless 2>/dev/null 
     if [ $? = 0 ]; then 
       scan_connect 
     else 
       exit 
     fi 
   elif [[ "$QSSIDO" =~ "OFF" ]]; then 
     CHOICE=$(zenity --list \ 
       --title="Can't find WiFi" \ 
       --text="Choose:" \ 
       --radiolist \ 
       --width=400 --height=180 \ 
       --column="Check" --column="Option" \ 
       --icon-name=network-wireless-offline \ 
       TRUE "Retry scanning internally" \ 
       FALSE "Retry submitting another QR Code" ) 
     if [[ "$CHOICE" =~ "Retry scanning internally" ]]; then 
       echo e "${BOLD}Scanning in progess ... ${Reset}" 
       nmcli radio wifi off 
       sleep 5 
       scan_connect 
       if [ $? != 0 ]; then 
         echo -e "${RED}==================${RESET}" 
         echo -e "${BOLD}${WHITE}Can't find $QSSID ${RESET}" 
         echo -e "${RED}==================${RESET}" 
         exit 
       fi 
     elif [[ "$CHOICE" =~ "Retry submitting another QR Code" ]]; then 
       call_wifi_scan_gui 
     else 
       exit 
     fi 
   elif [[ "$QHIDE" =~ "true" ]]; then 
     zenity --question --title="Connect to Hidden WiFi" --text="Connect to '$QSSID'?" --width=200 --height=120 --icon-name=network-wireless 2>/dev/null 
     if [ $? = 0 ]; then 
       scan_connect_hidden 
     else 
       exit 
     fi 
   fi 
 } 
  
 scan_connect() { 
   nmcli radio wifi on 
   nmcli dev wifi rescan >/dev/null 2>&1 
   nmcli dev wifi connect "$QSSID" password "$QKEES" >/dev/null 2>&1 
 } 
  
 scan_connect_hidden() { 
   nmcli radio wifi on 
   nmcli con delete "$QSSID" >/dev/null 2>&1 
   nmcli con add type wifi con-name "$QSSID" ssid "$QSSID" >/dev/null 2>&1 
   nmcli con modify "$QSSID" wifi-sec.key-mgmt "$NTYPE" >/dev/null 2>&1 
   nmcli con modify "$QSSID" wifi-sec.psk "$QKEES" >/dev/null 2>&1 
   nmcli con up "$QSSID" >/dev/null 2>&1 
 } 
  
 case $1 in 
  
 [Tt]) 
   echo "start using wifi to qr" 
   call_wifi_terminal 
   ;; 
 [Cc]) 
   echo "start using wifi to qr" 
   call_wifi_gui 
   ;; 
 [Gg]) 
   echo "go go gui" 
   main_menu 
   ;; 
 [Ss]) 
   echo "qr scan" 
   call_wifi_scan_terminal 
   ;; 
 [Qq]) 
   echo "qr scan with gui" 
   call_wifi_scan_gui 
   ;; 
 [Vv]) 
    echo -e "${GREEN}==================${RESET}" 
    echo -e "${BOLD}${WHITE} WiFI-QR v $VERSION ${RESET}" 
    echo -e "${GREEN}==================${RESET}" 
   ;; 
 *) 
   echo -e "\nInvalid input\n 
         Please use        g for GUI Main Menu  
                         c for WiFi QR Create GUI 
                         t for WiFi QR Create Terminal 
                         s for QR Scan and Auto Connect WiFi 
                         q for QR Scan and Connect WiFi GUI 
                         v for WiFi-QR Version is $VERSION 
                 " 
   nmcli device wifi show-password 
   ;; 
 esac
