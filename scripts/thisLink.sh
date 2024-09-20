#!/bin/bash

# This script will create a Markdown link from a URL
# Input: thisLink.sh https://example.com "Example Website"
# Output: [Example Website](https://example.com)

# Additionally, the second argument is optional, and if not provided, the default value is "this"
# Input: thisLink.sh https://example.com
# Output: [this](https://example.com)

# Check if at least one argument is provided
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 <url> [text]"
  exit 1
fi

# Assign the argument to a variable
url="$1"
# Check if a second argument is provided, otherwise use "this"
text="${2:-this}"

# Output the formatted string
echo "[$text]($url)"