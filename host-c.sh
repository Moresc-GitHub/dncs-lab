ip addr flush dev enp0s8 #evito che in caso di resume ci siano errori RTNETLINK answers: File exists
echo "_________INIZIO INSTALLAZIONE DOCKER________"
#  Docker


#ignorare pure i WARNING su apt
echo "_____eseguo       sudo apt update______"
sudo apt update
#sudo apt upgrade #aggiunto #non serve e non si può fare perchè bisognerebbe premere  y
echo "_____eseguo   curl ____"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -        #curl scarica, | fa da pipeline
echo "________eseguo     add-apt-repository______"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "______eseguo      sudo apt install -y docker.io_____"
sudo apt install -y docker.io
echo "_____eseguo       docker pull dustnic82/nginx-test____"
docker pull dustnic82/nginx-test        #docker pull [OPTIONS (-q per stampare poca roba)] NAME[:TAG|@DIGEST]


#  SET IP
sudo ip a add 10.3.0.2/23 dev enp0s8
sudo ip link set dev enp0s8 up

#  ROUTING TABLE
sudo ip route add default via 10.3.0.1  #blocco la connessione ad internet

echo "_________RUN DOCKER____________"          #https://docs.docker.com/get-started/nodejs/run-containers/#overview
sudo docker run -it --rm -d -p 8080:80 --name web-server dustnic82/nginx-test  #poi la connessione ssh dà problemi
#When you run this command, you’ll notice that you were not returned to the command prompt.
# This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back
# to the OS until we stop the container.

# -p serve a indicare la porta  -p = --publish      [host port]:[container port]