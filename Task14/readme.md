# Jenkins DinD ,GitHub Webhook,Agent, Pipeline Setup for PetClinic Application

### Overview
This guide covers the installation of Jenkins using Docker-in-Docker (DinD) method, creation of Jenkins agents on Ubuntu and Windows, 
and setting up a Jenkins pipeline for building, testing, deploying, and running the PetClinic application.
The pipeline includes cron scheduling and parallel execution of unit and integration tests.

## Step 1: Prepare the Docker Environment

### Dockerfile (for Jenkins with DinD)

Create a `Dockerfile` to set up Jenkins with Docker-in-Docker:
  
```dockerfile
FROM jenkins/jenkins:lts
USER root

# Install Docker client
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update -qq \
    && apt-get -y install docker-ce

RUN usermod -aG docker jenkins
````````````````

### Docker Compose File
Create a `docker-compose.yml` file to define the Jenkins service:
```
services:
  jenkins:
    build: .
    container_name: jenkins
    ports:
      - "8081:8080"
      - "50001:50000"
    volumes:
      - /var/jenkins_dind:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
``````````````

## Step 2: Create Jenkins Agents
### Windows Agent

1. Install Docker Desktop on Windows.

2. Install the Jenkins agent:

    ```powershell
    docker run -d --name jenkins-agent-windows `
      -v //var/run/docker.sock:/var/run/docker.sock `
      jenkins/inbound-agent:windows
    ```

3. Add the Windows agent in the Jenkins UI.

## Step 3: Create Jenkins Pipeline for PetClinic Application
## Features

- **Automated Build Process**  
  The pipeline automatically builds the Docker image for the PetClinic application, ensuring that the latest code changes are always integrated.

- **Parallel Testing**  
  Unit Tests and Integration Tests are executed in parallel to optimize testing time and ensure that the application is robust before deployment.

- **Environment-Specific Deployments**  
  The pipeline allows for deployments to multiple environments (development, staging, production) using a parameterized option, providing flexibility and control over the deployment process.

- **Scheduled Execution**  
  The pipeline is configured to run automatically at 2 AM on weekdays using Jenkins' cron feature, ensuring regular builds and deployments without manual intervention.

- **Docker Hub Integration**  
  The pipeline securely logs into Docker Hub and pushes the Docker image, making it available for deployment across environments.

- **Docker Compose for Deployment**  
  The application is deployed using Docker Compose, ensuring a seamless and consistent deployment process.

- **Notification System**  
  The pipeline sends notifications via Discord upon successful or failed builds and deployments, keeping the team informed of the pipeline status.

- **Workspace Cleanup**  
  After each run, the workspace is cleaned to maintain a clean and efficient build environment.

- **GitHub Webhook Integration**  
  The pipeline is triggered by changes in the GitHub repository, automatically starting a new build and deployment process whenever there are new commits or pull requests.



## Step 4: Set Up GitHub Webhook

1. Navigate to your GitHub repository.

2. Go to **Settings** > **Webhooks** > **Add webhook**.

3. Set the payload URL to your Jenkins URL followed by `/github-webhook/`.

4. Set the content type to `application/json`.

5. Choose which events should trigger the webhook (e.g., `push` events).

6. Save the webhook.

