ip addr flush dev enp0s8 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
#  SET IP
sudo ip a add 10.12.0.2/23 dev enp0s8
sudo ip link set dev enp0s8 up

#  ROUTING TABLE
sudo ip route add default via 10.12.0.1