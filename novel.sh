#! /bin/sh


#the  url downloaded
URL=$1

WORK_PATH="/home/yw/sh/download_novel"
DIFF_FILE="$WORK_PATH/index-back/${URL##*/}.html"
DIFF_OUT="$WORK_PATH/DIFF.txt"

# $#=?;
if [ -z $1 ]
then
	exit 1;
fi


#set the work dir
cd $WORK_PATH 


#at first, download the url html;

COM_1_FILE="$WORK_PATH/index-back/${URL##*/}-resource.html"
wget  $URL -O   $COM_1_FILE
if [ ! -e $DIFF_FILE ]
then
	mv $COM_1_FILE  $DIFF_FILE && exit 1;
fi

diff $COM_1_FILE $DIFF_FILE  1>&2 >$DIFF_OUT

#begin to  fetch  the different  line

awk -F'\"' 'NF>1{print $2;}' $DIFF_OUT | xargs -I {} wget -c ${URL%/*}{} -P $WORK_PATH/novel

echo "well done!!!"

#now  clean the file
cp $COM_1_FILE $DIFF_FILE && rm $COM_1_FILE $DIFF_OUT
