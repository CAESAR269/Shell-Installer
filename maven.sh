sudo apt-get update
sudo apt-get install openjdk-17-jdk -y
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install openjdk-11-jdk -y
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
sudo tar xzvf apache-maven-3.9.3-bin.tar.gz

sudo mv apache-maven-3.9.3  /opt/maven/

export PATH="/opt/maven/apache-maven-3.9.3/bin:$PATH"

