#!/bin/bash
# Update and install required packages

sudo yum update -y
sudo amazon-linux-extras enable corretto17
sudo yum install java-17-amazon-corretto -y
sudo yum install wget unzip -y

# Download and install SonarQube
cd /opt/
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.2.0.77652.zip
sudo unzip sonarqube-10.2.0.77652.zip
sudo useradd sonar
sudo chown sonar:sonar sonarqube-10.2.0.77652 -R
sudo chmod -R 777 sonarqube-10.2.0.77652

# Switch to the sonar user
sudo su - sonar 
cd /opt
cd sonarqube-10.2.0.77652/bin/linux-x86-64/
./sonar.sh start

# Print the status of SonarQube
sudo su - sonar -c sonarqube-10.2.0.77652/bin/linux-x86-64/sonar.sh start
sudo su - sonar -c sonarqube-10.2.0.77652/bin/linux-x86-64/sonar.sh status

# Instructions to access SonarQube
#echo "--------------------------------------------------"
#echo "SonarQube 10.x installation complete!"
#echo "Access it via: http://<your-server-ip>:9000"
#echo "Default credentials: admin / admin"
#echo "Ensure port 9000 is open in your firewall/security group."
