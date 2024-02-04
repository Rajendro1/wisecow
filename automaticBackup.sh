#!/bin/bash

# Automated Backup Script

# Local directory to back up
LOCAL_DIR="/path/to/local/dir"

# Remote server details
REMOTE_SERVER="your_remote_server"
REMOTE_USER="remote_user"
REMOTE_DIR="/path/to/remote/backup/dir"

# Backup using rsync
echo "Starting backup of ${LOCAL_DIR} to ${REMOTE_SERVER}:${REMOTE_DIR}"
rsync -avz --delete ${LOCAL_DIR} ${REMOTE_USER}@${REMOTE_SERVER}:${REMOTE_DIR}

# Check if rsync command was successful
if [ "$?" -eq "0" ]; then
  echo "Backup completed successfully."
else
  echo "Backup failed. Check logs for errors."
fi
