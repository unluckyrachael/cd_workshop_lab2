#!/usr/bin/env bash
#
# This will find the latest tag and then set it on s3
#
#
set -e

tag=$(curl http://registry.roundtower.io:5000/v2/${1}/lab1/tags/list | jq -r .tags[] | head -1)
echo lab1:${tag} > path.txt
aws s3 cp path.txt "s3://cd-workshop/${1}/"

