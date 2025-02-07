#!/bin/bash

# Define your repository and log file paths
REPO_DIR="/home/aanya.tanwar@simform.dom/repo-changes-update"
LOG_FILE="/home/aanya.tanwar@simform.dom/git_update.log"

# Change to the repository directory
cd $REPO_DIR

# Fetch the latest changes
git fetch origin >> "$LOG_FILE" 2>&1

# Check if the branch is behind
git status | grep -q 'Your branch is behind'

if [ $? -eq 0 ]; then
    echo "[ $(date) ] Your branch is behind. Pulling latest changes..." >> "$LOG_FILE"
    git pull origin main >> "$LOG_FILE" 2>&1
else
    echo "[ $(date) ] Your branch is up to date with origin/main." >> "$LOG_FILE"
fi

