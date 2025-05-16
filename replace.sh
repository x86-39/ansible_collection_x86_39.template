#!/bin/bash

if [ -z "$1" ]; then
    echo "Enter collection name: "
    read NEW_COLLECTION_NAME
else
    NEW_COLLECTION_NAME=$1
fi

if [ -z "$2" ]; then
    if [ -z "$GITHUB_USER" ]; then
        echo "Enter github user: "
        read GITHUB_USER
    fi
else
    GITHUB_USER="$2"
fi

if [ -z "$3" ]; then
    if [ -z "$GALAXY_NAMESPACE" ]; then
        echo "Enter Ansble Galaxy namespace: "
        read GALAXY_NAMESPACE
    fi
else
    GALAXY_NAMESPACE="$3"
fi

if [ -z "$GALAXY_API_KEY" ]; then
    echo "Enter galaxy api key: "
    read GALAXY_API_KEY
fi

# Assumes repo is named ansible_collection_${GITHUB_USER}.${NEW_ROLE_NAME}
gh secret set GALAXY_API_KEY -R ${GITHUB_USER}/ansible_collection_${GALAXY_NAMESPACE}.${NEW_COLLECTION_NAME} -a actions -b ${GALAXY_API_KEY}

find roles docs meta plugins galaxy.yml changelogs LICENSE README.md \
    -type f -exec \
    sed -i -e "s/x86_39/${GALAXY_NAMESPACE}/g" \
    -e "s/x86-39/${GITHUB_USER}/g" \
    -e "s/template/${NEW_COLLECTION_NAME}/g" {} + # Do not run this more than once

# Remove this section from README.md
sed -i "/Collection Structure/Q" README.md

rm ./replace.sh

cd ../../
