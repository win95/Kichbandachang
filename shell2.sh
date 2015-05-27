#!/bin/bash
read -p "Name interface wifi Tp link : " name1
echo "Get in, $name1."
read -p "Name interface DSRC  : " 	name2
echo "Get in, $name2."

echo "Confiure wireless"
sudo ifconfig $name1 	down
sudo ifconfig $name2 	down

sleep 2
sudo iwconfig $name1 mode ad-hoc	essid Adhoc-wifi1 ap A2:BD:B6:6C:83:68 channel 1
#sudo iwconfig $name1 key 123456789
sleep 2
sudo iwconfig $name2 mode ad-hoc	essid ncdsrc ap 02:23:34:56:78:9A channel 2
#sudo iwconfig $name2 key 123456789
sleep 2
sudo ifconfig $name1 10.42.43.9
sudo ifconfig $name2 10.42.43.91
sleep 2 
sudo ifconfig $name1 up
sudo ifconfig $name2 up
sudo ifconfig $name1 mtu 1532
sudo ifconfig $name2 mtu 1532
sudo modprobe libcrc32c
#echo "promisc interface"
#sudo ifconfig $name1 promisc
sleep 2
sudo batctl if add $name1
sudo batctl if add $name2

echo "promisc interface $name1"
sudo ifconfig $name1 promisc
echo "promisc interface $name2"
sudo ifconfig $name2 promisc

sudo ifconfig $name1 	up
sudo ifconfig $name2 	up
sudo ifconfig bat0 	up
sleep 2
echo "Configure bat0 interface"
sudo ifconfig bat0 192.168.0.88/24
#sudo brctl addbr mesh-bridge
#sudo brctl addif mesh-bridge eth0
#sudo brctl addif mesh-bridge bat0
#sudo ifconfig mesh-bridge up
sudo ifconfig $name1 0.0.0.0
sudo ifconfig $name2 0.0.0.0
echo "Configure is successful"
