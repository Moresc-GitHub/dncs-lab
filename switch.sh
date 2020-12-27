export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

#  Startup commands for switch go here


#  configuro le porte assegnando i tag delle VLAN       https://therandomsecurityguy.com/posts/openvswitch-cheat-sheet/         https://docs.pica8.com/display/PICOS2111cg/ovs-vsctl+add-port
#  mostro i bridge configurati sudo ovs-vsctl list-br
echo "___________STO PER AGGIUNGERE UN BRIDGE_________"
sudo ovs-vsctl add-br switch    #aggiungo un bridge
echo "____________BRIDGE AGGIUNTO_________"
#  mostro i bridge configurati sudo ovs-vsctl list-br
sudo ovs-vsctl  add-port switch enp0s8  #Converts port to an access port on specified VLAN (by default all OVS ports are VLAN trunks).
sudo ovs-vsctl  add-port switch enp0s9 tag=11
sudo ovs-vsctl  add-port switch enp0s10 tag=12
echo "____________PORTE AGGIUNTE_________"
#mostro le porte configurate sudo ovs-vsctl list-ports switch

#  imposto le porte come trunks: configure an already added port as an access port
#forse non serve a niente
sudo ovs-vsctl set port enp0s8 trunks=11,12

echo "________switch completato, ora attivo le porte_________"
#  attivo le varie porte
sudo ip link set enp0s8 up
sudo ip link set enp0s9 up
sudo ip link set enp0s10 up