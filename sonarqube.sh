# Download openJDK

sudo apt update
sudo apt install openjdk-17-jdk -y

# Downlod unzip

sudo apt install unzip -y

# Download Sonarqube from the below URL into /opt folder

cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.1.69595.zip

# unzip sonarqube

sudo unzip sonarqube-9.9.1.69595.zip

# Create a user and add it as owner to opt/sonarqube-9.9.1.69595 folder 

sudo useradd sonaradmin
sudo passwd sonaradmin
sudo chown -R sonaradmin:sonaradmin sonarqube-9.9.1.69595 

# Switch as sonaradmin user

su sonaradmin

# Start the sonar

sh /opt/sonarqube-9.9.1.69595/bin/linux-x86/sonar.sh start
