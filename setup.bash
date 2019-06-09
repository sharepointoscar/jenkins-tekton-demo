#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
app_name=skiersapp
rootdir=~/git-repos

echo -e "\n${GREEN}cloning root app repository...\n"
# clone only the last commit from the master branch of the skiapp
git clone --depth 1 -b master git@github.com:jenkins-oscar/skiapp.git "$app_name"

echo -e "\n${GREEN}removing old git settings...\n"
cd "$rootdir/$app_name" && rm -rf .git


echo -e "\n${GREEN}Initializing Git and adding all files...\n"
git init && git add .

echo -e "\n${GREEN}commit and setup remote branch...\n"
git commit -m "Initial Commit" && git remote add origin git@github.com:jenkins-oscar/$app_name.git

echo -e "\n${GREEN}creating new app repository...\n"
# create the repo on github
hub create "$org/$app_name".git

echo -e "\n${GREEN}pushing local new repo contents...\n"
git push -u origin master

# first remove the local repo we created, before importing into Jenkins X (it will create a folder with the repo name wherever we execute the command)
echo -e "\n${GREEN}removing local clone, so we can import from git url instead...\n"
cd ../ && rm -rf $app_name/

echo -e "\n${GREEN}importing app into Jenkins X!\n"
# in the root of the skiapp directory
jx import --url git@github.com:jenkins-oscar/skiersapp.git --git-username=sharepointoscar