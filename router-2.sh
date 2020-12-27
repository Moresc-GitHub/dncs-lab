ip addr flush dev enp0s8 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
ip addr flush dev enp0s9 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
#  SET IP
#  fra i router
sudo ip a add 10.2.2.2/30 dev enp0s9
sudo ip link set dev enp0s9 up
#  verso host-c
sudo ip a add 10.3.0.1/23 dev enp0s8
sudo ip link set dev enp0s8 up

#  ROUTING

#  verso le vlan
#sudo ip route add 10.11.0.0/23 via 10.2.2.1 dev enp0s9
#sudo ip route add 10.12.0.0/23 via 10.2.2.1 dev enp0s9
sudo ip route add default via 10.2.2.1 dev enp0s9
#  forse sostituibili con sudo ip route add 10.?.0.0/22 via 10.2.2.1 dev enp0s9

#  verso host-c #forse non va messo niente
#  sudo ip route add 10.3.0.0/23 via 10.3.0.2 dev enp0s8
#  sudo ip route add 10.3.0.0/23 dev enp0s8 #'se non va aggiungere anche l'indirizzo di dest



#  attivo ip forwarding
sudo sysctl net.ipv4.ip_forward=1