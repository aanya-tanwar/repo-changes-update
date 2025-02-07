#!/bin/bash

REPO_DIR="/home/aanya.tanwar@simform.dom/repo-changes-update"
LOG_FILE="/home/aanya.tanwar@simform.dom/git_update.log"
cd $REPO_DIR

git fetch origin >> "$LOG_FILE" 2>&1

git status | grep -q 'Your branch is behind'

if [ $? -eq 0 ]; then
    echo "[ $(date) ] Your branch is behind. Pulling latest changes..." >> "$LOG_FILE"
    git pull origin main >> "$LOG_FILE" 2>&1
else
    echo "[ $(date) ] Your branch is up to date with origin/main." >> "$LOG_FILE"
fi

