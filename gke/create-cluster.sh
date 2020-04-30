#!/usr/bin/env bash

# create cluster in GKE, with public Github repos
jx create cluster gke --tekton --no-tiller --default-admin-password=Password1 -n githubconf --git-public

# create a cluster and prep for using jx boot
jx create cluster gke --skip-installation -n gitworld