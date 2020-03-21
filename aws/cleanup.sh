#!/bin/bash

# AWS credentials should be set via env vars before running this.
# AWS CLI must also be installed.

# call script as follows  
# . ./cleanup.sh && delete_s3_buckets

delete_stacks() {
for stack in $(aws cloudformation list-stacks | jq -r  '.StackSummaries [].StackName')

do

echo "$stack \n"
aws cloudformation wait stack-delete-complete --stack-name "$stack"        
 
done

}

delete_s3_buckets() {

    for bucket in $(aws s3api list-buckets | jq -r '.Buckets[].Name') 

    do
        echo "$bucket \n"
        aws s3 rb s3://$bucket --force
    done
}

