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

# Install Required Packages
sudo apt install dirmngr gnupg apt-transport-https ubuntu-keyring ca-certificates software-properties-common -y

# import R GPG Key
wget -O- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/cran.gpg

# import the CRAN repository with the following comman
echo deb [signed-by=/usr/share/keyrings/cran.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/ | sudo tee /etc/apt/sources.list.d/cran.list

sudo apt update

# Install R Programming Language
echo "---- Install R"
sudo apt install --no-install-recommends r-base r-base-dev build-essential libapparmor1 gdebi-core

echo "---- Install RStudio"
cd ~/tmp
## version is current as at 12-07-2022
wget https://download1.rstudio.org/desktop/jammy/amd64/rstudio-2022.07.0-548-amd64.deb
sudo gdebi rstudio-2022.07.0-548-amd64.deb
rm rstudio-2022.07.0-548-amd64.deb

wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.0-548-amd64.deb
sudo gdebi rstudio-server-2022.07.0-548-amd64.deb
rm rstudio-server-2022.07.0-548-amd64.deb


}



function installPython()
{
echo "---- Install Python"

# To manage software packages for Python
sudo apt install -y python3-pip

#There are a few more packages and development tools to install 
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev

#Virtual environments enable you to have an isolated space on your server for Python projects
sudo apt install -y python3-venv

# activate virtual environment
# source mypython/bin/activate
#To decativate the virtual environment and use your original Python environment, simply type ???deactivate???.
}



#systemBasicUpdate

#configureGit

installR

#installPython
