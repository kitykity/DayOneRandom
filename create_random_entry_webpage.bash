#!/bin/bash
# create_random_entry_webpage.bash
# Create an HTML page that will take you to a random DayOne post.
# 02/17/2019 spitman script created.
# 02/17/2021 spitman made it more self contained. Renamed from make_links.bash.

# Setup Stuff
thisDir=`pwd`
mkdir ${thisDir}/work 2> /dev/null
rndPg="${thisDir}/random_entry.html"

troubleshoot_me () {
  set -x
}

get_uuids () {
  grep "\"uuid\" :" Export*/*.json | grep "," | cut -d"\"" -f4 > ${thisDir}/work/uuids.txt
}

make_pushlines () {
  echo > ${thisDir}/work/pushlines.txt
  while read line ; do
    echo "i.push(\"${line}\");" >> ${thisDir}/work/pushlines.txt
  done < ${thisDir}/work/uuids.txt
}

create_html_page () {
  echo "<html>" > ${rndPg}
  echo "<p><script type="text/javascript">" >> ${rndPg}
  echo "var i = new Array();" >> ${rndPg}
  while read line2 ; do
    echo "${line2}" >> ${rndPg}
  done < ${thisDir}/work/pushlines.txt
  echo "var item = i[Math.floor(Math.random()*i.length)];" >> ${rndPg}
  echo "document.write(\"You have \" + i.length + \" entries... here we go to a <a href=dayone2://view?entryId=\" + item + \" style='text-decoration:none'>random</a> one... <meta http-equiv='refresh' content='3; url=dayone2://view?entryId=\" + item + \"'>\");" >> ${rndPg}
  echo "</script>" >> ${rndPg}
  echo "<p>Refresh this page to go to a different random entry.</p>" >> ${rndPg}
  echo "</html>" >> ${rndPg}
  echo "Complete. Open random_entry.html in your favorite browser."
}

##########
## MAIN ##
##########
# troubleshoot_me
make_pushlines
get_uuids
make_pushlines
create_html_page
