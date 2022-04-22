#!/bin/bash

base_dir="$(dirname $0)"
sleep_seconds=1800
playbook_file="deploy-vsphere-lab.yml"
inventories_dir="inventories"

cd "$base_dir" || exit

for inventory_file in $(ls "$inventories_dir/" | grep "hosts"); do

    echo "# creating lab in $inventory_file"
    ansible-playbook -i "$inventories_dir/$inventory_file" $playbook_file > ~/"$(basename $inventory_file).log" 2>&1 &
    sleep $sleep_seconds
done