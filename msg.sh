#!/bin/bash

URL_PATH="http://open.weibo.com"
SOURCE="message.txt"
AWK_SCRIPT="msg.awk"
AIMS="back.txt"

#临时存储下载的网页
TMP_F="tmp"  

if [ -e $AIMS ];then
	rm $AIMS
fi
touch $AIMS


#要下载的网页数
NUM=$(awk  'END{print NR}' $SOURCE)

for i in  $(eval echo {1..$NUM})
do
	awk -vNU=$i  'BEGIN{FS=","}NR==NU{print $3;}' $SOURCE  | xargs -I {} wget  -c --dns-timeout 3 --connect-timeout 5 $URL_PATH{} -O $TMP_F"_"$i 
	if [ $? == 0 ];then
	
		awk -f $AWK_SCRIPT $TMP_F"_"$i >> $AIMS
	else
		exit 1;
	fi
done


echo "###################################################################################################################################"
echo ""
echo "well  done ！！！！"
echo ""

echo "###################################################################################################################################"

for i in  $(eval echo {1..$NUM})
do
rm  $TMP_F"_"$i;
done

