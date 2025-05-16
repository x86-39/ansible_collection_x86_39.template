Ansible Collection - x86_39.template
========================================
Documentation for the collection template.

Contents
========

Roles
------
Role | Description | CI Status
--- | --- | ---
<!-- [x86_39.template.EXAMPLE](./roles/template/) | Install EXAMPLE | [![Molecule test](https://github.com/x86-39/ansible_collection_x86_39.template/actions/workflows/ansible-role-EXAMPLE.yml/badge.svg)](https://github.com/x86-39/ansible_collection_x86_39.template/actions/workflows/ansible-role-EXAMPLE.yml) -->

Click on the role to see the README for that role.  

Collection Structure
--------------

This collection makes use of my [Ansible Role Template repository](https://github.com/x86-39/ansible_role_%74emplate.git).  The `add-role.sh` script downloads this Template and generates a new role with the name specified. If a `molecule/default/molecule.yml` file is present, it will be ran with GitHub Actions.  
<!-- I use %74 here to encode to a "t" so it doesnt get recursively replaced. The .git causes a redirect so you end up at the right URL :3-->

Usage:
```bash
export NEW_ROLE_NAME="new_role"
./add-role.sh ${NEW_ROLE_NAME}
```

Using Template
--------------
To use this template for a new collection, run the script `replace.sh` to apply a new name, user, etc.
