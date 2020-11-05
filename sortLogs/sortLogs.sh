#!/bin/bash

#START BANNER
echo -e "\e[32m ▄▀▀▀▀▄  ▄▀▀▀▀▄   ▄▀▀▄▀▀▀▄  ▄▀▀▀█▀▀▄  ▄▀▀▀▀▄    ▄▀▀▀▀▄   ▄▀▀▀▀▄    ▄▀▀▀▀▄"
echo -e "█ █   ▐ █      █ █   █   █ █    █  ▐ █    █    █      █ █         █ █   ▐"
echo -e "   ▀▄   █      █ ▐  █▀▀█▀  ▐   █     ▐    █    █      █ █    ▀▄▄     ▀▄"
echo -e "▀▄   █  ▀▄    ▄▀  ▄▀    █     █          █     ▀▄    ▄▀ █     █ █ ▀▄   █"
echo -e " █▀▀▀     ▀▀▀▀   █     █    ▄▀         ▄▀▄▄▄▄▄▄▀ ▀▀▀▀   ▐▀▄▄▄▄▀ ▐  █▀▀▀"
echo -e " ▐               ▐     ▐   █           █                ▐          ▐"
echo -e "                           ▐           ▐"

echo -e "\e[34mby mwm0s\e[0m"
printf "\n"
#END BANNER
echo -e "\e[32mType "help" for a help menu\e[0m"

while true 
do

  
  printf "\e[32msortLogs> \e[31m"
  read CMND

  printf "\e[0m"


  if [ "$CMND" == "1" ];
    then
      printf "\e[32mEnter the name of your logs: "
      read LOG_NAME

      printf "Enter the starting number of your logs (must be in a format like: foo.bar.x): "
      read START_NUMBER
 
      printf "Enter the ending number of your logs: "
      read END_NUMBER

      let END_NUMBER=END_NUMBER+1
      while [  $START_NUMBER -lt $END_NUMBER ]; do
        
        touch $LOG_NAME.merged
        cat $LOG_NAME.$START_NUMBER >> $LOG_NAME.merged
        echo -e "\e[25m Merging $LOG_NAME.$START_NUMBER \e[32m"
        #exec 2>/dev/null 

        let START_NUMBER=START_NUMBER+1 
        
      done
      
      sort -k1M -k2n $LOG_NAME.merged >> $LOG_NAME.sorted
  fi

  if [ "$CMND" == "exit" ];
    then
      break
  fi
  #DISPLAY THE HELP MENU
  if [ "$CMND" == "help" ];
    then
      cat ./helpMenu.txt
  fi
 
  #CLEAR FUNCTION
  if [ "$CMND" == "clear" ];
    then
      clear
  fi

done 

echo -e "\n\e[32mBye Bye!"
