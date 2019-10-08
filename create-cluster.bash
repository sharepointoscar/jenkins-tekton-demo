#!/usr/bin/env bash

# create cluster in GKE, with public Github repos
jx create cluster gke --tekton --no-tiller --default-admin-password=Password1 -n jxwebinar01 --git-public