#!/bin/bash

# check if wget is installed or not
if ! [ -x "$(command -v wget)" ]; then
        echo 'wget is not installed. Installing now...' >&2
        sudo apt-get install wget
        exit 0
fi


# remove any previous mdl.list
#rm mdl.list


# download malware domain list
wget -O ip.list http://www.malwaredomainlist.com/hostslist/ip.txt
wget -O csv.list http://www.malwaredomainlist.com/mdlcsv.php


# extract unique ip
sed -e "s/\r//g" ip.list >> update-mdl.list
#sed '/127.0.0.1/d' update-mdl.list

# generate mdl.list
list=`cat update-mdl.list`
for line in $list; do
    count=`grep $line csv.list | wc -l`
    if [ $count -gt 127 ]; then
        echo $line,1,127 >> mdl.list
    else
        echo $line,1,$count >> mdl.list
    fi
done


# remove unused file
rm ip.list
rm csv.list
rm update-mdl.list



