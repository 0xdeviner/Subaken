#!/bin/bash


dir=`pwd`; 
cd ~/Subtaken/subtakeover/bounty-targets-data/; 
git pull; 
cd $dir; 
cp ~/Subtaken/subtakeover/bounty-targets-data/data/wildcards.txt ./; cat wildcards.txt | sed 's/^*.//g' | grep -v '*' > wildcards_without_stars.txt; 
cat ~/Subtaken/subtakeover/Bug-Bounty-RDP/programs.txt | tee -a wildcards_without_stars.txt;
while read host; 
   do file=$host && file+="_subfinder.out"; 
   ~/go/bin/subfinder -o ~/Subtaken/subresults/$file -d $host; 
done < ./wildcards_without_stars.txt


cat ~/Subtaken/subresults/*.out > all_subdomains.lst;
cd ~/go/bin 
SubOver -l ~/Subtaken/all_subdomains.lst -timeout 5 > subover.out;
cd ~/

subjack -w ~/Subtaken/all_subdomains.lst -t 1000 -o ~/Subtaken/subjack.out;

python ~/Subtaken/notify.py
