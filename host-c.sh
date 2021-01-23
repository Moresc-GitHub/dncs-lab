ip addr flush dev enp0s8 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
echo "_Start Docker installation_"
#  Docker


#ignorare pure i WARNING su apt
sudo apt update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -        #curl scarica, | fa da pipeline

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt install -y docker.io

docker pull dustnic82/nginx-test        #docker pull [OPTIONS (-q per stampare poca roba)] NAME[:TAG|@DIGEST]


#  SET IP
sudo ip a add 10.3.0.2/23 dev enp0s8
sudo ip link set dev enp0s8 up

#  ROUTING TABLE
sudo ip route add default via 10.3.0.1  #blocco la connessione ad internet

echo "_Run Docker_"          #https://docs.docker.com/get-started/nodejs/run-containers/#overview
                                                https://www.tutorialspoint.com/docker/building_web_server_docker_file.htm
sudo docker run --rm -it -d -p 80:80 --name web-server dustnic82/nginx-test  

#When you run this command, you’ll notice that you were not returned to the command prompt.
# This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back
# to the OS until we stop the container.