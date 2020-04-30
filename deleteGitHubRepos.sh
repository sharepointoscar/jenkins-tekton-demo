#!/usr/bin/env bash

# make these variables parameters
gh_org=jenkins-oscar
gh_user=jenkinsx-bot-sposcar
token="1f7556d5a62deea377702feaba3c75c4d4675ade"

# get all users repo
#curl -H "Authorization: token ${token}" https://api.github.com/orgs/$gh_org/repos 

# GET USER REPOS
curl -H "Authorization: token ${token}" https://api.github.com/users/${gh_user}/repos | jq -r '.[].name' > user_repo_list.txt

# if you have environment variables
#curl -H "Authorization: token $token" https://api.github.com/users/$gh_user/repos | jq -r '.[].name'

while read r;do curl -XDELETE -H "Authorization: token ${token}" https://api.github.com/repos/${gh_user}/$r;done < user_repo_list.txt

# Gets a list of the repositories you own (not ones granted through organisation)
# GET ORG REPOS 
#curl -H "Authorization: token ${token}" https://api.github.com/orgs/$gh_org/repos  | jq -r '.[].git_url '
