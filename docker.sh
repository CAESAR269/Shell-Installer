sudo apt-get update -y
curl -sSL https://get.docker.com/ | sh
sudo usermod -a -G docker node
sudo usermod -a -G docker tsar
sudo usermod -a -G docker ubuntu
sudo chmod 777 /var/run/docker.sock
sudo apt-get install openjdk-17-jdk -y
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install openjdk-8-jdk -y
