sudo rmmod batman-adv
make all
sudo insmod ./batman-adv.ko
sudo batctl if add wlan0
sudo modprobe batman-adv

sudo ifconfig wlan0 up
sudo ifconfig bat0 up