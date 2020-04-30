#!/usr/bin/env bash

# make these variables parameters
org=jenkins-oscar
rootdir=~/git-repos
app_name=skiapp

app_version="0.0.39"

# the google project
PROJECT=jx-development
IMAGE=$app_name

# PRO TIP: If you forgot the credentials for Chartmuseum, you can get them by `jx rsh` into the pod, then executing
# `env | grep BASIC`
# then base64 encode them like so
#
# echo -n 'username:mypassword' | base64
# and add the output to the CHARTMUSEUM_CREDENTIALS credentails below

CHARTMUSEUM_CREDENTIALS=YWRtaW46UGFzc3dvcmQx
CHARTMUSEUM_URL=http://chartmuseum-jx.34.82.253.180.nip.io

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"


# delete local repos
#echo -e "\n${GREEN}deleting local repo...\n"
#rm -rf "$rootdir/$app_name"

echo -e "\n${GREEN}deleting Jenkins X application...\n"
jx delete application "$app_name"

echo -e "\n${GREEN}container image...\n"

for TAG in $(gcloud container images list-tags \
    gcr.io/$PROJECT/$IMAGE \
    --format='get(tags)')
do
  gcloud container images \
    delete gcr.io/$PROJECT/$IMAGE:$TAG \
    --quiet
done

# garbage collection
echo -e "\n${GREEN}perform garbage collection (pods, previews, helm)..\n"
jx gc previews && jx gc pods && jx gc helm && jx gc activities

#echo -e "\n${GREEN}deleting remote github repo...\n"
#hub delete "$org/$app_name" -y



# 4) delete helm chart, given a version (get version by executing jx get applications)
# We should iterate through versions by executing 
# NOTE, be sure to add BASIC AUTH USERNAME AND PASSWORD TO REQUEST FIRST

# echo -e "\n${GREEN}Getting app version from Chartmuseum...\n"
# for VERSION in $(curl --location --request GET $CHARTMUSEUM_URL"/api/charts/$app_name" \
# --header 'Authorization: Basic '$CHARTMUSEUM_CREDENTIALS)
# do
#     echo "$VERSION" 
# done


#echo -e "\n${GREEN}deleting Chartmuseum app version...\n"
#curl --location --request DELETE $CHARTMUSEUM_URL"/api/charts/$app_name/"$app_version \
#--header 'Authorization: Basic '$CHARTMUSEUM_CREDENTIALS


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