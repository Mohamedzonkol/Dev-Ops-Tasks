# Awesome Compose Projects Runner

This project demonstrates how to run multiple different projects from the "awesome-compose" repository using Docker Compose. It includes a script that automates the process of running all the Docker Compose files in each subdirectory.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Cloning the Repository](#cloning-the-repository)
- [Running All Projects](#running-all-projects)
- [Learning from Different Technologies](#learning-from-different-technologies)
- [Notes](#notes)

## Overview

The "awesome-compose" repository contains a collection of sample Docker Compose configurations showcasing various frameworks, libraries, and tools. This project provides a script to run all the Docker Compose files in one go, allowing you to explore different technologies and approaches.

## Prerequisites

- Docker: Ensure you have Docker installed on your system. Follow the [Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.
- Docker Compose: Docker Compose should be installed as part of the Docker installation. Verify by running `docker-compose --version`.

## Cloning the Repository

Clone the "awesome-compose" repository to your local machine:

    git clone https://github.com/docker/awesome-compose.git
    cd awesome-compose

### Running All Projects
Use the provided script to run all Docker Compose files in the repository:

    for dir in */ ; do
      echo "Running Docker Compose in $dir"
      cd "$dir"
      docker-compose up -d
      cd ..
    done


This script iterates through each subdirectory and runs docker-compose up -d to start all the services defined in the Docker Compose files.

### Learning from Different Technologies
The "awesome-compose" repository includes examples of various technologies and frameworks, such as:

Web Frameworks: Examples using Node.js, Python (Flask/Django), Ruby on Rails, and more.
Databases: Examples integrating different databases like MySQL, PostgreSQL, MongoDB, and Redis.
DevOps Tools: Examples showcasing CI/CD pipelines, monitoring tools, and deployment strategies.
Microservices: Examples demonstrating microservices architecture and service orchestration.
Each project in the repository includes a Dockerfile and a docker-compose.yml file, illustrating different approaches to containerization and service composition. By running and studying these projects, you can learn best practices and gain insights into various technologies and their integration with Docker.

### Notes
Ensure you have sufficient system resources to run multiple Docker containers simultaneously.
Some projects may require additional configuration or dependencies. Refer to the individual project README files for specific instructions.
Monitor the Docker logs using docker-compose logs if you encounter any issues.
