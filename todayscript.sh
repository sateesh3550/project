#!/bin/bash
#replace a sting in a file and copy that file to different directory or same
#initial_key="xyz123"
initial_key="$1"
#final_key="dev123"
final_key="$2"
configfile="/root/class/configfile"
target="/tmp/outfile"
for l in configfile
  do
     if [ $l ]; then
        #sed "s/$initial_key/$final_key/g" "$l" > $target && mv $target .
        sed "s/$initial_key/$final_key/g"  > $target && mv $target .
     else
       echo "error"
     fi
  done
#test master
