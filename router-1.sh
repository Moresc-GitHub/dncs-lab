ip addr flush dev enp0s8 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
ip addr flush dev enp0s9 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
#  SET IP
#  fra i router
sudo ip a add 10.2.2.1/30 dev enp0s9
sudo ip link set dev enp0s9 up

#  attivo la porta
sudo ip link set dev enp0s8 up
                #  imposto VLAN e i relativi IP
sudo ip link add link enp0s8 name enp0s8.11 type vlan id 11
sudo ip addr add 10.11.0.1/23 dev enp0s8.11

sudo ip link add link enp0s8 name enp0s8.12 type vlan id 12
sudo ip addr add 10.12.0.1/23 dev enp0s8.12


#  attivo le porte virtuali
sudo ip link set enp0s8.11 up
sudo ip link set enp0s8.12 up

#  verso lo switch
#  sudo ip a add 10.11.0.1/23 dev enp0s8 #  'per una connessione diretta con host-a'


#  ROUTING
    #  verso le vlan #  non serve la riga se si toccano
    #  sudo ip route add 10.11.0.0/23 via 10.11.0.2 dev enp0s8 #  'per ora inutile?
#   verso host-c
sudo ip route add 10.3.0.0/23 via 10.2.2.2 dev enp0s9

#  attivo ip forwarding
sudo sysctl net.ipv4.ip_forward=1