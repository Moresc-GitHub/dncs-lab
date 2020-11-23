#SET IP
#fra i router
sudo ip a add 10.2.2.2/30 dev enp0s9
sudo ip link set dev enp0s9 up
#verso host-c
sudo ip a add 10.3.0.1/23 dev enp0s8
sudo ip link set dev enp0s8 up

#enable ip forwarding
sudo sysctl net.ipv4.ip_forward=1