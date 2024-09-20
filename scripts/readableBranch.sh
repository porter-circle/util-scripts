#!/bin/bash

# This script will create a readable branch name from a JIRA ID and description
# Input: readableBranch.sh PROJ-123/implement-feature-x
# Output: [PROJ-123] Implement Feature X

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <JIRA-ID/description>"
  exit 1
fi

# Assign the argument to a variable
input="$1"

# Extract the JIRA ID and description
jira_id=$(echo "$input" | cut -d '/' -f 1)
description=$(echo "$input" | cut -d '/' -f 2)

# Convert the jira id to all capitalized letters
formatted_jira_id=$(echo "$jira_id" | tr '[:lower:]' '[:upper:]')

# Convert the description to have capitalized words and replace hyphens with spaces
formatted_description=$(echo "$description" | tr '-' ' ' | awk '{for(i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) tolower(substr($i,2))} 1')

# Combine the JIRA ID and formatted description into the desired format
formatted_string="[$formatted_jira_id] $formatted_description"

# Output the formatted string
echo "$formatted_string"
