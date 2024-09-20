#!/bin/bash

# This script will create a new Git branch in a specific format
# Input: newBranchName.sh PROJ-123 "Implement feature X"
# Output: git checkout -b PROJ-123/implement-feature-x

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <JIRA-ID> <Description>"
  exit 1
fi

# Assign arguments to variables
jira_id="$1"
description="$2"

# Convert the description to lowercase and replace spaces with hyphens
formatted_description=$(echo "$description" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Combine the JIRA ID and formatted description into the desired format
formatted_string="${jira_id}/${formatted_description}"

# Output the formatted string
git checkout -b "$formatted_string"