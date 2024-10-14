#!/bin/bash

# Ensure the script stops if an error occurs
set -e

echo "Running AVM Autofix..."

# Example of applying fixes (e.g., running Terraform format command)
# Replace this with your specific autofix commands
echo "Running terraform fmt to format files..."
terraform fmt -recursive

# Add more commands as needed to apply your fix
# For example, running a pre-commit hook or other linting/fixing commands

# Check if any files were modified
if [[ -n $(git status -s) ]]; then
  echo "Changes detected after running autofix."
  git status
else
  echo "No changes detected."
fi


# #!/usr/bin/env sh

# usage () {
#   echo "Usage: avm <make target>"
# }

# CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-docker}

# if [ ! "$(command -v "$CONTAINER_RUNTIME")" ]; then
#     echo "Error: $CONTAINER_RUNTIME is not installed. Please install $CONTAINER_RUNTIME first."
#     exit 1
# fi

# if [ -z "$1" ]; then
#     echo "Error: Please provide a make target. See https://github.com/Azure/tfmod-scaffold/blob/main/avmmakefile for available targets."
#     echo
#     usage
#     exit 1
# fi

# # Mount .azure directory if it exists
# AZURE_VOLUME=""
# if [ -d "$HOME/.azure" ]; then
#   AZURE_VOLUME="-v $HOME/.azure:/home/runtimeuser/.azure"
# fi

# # Check if we are running in a container
# # If we are then just run make directly
# if [ -z "$AVM_IN_CONTAINER" ]; then
#   $CONTAINER_RUNTIME run --pull always --user "$(id -u):$(id -g)" --rm $AZURE_VOLUME -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v "$(pwd)":/src -w /src -e GITHUB_REPOSITORY -e ARM_SUBSCRIPTION_ID -e GITHUB_REPOSITORY_OWNER mcr.microsoft.com/azterraform make "$1"
# else
#   make "$1"
# fi
