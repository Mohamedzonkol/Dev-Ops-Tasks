# Jenkins Setup and Spring PetClinic Deployment

This project demonstrates how to install Jenkins on Ubuntu, configure it, and create a freestyle job to run the Spring PetClinic application using Docker with Nginx for load balancing.

## Table of Contents

- [Overview](#overview)
- [Installing Jenkins on Ubuntu](#installing-jenkins-on-ubuntu)
- [Creating a Freestyle Job in Jenkins](#creating-a-freestyle-job-in-jenkins)
- [Configuring the Freestyle Job](#configuring-the-freestyle-job)
- [Running the Freestyle Job](#running-the-freestyle-job)
- [Notes](#notes)

## Overview

This project includes:
- Instructions for installing Jenkins on Ubuntu.
- Steps to create and configure a Jenkins freestyle job to run the Spring PetClinic application using Docker and Nginx for load balancing.

## Installing Jenkins on Ubuntu

1. **Update the package index:**
   ```bash
   sudo apt-get update

2. **Install Java (Jenkins requires Java to run):**
    ```bash
   sudo apt-get install -y openjdk-11-jdk

3. **Add the Jenkins repository and key:**
   ```bash
   curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

4. **Install Jenkins:**
    ```sh
    sudo apt-get install -y jenkins

5. **Start and enable Jenkins:**
    ```bash
   sudo systemctl start jenkins
   sudo systemctl enable jenkins


6.**Access Jenkins:**:
  Open your web browser and navigate to http://your_server_ip_or_domain:8080. You will be prompted to enter the initial admin password, which can be found in the following file:
    
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## Creating a Freestyle Job in Jenkins
1. Log in to Jenkins:
Open your web browser and navigate to your Jenkins instance.

2. Create a new item:

Click on New Item.
Enter a name for the job (e.g., PetClinic Docker Deployment).
Select Freestyle project.
Click OK.

## Configuring the Freestyle Job
1. Configure the job:

In the job configuration page, scroll down to the Build section.
Click Add build step and select Execute shell.
2. Add the shell script to run the Docker and Nginx setup:

Here is a sample shell script to deploy the Spring PetClinic application using Docker and Nginx for load balancing:

    # Clone the repository
    git clone https://github.com/Mohamedzonkol/Dev-Ops-Tasks
    cd Task10
    
    # Build and run the Docker containers
    docker-compose up --build -d
    
    # Verify the containers are running
    docker ps

## Running the Freestyle Job
1. Save the configuration:
Click Save at the bottom of the job configuration page.

2. Build the job:
Go to the job page.
Click Build Now.

3. Monitor the build:
Click on the build number in the Build History to see the console output.
Ensure that the job completes successfully and the application is deployed.

## Notes
Ensure Docker and Docker Compose are installed on the Jenkins server.
Update the repository URL and any other specific configuration as needed for your environment.
You can configure additional post-build actions such as notifications or archiving artifacts based on your requirements.
















