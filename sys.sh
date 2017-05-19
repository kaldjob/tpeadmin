#!/bin/bash

clear
sleep 6
echo "***********************************************************************************************"
echo "*                                BIENVENUE SUR MON PROJET SYS                                 *"
echo "*                                                                                             *"
echo "*                                   CHOISIR UNE OPTION                                        *" 
echo "***********************************************************************************************" 
echo "*                                                                                             *"                                                                     
echo "*              a - Informations sur les utilisateurs enregistrés il ya 3 jours                *"
echo "*                                                                                             *"
echo "*              b - acquisition, installation et lancement de l'environement xampp             *"
echo "*                                                                                             *"
echo "*              c - archivage des eléments du repertoire personnel modifié  par                *"
echo "*                                   le sudoer il ya 2 jours                                   *"
echo "*                                                                                             *"
echo "*          d - informations d'utilisation du disque, de la memoire du processeur,             *"
echo "*                                         de la swap                                          *"
echo "*                                                                                             *"
echo "*                                         quitter(Q/q)                                        *"
echo "*                                                                                             *"
echo "*                                                                                             *"
echo "***********************************************************************************************" 
echo "*                          FAIS PAR :  KALDJOB BEGUE CHRISTIAN NOEL                           *" 
echo "***********************************************************************************************"           

       
read -r option

case $option in 
	

	'a') cut -d : -f 1 /etc/passwd>all_user
	

	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo "cet utilisateurs a ete cree il y a trois jours : " 
		echo $user >3days_user.txt
	      fi

	    done<user1 
	done<userx
	cat 3days_users.txt
	
 ;;
	'b') echo "downloading..."
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " installation..."
	 ./xampp-linux-x64-5.6.30-1-installer.run
	
	 sudo su
	echo "running..."
	/opt/lampp/lampp start


;;
	'c') echo "archivage"
	mkdir -p /home/seed/archive
	find /home/seed/ -type f -mtime 2 -print>/home/seed/ficmodi
	while read line
	do
	cp $line archive
	done </home/seed/ficmodi
	tar -czvf archive.tar.gz archive
	mv archive.tar.gz /media/seed/usb/*/archive.tar.gz
	;;
	'd') echo "Informations sur l'utilisation du disque :"
		df -h |grep /dev/sd
		echo "Informations sur l'utilisation de la memoire et de la swap :"
		free -h 
;;
	* ) echo "fin du programme" 
       	exit 2 ;;
	
esac