export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

#  Startup commands for switch go here


#  configuro le porte assegnando i tag delle VLAN
sudo ovs-vsctl add-br switch
sudo ovs-vsctl  add-port switch enp0s8
sudo ovs-vsctl  add-port switch enp0s9 tag=11
sudo ovs-vsctl  add-port switch enp0s10 tag=12

#  imposto le porte come trunks
sudo ovs-vsctl set port enp0s8 trunks=11,12

#  attivo le varie porte
sudo ip link set enp0s8 up
sudo ip link set enp0s9 up
sudo ip link set enp0s10 up