#!/bin/bash

#this shell script function:  list the weibo,write the weibo and so on
#here  we  apply the curl tool to request the web.
#this is the first time when  to  write the large  project ,er...,although  in fact   the project can't be more smaller.
#today,wo decide that  the shell function  only  list  and write the weibo  

#app_key,access_token,app_secret
#factly, the follow varible  should be writen  into a file.Then  it will be easy to modify it.

APP_KEY=3888520729
APP_SECRET=4c68e7f2cab1ae7894d5921ea4fff103
ACCESS_TOKEN=2.00cUdnsBRspJPEfdd898d82dtimdME      #这三项为连接新浪微博开放平台必备的三个参数

SCREEN_NAME="穿越千古的石头人" #这是我的昵称

#menu
MENU_1="列出我发表的所有微博信息"  
MENU_2="列出我所关注的用户的最新微博" 
MENU_3="写我自己的最新微博"   

DOCUMENT_LIST=(my_weibo_list.txt my_weibo_focus_new.txt write_new_weibo.txt) 

a=1
while [ ! -z $a ] ;  #  这里用了个死循环，为的是可以循环应用
do
	menu(){
		select choice_nu in  $MENU_{1..3};
		do
			break
		done
		echo $choice_nu
	}
	
	CHOICE=$(menu)
	
	for var in $MENU_{1..3};do
		let  n++
		if [ "$CHOICE" == "$var" ];then
			CHOICE_DOCUMENT=${DOCUMENT_LIST[$n]}
			break
		fi
	done
	if [ "$CHOICE_DOCUMENT" == "" ];then
		echo  "程序有问题啊！！"
		exit  1
	fi
# now  wo  get the choice and the document
	if [ ! -f $CHOICE_DOCUMENT ];then

		exit 1;
	fi
		 
done
