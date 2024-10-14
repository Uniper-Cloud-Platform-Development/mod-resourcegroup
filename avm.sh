#!/bin/bash

# Ensure the script stops if an error occurs
set -e

echo "Running AVM Autofix..."

# Replace this with your specific autofix commands
echo "Running terraform fmt to format files..."
terraform fmt -recursive


# Check if any files were modified
if [[ -n $(git status -s) ]]; then
  echo "Changes detected after running autofix."
  git status
else
  echo "No changes detected."
fi