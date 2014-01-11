#!/bin/sh

if [ $# != 2 ];then
	echo "usage:`basename <url>	<string>`"
	exit 1
fi

URL=$1
STRING=$2


wget  -c   --dns-timeout 3  --connect-timeout 5 $URL  -O  ./api.html  && $(get)

get(){
	if [ -e "./api.html" ];then
	fi

}
