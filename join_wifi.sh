echo "join wifi"
sudo ifconfig wlan4 down
sudo iwconfig wlan4 mode ad-hoc	
sudo iwconfig wlan4 essid NC
sudo iwconfig wlan4 key 1234567890
sudo ifconfig wlan4 10.42.43.20/8
sleep 1
sudo iwconfig wlan4 ap 02:CE:FA:DD:CA:00 

sudo ifconfig wlan4 up

sleep 1
sudo batctl if add wlan4
