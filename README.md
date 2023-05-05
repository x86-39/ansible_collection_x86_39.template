# Ansible Collection - diademiemi.template

Documentation for the collection.

Collection Structure
--------------

This collection makes use of my [ansible_role_template](https://github.com/diademiemi/ansible_role_template) repository.  

A script `add-role.sh` is provided to add a new role to the collection. This will download the latest version of the template and generate a new role with the name specified.  

Usage:
```bash
export NEW_ROLE_NAME="NEW_NAME"
./add-role.sh ${NEW_ROLE_NAME}
```

Using Template
--------------
To use this template for a new role, run
```bash
export NEW_ROLE_NAME="NEW_NAME"
export GITHUB_USER="diademiemi"
export GALAXY_API_KEY="YOUR_API_KEY"

find . -type f -exec sed -i "s/diademiemi/${GITHUB_USER}/g" {} + # Do not run this more than once
find . -type f -exec sed -i "s/template/${NEW_ROLE_NAME}/g" {} + # Do not run this more than once

# Assumes repo is named ansible_role_${NEW_ROLE_NAME}
gh secret set GALAXY_API_KEY -R ${GITHUB_USER}/ansible_collection_${GITHUB_USER}.${NEW_COLLECTION_NAME} -a actions -b ${GALAXY_API_KEY}

# Remove this section from README.md
sed -i "/Collection Structure/Q" README.md
```

This is also provided as a script as `replace.sh`.  
