# Spring PetClinic With Docker and Jenkins Pipeline

This project demonstrates how to containerize the Spring PetClinic application using Docker,
integrate it with PostgreSQL, and automate the build, test, deployment, and running process using Jenkins.

I am use Discord to Trigger My Pipeline Changes "Look at photo in repo".  

## Table of Contents

- [Overview](#overview)
- [Docker Setup](#docker-setup)
- [Dockerfile](#dockerfile)
- [Docker Compose](#docker-compose)
- [Jenkins Pipeline](#jenkins-pipeline)
- [Steps to Run](#steps-to-run)
- [Jenkins Configuration](#jenkins-configuration)
- [Notes](#notes)

## Overview

The project includes the following components:
- **Dockerfile**: Builds the Spring PetClinic application using Maven and sets up the runtime environment.
- **Docker Compose**: Sets up and runs the application with PostgreSQL.
- **Jenkins Pipeline**: Automates the continuous integration and deployment process.

## Docker Setup

### Dockerfile

The Dockerfile is used to build the Spring PetClinic application. It does the following:
1. Uses the latest Ubuntu image as the base image for the build stage.
2. Installs OpenJDK 17, Git, Maven, and Curl.
3. Copies the application source code into the container.
4. Builds the application using Maven.
5. Uses the OpenJDK 17 JDK slim image as the base image for the runtime stage.
6. Copies the built application from the build stage.
7. Exposes port 8080 for the application.
8. Sets the command to run the Spring PetClinic application.

### Docker Compose

The Docker Compose file is used to define and run a multi-container Docker application. It does the following:
1. Defines a service for the Spring PetClinic application.
2. Defines a service for PostgreSQL.
3. Sets up environment variables for both services.
4. Configures network settings and dependencies between services.
5. Mounts a volume for PostgreSQL data persistence.

## Jenkins Pipeline

The Jenkins pipeline automates the process of building, testing, deploying, and running the Spring PetClinic application. It includes the following stages:
1. **Preparation**: Checks out the source code from the Git repository.
2. **Build**: Builds the Docker image for the application. It checks if the image already exists to avoid rebuilding.
3. **Test**: Runs tests (placeholder for actual test commands).
4. **Deploy**: Pushes the Docker image to Docker Hub.
5. **Run**: Pulls the latest Docker images and starts the containers using Docker Compose.

The pipeline also includes post-build actions to clean the workspace and send notifications to Discord.

## Steps to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Mohamedzonkol/Jenkins-Pipeline.git
   cd Jenkins-Pipeline
   docker-compose up --build

Noted : You Access the application at <http://localhost:8082/>.

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

## Jenkins Configuration
1. Create a new Jenkins pipeline job.
2. Configure the pipeline to use the Jenkinsfile from this repository.
3. Set up Docker Hub credentials in Jenkins.
4. Run the pipeline.
   
## Notes
Ensure Docker and Docker Compose are installed on your system.
Update the docker-compose.yml and Jenkinsfile as necessary for your environment.

