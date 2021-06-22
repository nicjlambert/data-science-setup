#!/bin/bash

set -euxo pipefail

function systemBasicUpdate()
{
	echo "#### Basic ubuntu update"
	# Update the apt package index and Upgrade the Ubuntu system
	sudo apt-get update && sudo apt-get -y upgrade
}

function configureGit()
{
	echo "##### Configure Git"
        read -r -p "Enter Git User Name:" userName
        git config --global user.name $userName
        read -r -p "Enter GIT Email ID:" EmailID
        git config --global user.email $EmailID
	echo "Git configuration Detail:"
	git config --list
}

systemBasicUpdate

configureGit