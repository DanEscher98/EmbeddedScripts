#!/usr/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
  echo "** fswatch ended **"
  ls | grep -v "workflow.sh" | xargs rm -rdf
}

fswatch -or -l5 $PWD  | while read msg ; do
  printf "\t-) $msg\n"
done

