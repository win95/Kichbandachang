echo "__________________________________________________"

echo "Embedded Networing Laboratory"
echo "Install batman-adv and configure network interface"
echo "__________________________________________________"
#remove batman & del wlan4
sudo rmmod batman-adv
sudo batctl if del wlan4
sleep 2

echo "Insmod batman-adv"
sudo insmod ./batman-adv.ko
#stop Network manager
sudo stop network-manager
#disable firewall
sudo iptables -F
echo "Configure wlanx interface"
sudo ifconfig wlan4 down
sudo iwconfig wlan4 mode ad-hoc	
sudo iwconfig wlan4 essid NC
sudo iwconfig wlan4 key 1234567890
sudo ifconfig wlan4 10.42.43.22/8
sleep 1
sudo iwconfig wlan4 ap 02:CE:FA:DD:CA:00 
sudo iwconfig wlan4 channel 161
sudo ifconfig wlan4 up
sudo ifconfig wlan4 mtu 1532
sleep 1

echo "Configure bat0 interface"
sudo ifconfig wlan4 promisc
sudo modprobe libcrc32c
sudo batctl if add wlan4

sudo ifconfig bat0 up
sudo ifconfig wlan4 up

sudo ifconfig wlan4 0.0.0.0
sudo ifconfig bat0 192.168.123.2/24
echo "Configure is successful"
