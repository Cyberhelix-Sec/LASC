#!/bin/bash

clear

#FILE PATH TO LOOK PROMPT
printf "\nEnter your path to look for: "
read PATH_TO_LOOK

#FILE SIGNATURE KEYWORD PROMPT
printf "\nEnter file signature keyword: "
read SIG_TO_LOOK

#DIRECTORY NAME PROMPT
printf "\nEnter name of the project directory: "
read DIR_NAME

mkdir "$DIR_NAME"
cd "$DIR_NAME"
file "$PATH_TO_LOOK"/* >> magicBytesAnalysis.txt

grep -v "$SIG_TO_LOOK"/* magicBytesAnalysis.txt >> not"$SIG_TO_LOOK".txt
grep "empty" not"$SIG_TO_LOOK".txt >> emptyFiles.txt
grep "data" not"$SIG_TO_LOOK".txt >> rawDataFiles.txt
grep -v 'empty\|data' not"$SIG_TO_LOOK".txt >> other.txt
