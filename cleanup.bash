#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

org=jenkins-oscar
rootdir=~/git-repos
app_name=devtest

echo -e "${GREEN}deleting jx environment github repositories...\n"
for repo in $(jx get env -o json | jq -r '.items[].spec.source.url | select(.!=null) | sub(".*/";"") ')
do  
    echo -e "${RED}$org/"$repo"${NOCOLOR}"
    #hub delete $org/"$repo" -y
done

echo -e "\n${GREEN}deleting local repositories...\n"
echo -e "${RED}$rootdir/"$app_name"${NOCOLOR}"
#rm -rf "$rootdir/$app"