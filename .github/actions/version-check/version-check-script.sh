#!/bin/bash

# Path to the version JSON file
VERSION_FILE="version.json"

# Check if the JSON version file exists
if [ ! -f "$VERSION_FILE" ]; then
  echo "Version file not found!"
  exit 1
fi

# Extract the current version from the JSON file
CURRENT_VERSION=$(jq -r '.version' "$VERSION_FILE")

# Fetch all tags (ensure tags are up to date)
git fetch --tags

# Get the latest git tag version using git tag with sorting
LATEST_VERSION=$(git tag --sort=-v:refname | head -n 1)

if [ -z "$LATEST_VERSION" ]; then
  echo "No git tags found. Assuming initial version."
  LATEST_VERSION="0.0.0"
fi

# Compare the versions
if [ "$CURRENT_VERSION" == "$LATEST_VERSION" ]; then
  echo "Version is up to date: $CURRENT_VERSION"
else
  echo "Version mismatch! Current: $CURRENT_VERSION, Latest tag: $LATEST_VERSION"
  exit 1
fi
