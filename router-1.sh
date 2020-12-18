#SET IP
#fra i router
sudo ip a add 10.2.2.1/30 dev enp0s9
sudo ip link set dev enp0s9 up
#verso lo switch
sudo ip a add 10.11.0.1/23 dev enp0s8
sudo ip link set dev enp0s8 up

#ROUTING
#verso le vlan #non serve la rica se si toccano?
#sudo ip route add 10.11.0.0/23 via 10.11.0.2 dev enp0s8 #'per ora inutile?
#verso host-c
sudo ip route add 10.3.0.0/23 via 10.2.2.2 dev enp0s9

#enable ip forwarding
sudo sysctl net.ipv4.ip_forward=1