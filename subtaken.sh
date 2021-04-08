#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


dir=`pwd`; 
echo "${red}Pulling data!${reset}"
cd ~/Subtaken/subtakeover/bounty-targets-data/; 
git pull;
# cd ~/Subtaken/subtakeover/Bug-Bounty-RDP/;
# git pull;
echo "${green}done....!${reset}"
cd $dir; 
echo "${red}Gathering Targets!${reset}"
cp ~/Subtaken/subtakeover/bounty-targets-data/data/wildcards.txt ./; cat wildcards.txt | sed 's/^*.//g' | grep -v '*' > wildcards_without_stars.txt; 
#cat ~/Subtaken/subtakeover/Bug-Bounty-RDP/programs.txt | tee -a wildcards_without_stars.txt;
while read host; 
   do file=$host && file+="_subfinder.out"; 
   ~/go/bin/subfinder -o ~/Subtaken/subresults/$file -d $host; 
done < ./wildcards_without_stars.txt
echo "${green}done....!${reset}"

echo "${red}Started SubOver${reset}"
cat ~/Subtaken/subresults/*.out > all_subdomains.lst;
cd ~/go/bin 
SubOver -l ~/Subtaken/all_subdomains.lst -timeout 5 > ~/Subtaken/subover.out;
cd ~/
rm -rf ~/Subtaken/subresults

echo "${red}Starting Subtaken again!${reset}"
~/Subtaken/subtaken.sh
echo "${green}done....!${reset}"
