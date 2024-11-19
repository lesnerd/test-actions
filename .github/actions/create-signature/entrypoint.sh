#!/bin/bash

# entrypoint.sh

set -e

# Capture input parameters
PACKAGE_NAME=$1
PACKAGE_REPO_NAME=$2
PRIVATE_KEY=$3

if [ -z "$PRIVATE_KEY" ]; then
  PRIVATE_KEY=$PRIVATE_KEY
fi

# Set package version from GitHub run number
PACKAGE_VERSION="${RUN_NUMBER}"

# Generate JSON signature file
echo '{ "actor": "'"${GITHUB_ACTOR}"'", "date": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'" }' > sign.json

# Run the jf evd command
jf evd create --package-name "$PACKAGE_NAME" --package-version "$PACKAGE_VERSION" --package-repo-name "$PACKAGE_REPO_NAME" \
  --key "$PRIVATE_KEY" \
  --predicate ./sign.json --predicate-type https://jfrog.com/evidence/signature/v1
