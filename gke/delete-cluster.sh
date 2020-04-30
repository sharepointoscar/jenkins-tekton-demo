#!/usr/bin/env bash
PROJECT=jx-development

# delete cluster
#gcloud container clusters delete tequila

# delete persistent volumes
for volume in $(gcloud compute disks list --filter="name~'\b(\w*tequila\w*)\b'" --format json | jq -r .[].name ) 
do
    echo deleting found volume: $volume
    gcloud compute disks delete $volume --quiet
done