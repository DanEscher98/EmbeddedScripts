#/usr/bin/bash

ls | xargs file | grep broken | awk -F: '{print $1}' | xargs rm
