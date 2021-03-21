#!/bin/bash


dir=`pwd`; 
cd ~/Subtaken/subtakeover/bounty-targets-data/; 
git pull; 
cd $dir; 
cp ~/Subtaken/subtakeover/bounty-targets-data/data/wildcards.txt ./; cat wildcards.txt | sed 's/^*.//g' | grep -v '*' > wildcards_without_stars.txt; 
while read host; 
   do file=$host && file+="_subfinder.out"; 
   ~/go/bin/subfinder -o ~/Subtaken/subresults/$file -d $host; 
done < ./wildcards_without_stars.txt


cat ./*.out > all_subdomains.lst; 
~/go/bin/SubOver -l ./all_subdomains.lst -timeout 5 -o subover.out;

python ~/Subtaken/notify.py
