#!/bin/bash
clear
#START BANNER
echo -e "\e[32m▒███████▒ ▄████▄    ▄████  ▒█████"  
echo -e "▒ ▒ ▒ ▄▀░▒██▀ ▀█   ██▒ ▀█▒▒██▒  ██▒"
echo -e "░ ▒ ▄▀▒░ ▒▓█    ▄ ▒██░▄▄▄░▒██░  ██▒"
echo -e "  ▄▀▒   ░▒▓▓▄ ▄██▒░▓█  ██▓▒██   ██░"
echo -e "▒███████▒▒ ▓███▀ ░░▒▓███▀▒░ ████▓▒░"
echo -e "░▒▒ ▓░▒░▒░ ░▒ ▒  ░ ░▒   ▒ ░ ▒░▒░▒░ "
echo -e "░░▒ ▒ ░ ▒  ░  ▒     ░   ░   ░ ▒ ▒░ "
echo -e "░ ░ ░ ░ ░░        ░ ░   ░ ░ ░ ░ ▒  "
echo -e "  ░ ░    ░ ░            ░     ░ ░  "

printf "\nhttps://github.com/mwmos\n\n"
#END BANNER

while true
do

  printf "Enter the full path of the directory\n"
  printf "Type "exit" or press CTRL+C to exit\n"
  printf "zcgo>"
  read  CMND

  if [ "$CMND" == "exit" ];
    then
      echo "Bye bye!!!"
      break
  fi
  zip -r $CMND.zip $CMND
  mkdir zcgo
  
  mv $CMND.zip ./zcgo
  cd zcgo

  gpg -c $CMND.zip
  #PASSWORD PROMPT

done
