#!/usr/bin/env bash

# make these variables parameters
org=jenkins-oscar
rootdir=~/git-repos
app_name=testapp1

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#rm -rf "$rootdir/$app"
# delete the cluster environment repositories
# echo -e "${GREEN}deleting jx environment github repositories...\n"
# for repo in $(jx get env -o json | jq -r '.items[].spec.source.url | select(.!=null) | sub(".*/";"") ')
# do  
#     echo -e "${RED}$org/"$repo"${NOCOLOR}"
#     #hub delete $org/"$repo" -y
# done

# delete applications
# echo -e "${GREEN}deleting jx environment github repositories...\n"
# for repo in $(jx get env -o json | jq -r '.items[].spec.source.url | select(.!=null) | sub(".*/";"") ')
# do  
#     echo -e "${RED}$org/"$repo"${NOCOLOR}"
#     #hub delete $org/"$repo" -y
# done

# delete local repos
echo -e "\n${GREEN}deleting local repo...\n"
rm -rf "$rootdir/$app_name"

echo -e "\n${GREEN}deleting Jenkins X application...\n"
jx delete application "$app_name"


# garbage collection
echo -e "\n${GREEN}perform garbage collection (pods, previews, help)..\n"
jx gc previews && jx gc pods && jx gc helm && jx gc activities

echo -e "\n${GREEN}deleting github repo...\n"
hub delete "$org/$app_name" -y