#!/bin/bash

# Define the path to the service account file
SERVICE_ACCOUNT_FILE=".keys/serviceAccount.json"

# Ensure the service account file exists
if [ ! -f "$SERVICE_ACCOUNT_FILE" ]; then
    echo "Service account file $SERVICE_ACCOUNT_FILE does not exist."
    exit 1
fi

# Read the contents of the service account file
CREDENTIALS=$(<"$SERVICE_ACCOUNT_FILE")

# Start the Docker container with the FIREBASE_CREDENTIALS environment variable
docker run -e FIREBASE_CREDENTIALS="$CREDENTIALS" -p 8188:8188 drip-comfyui-dev
