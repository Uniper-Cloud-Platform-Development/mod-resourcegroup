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

# Get the latest git tag version
LATEST_VERSION=$(git describe --tags --abbrev=0)

# Compare the versions
if [ "$CURRENT_VERSION" == "$LATEST_VERSION" ]; then
  echo "Version is up to date: $CURRENT_VERSION"
else
  echo "Version mismatch! Current: $CURRENT_VERSION, Latest: $LATEST_VERSION"
  exit 1
fi