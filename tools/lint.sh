#! /bin/bash
set -ex
cd ..  # Move to the top dir.

playbooks=${1:-*.yml}
inventory=inventory/hosts

yamllint --strict $(find . -type f | grep -E '.yml$')

for p in ${playbooks:?}; do
        which ansible-lint 2>/dev/null && ansible-lint -vvv $p || ansible-lint-3 -vvv $p
        ansible-playbook -i ${inventory:?} -vvv $p --syntax-check
done

