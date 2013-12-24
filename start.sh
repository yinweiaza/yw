#!/bin/sh

#open the list_novel_link.txt and  do it

START_PATH="/home/yw/sh/download_novel"



#bake the novel 
if [ "`ls -A $START_PATH/novel`"  != " " ]
then
#o	mv  $START_PATH/novel/*  /home/yw/novel/
find  $START_PATH/novel -type f  | xargs -I {} mv {} /home/yw/novel/

fi

	


cd  $START_PATH && awk '{print;}' $START_PATH/list_novel_link.txt | xargs -I {}  ./novel.sh  {}
