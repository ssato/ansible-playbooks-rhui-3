#! /bin/bash
set -ex
#cd ${0%/*}/  # Move to the top dir.

playbooks=${1:-*.yml}
inventory=inventory/hosts
ansible_lint="$(which ansible-lint-3 2>/dev/null || which ansible-lint 2>/dev/null)"

yamllint --strict $(find . -type f | grep -E '.yml$')

for p in ${playbooks:?}; do
        ${ansible_lint:?} -vvv $p -x ANSIBLE0006
        ansible-playbook -i ${inventory:?} -vvv $p --syntax-check
done

