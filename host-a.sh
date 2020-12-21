# SET IP
sudo ip a add 10.11.0.2/23 dev enp0s8
sudo ip link set dev enp0s8 up

#  ROUTING TABLE
sudo ip route add default via 10.11.0.1