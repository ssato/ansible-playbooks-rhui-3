#! /bin/bash
set -ex

cd ${0%/*}/../  # cd to the topdir.
./tools/lint.sh './tests/*.yml'

#for f in tests/*.yml; do 
#    #annsible-playbook -vvv $f -i tests/inventory
#done

# vim:sw=2:ts=2:et:
