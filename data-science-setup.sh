#!/bin/bash

set -euxo pipefail

function systemBasicUpdate()
{
	echo "---- Basic ubuntu update"
	# Update the apt package index and Upgrade the Ubuntu system
	sudo apt-get update && sudo apt-get -y upgrade
}

function configureGit()
# the user name/email is just used to track who made what changes
{
	echo "---- Configure Git"
        read -r -p "Enter Git User Name:" userName
        git config --global user.name $userName
        read -r -p "Enter GIT Email ID:" EmailID
        git config --global user.email $EmailID
	echo "Git configuration Detail:"
	git config --list
}

function installR()
{
echo "---- Install RStudio"
cd ~/tmp
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5001-amd64.deb
sudo gdebi rstudio-1.2.5001-amd64.deb
}

systemBasicUpdate

configureGit

installR