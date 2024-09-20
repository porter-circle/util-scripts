#!/bin/bash

# This script will create a Markdown link from a Jira ticket URL
# Input: jiraLink.sh https://jira.atlassian.com/browse/PROJ-123
# Output: [PROJ-123](https://jira.atlassian.com/browse/PROJ-123)

# Check if exactly one argument (the Jira ticket URL) is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <Jira ticket URL>"
  exit 1
fi

# Assign the argument to a variable
jira_url="$1"

# Extract the Jira issue key using awk
jira_key=$(echo "$jira_url" | awk -F '/browse/' '{print $2}')

# Check if the Jira key extraction was successful
if [ -z "$jira_key" ]; then
  echo "Invalid Jira URL provided."
  exit 1
fi

# Format the string as a Markdown link
formatted_string="[$jira_key]($jira_url)"

# Output the formatted string
echo "$formatted_string"