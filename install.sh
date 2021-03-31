#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt install -y libpcap-dev;
sudo apt-get install python3 -y;
sudo apt-get install python3-pip -y;
sudo apt-get install -y python-pip -y;
sudo apt-get install ruby -y;
sudo apt-get install screen -y;
sudo apt-get install git -y;
sudo pip install discord-webhook;

mkdir ~/Subtaken/subtakeover;
mkdir ~/Subtaken/subtakeover;

#install go
echo "${red}Installing Golang${reset}"
sudo wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz;
sudo tar -xvf go1.16.2.linux-amd64.tar.gz;
sudo mv go /usr/local;
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
sudo rm -rf go1.16.2.linux-amd64.tar.gz;
sleep 2
echo "${green}Done...!!${reset}"


cd ~/Subtaken/subtakeover;
git clone https://github.com/arkadiyt/bounty-targets-data;
git clone https://github.com/0xdeviner/Bug-Bounty-RDP.git;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
go get github.com/Ice3man543/SubOver;
cd ~/go/bin;
wget https://raw.githubusercontent.com/Ice3man543/SubOver/master/providers.json; 
cd ~/
go get github.com/haccer/subjack

mkdir $HOME/go/src
mkdir $HOME/go/src/github.com
mkdir $HOME/go/src/github.com/haccer
mkdir $HOME/go/src/github.com/haccer/subjack
cd $HOME/go/src/github.com/haccer/subjack
wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json
cd ~/

source ~/.bashrc

cd ~/Subtaken/
chmod +x *
cd ~/
## make sure to go here and update username pass for bellow listed services $HOME/.config/subfinder/config.json

##virustotal.com
##community.riskiq.com
##securitytrails.com
##riddler.io
##censys.io
##shodan.io
##github.com


