#!/bin/bash

# --------------------------------------------
# Script: clone_repo.sh
# Author : Jatin Agrawal
# Date : 06-06-2025
# Description: Clones a public GitHub repository.
# Usage: ./clone_repo.sh https://github.com/user/repo
# --------------------------------------------

# Check if an argument (GitHub repo URL) is passed
if [ -z "$1" ]; then
    echo " Error: No GitHub repo URL provided."
    echo "Usage: ./clone_repo.sh https://github.com/username/repo"
    exit 1
fi

REPO_URL="$1"  # Store URL
REPO_NAME=$(basename -s .git "$REPO_URL")  # Extract repo name (remove .git if present)

# Attempt to clone the repo
echo " Cloning repository '$REPO_NAME'..."
git clone "$REPO_URL"

# Check exit status of git clone
if [ $? -eq 0 ]; then
    echo " '$REPO_NAME' cloned successfully."
else
    echo " Failed to clone the repository."
fi