#!/usr/bin/env bash

# create cluster in GKE
jx create cluster gke --tekton --no-tiller --default-admin-password=Password1 -n oscarcluster