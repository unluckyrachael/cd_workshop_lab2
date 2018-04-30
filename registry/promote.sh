#!/usr/bin/env bash
#
# This will find the latest tag and then set it on s3. The training instances will pick up the change and then
# install the latest docker image based on that tag.
#
#
set -e

# Get the latest tag from the registry
tag=$(curl http://registry.roundtower.io:5000/v2/${1}/lab1/tags/list | jq -r .tags[] | sort | tail -1)

# Log what we found
echo "tag is ${tag}"

# Append that number to our "Lab1" string and push it to a file
echo lab1:${tag} > path.txt

# Copy that file to s3
aws s3 cp path.txt "s3://cd-workshop/${1}/"

