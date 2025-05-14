#!/bin/bash
# random-maker.bash
# This file should be one folder up from your .json files.
# Prefix the backup folder name with "Export".
# 02/17/2019 spitman script created
# 02/17/2021 spitman made it more self contained
# 06/05/2023 spitman added quotes around variables for spaced directories
# 05/14/2025 spitman emptied out work files before adding to them

# Setup Stuff
thisDir=`pwd`
echo ${thisDir}
mkdir -p "${thisDir}/work"
rndPg="${thisDir}/random_entry.html"

troubleshoot_me () {
  set -x
}

get_uuids () {
  echo -n " " > "${thisDir}/work/uuids.txt"
  grep "\"uuid\" :" Export*/*.json | grep "," | cut -d"\"" -f4 > "${thisDir}/work/uuids.txt"
}

make_pushlines () {
  echo -n " " > "${thisDir}/work/pushlines.txt"
  while read line ; do
    echo "i.push(\"${line}\");" >> "${thisDir}/work/pushlines.txt"
  done < "${thisDir}/work/uuids.txt"
}

create_html_page () {
  echo "<html>" > "${rndPg}"
  echo "<p><script type="text/javascript">" >> "${rndPg}"
  echo "var i = new Array();" >> "${rndPg}"
  while read line2 ; do
    echo "${line2}" >> "${rndPg}"
  done < "${thisDir}/work/pushlines.txt"
  echo "var item = i[Math.floor(Math.random()*i.length)];" >> "${rndPg}"
  echo "document.write(\"You have \" + i.length + \" entries... here we go to a <a href=dayone2://view?entryId=\" + item + \" style='text-decoration:none'>random</a> one... <meta http-equiv='refresh' content='5; url=dayone2://view?entryId=\" + item + \"'>\");" >> "${rndPg}"
  echo "</script>" >> "${rndPg}"
  echo "<p>Refresh this page to go to a different random entry.</p>" >> "${rndPg}"
  echo "</html>" >> "${rndPg}"
  
}

##########
## MAIN ##
##########
#troubleshoot_me
get_uuids
make_pushlines
create_html_page
