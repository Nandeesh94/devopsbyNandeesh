#!/bin/bash

# Update and install required packages
sudo yum update -y
sudo amazon-linux-extras enable corretto17
sudo yum install java-17-amazon-corretto -y
sudo yum install wget unzip -y

# Define SonarQube version and installation directory
SONARQUBE_VERSION="10.2.0.77652"
SONARQUBE_DIR="/opt/sonarqube-${SONARQUBE_VERSION}"
DOWNLOAD_URL="https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip"

# Create a sonar user
sudo useradd sonar

# Download and install SonarQube
cd /opt/
sudo wget ${DOWNLOAD_URL}
sudo unzip sonarqube-${SONARQUBE_VERSION}.zip
sudo chown -R sonar:sonar sonarqube-${SONARQUBE_VERSION}
sudo chmod -R 775 sonarqube-${SONARQUBE_VERSION}

# Switch to the sonar user
sudo su - sonar <<EOF
cd ${SONARQUBE_DIR}/bin/linux-x86-64/
./sonar.sh start
EOF

# Print the status of SonarQube
echo "Checking SonarQube status..."
sudo su - sonar -c "${SONARQUBE_DIR}/bin/linux-x86-64/sonar.sh status"

# Instructions to access SonarQube
echo "--------------------------------------------------"
echo "SonarQube 10.x installation complete!"
echo "Access it via: http://<your-server-ip>:9000"
echo "Default credentials: admin / admin"
echo "Ensure port 9000 is open in your firewall/security group."
