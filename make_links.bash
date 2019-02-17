#!/bin/bash
# make_links.bash
# Create HTML links for the random web page from a list of uuids.
# They should be in a file called uuids.txt in this directory.
# 02/17/2019 spitman script created

#set -x

thisDir=`pwd`
echo > ${thisDir}/html_uuids.txt
while read line ; do
  printf "i.push(\"${line}\");\n" 
  printf "i.push(\"${line}\");\n" >> ${thisDir}/html_uuids.txt
#  sleep 1
done < ${thisDir}/uuids.txt


# You can use the following at the command line to grep 
# all the uuid's out of your json files.
# grep "\"uuid\" :" *.json | grep "," | cut -d"\"" -f4
