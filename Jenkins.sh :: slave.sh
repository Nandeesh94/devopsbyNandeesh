#STEP-1: INSTALLING GIT JAVA-1.8.0  
yum install git java-1.8.0-openjdk -y
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.9-bin.tar.gz -C /opt/
sudo ln -sf /opt/apache-maven-3.9.9/bin/mvn /usr/bin/mvn

#Step 1: Verify Maven Version in Jenkins
#Go to Jenkins > Manage Jenkins > Global Tool Configuration.
#Scroll to the Maven section and check if (Maven 3.9.9 is listed. (need latest version))
#If it’s not:
#Click Add Maven.
#Name it (e.g., Maven-3.9.9).
#Specify the installation path: /opt/apache-maven-3.9.9.
#Save the configuration.


#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
#sudo yum install java-11-amazon-corretto
yum install jenkins -y
sudo amazon-linux-extras enable corretto17
sudo yum install java-17-amazon-corretto -y
update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service
