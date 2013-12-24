#!/bin/sh

#start dir
START_PATH="/home/yw/sh/download_novel/novel"

NUM=$(ls $START_PATH | wc -l)

if [ $NUM  != 0 ]
then
	echo  "the new chapter is "$NUM
else
	echo  "no new chapter"
fi

exit 0
