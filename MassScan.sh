#!/bin/bash

function help(){
	echo -e "\n===================================================="
	echo -e "\nUsage: bash script.sh -f <domain-list>"
	echo -e "\n-f : File containig list of Domains/IP Addresses"
	echo -e "\n===================================================="
}

function check(){
        nmap -v &> /dev/nall
        if [ "$?" != "0" ];then
                echo "Nmap is not installed, we will install it for you."
                apt install nmap -y &> /dev/null
                echo "Nmap has been installed"
        else
                echo "Nmap Available"
        fi
        which host &> /dev/null
        if [ "$?" != "0" ];then
                echo "Host is not installed, we will install it for you."
                apt install host -y &>/dev/null
                echo "Host has been installed"
        else
                echo "Host Available"
        fi
}

function portscan(){
        echo -e "\n-----------------------------------"
        read -p "Enter port to be Scanned : " prt
        echo -e "-----------------------------------\n"
	while read -r line;
	do
		host $line &> /dev/null
		if [ "$?" != "0" ];then
			echo -e "---------------------------------------------"
			echo -e "\nError: $line - Domain cannot be resolved\n"
			echo -e "---------------------------------------------"
			#exit 1
		else
			ps=$(nmap -sS -p $prt $line | grep tcp | awk -F" " '{print ""$2}')
			echo -e "\nDomain : $line"
			echo -e "Port Status : $ps \n"
		fi
	done< "$fn"
}

fn=$2

while getopts "f:h:" opt;
do
	case $opt in
		f)
			check
   			portscan
			;;
		h)
			help
			;;
		*)
			echo -e "Error : Invalid Attribute"
			help
			;;
	esac
done
