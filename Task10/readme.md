# Spring PetClinic Deployment with Nginx Load Balancing and Traffic Monitoring

This project demonstrates how to deploy the Spring PetClinic application using Docker with a multi-stage Dockerfile, 
utilizing multiple replicas for scalability, Nginx as a load balancer, and monitoring traffic using Nginx logging.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Technology](#Technology)
- [Monitoring Traffic](#monitoring-traffic)
- [Notes](#notes)

## Overview

The setup includes:
- Running the Spring PetClinic application using a multi-stage Dockerfile.
- Utilizing multiple replicas for the Spring PetClinic service.
- Using Nginx as a load balancer to distribute traffic across the replicas.
- Monitoring and logging traffic with Nginx.

## Prerequisites

- Docker: Ensure you have Docker installed on your system. Follow the [Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.
- Docker Compose: Docker Compose should be installed as part of the Docker installation. Verify by running `docker-compose --version`.

## Technology

1. **Multi-Stage Dockerfile:**

   The multi-stage Dockerfile is set up to build the Spring PetClinic application using Maven and then create a smaller image for running the application.

2. **Docker Compose Configuration:**
   
   The docker-compose.yml file is configured to run the Spring PetClinic application with multiple replicas, MySQL and PostgreSQL databases, and Nginx as the load balancer.

3. **Nginx Configuration:**

   The Nginx configuration (nginx/default.conf) is set up to distribute traffic to the Spring PetClinic replicas and log traffic details.


## Monitoring Traffic
1.Access Logs:

Nginx is configured to log access and error details. You can view the logs to monitor traffic and check for any issues.

Access logs: ./nginx/log/access.log
Error logs: ./nginx/log/error.log
The logs include details such as remote address, request time, status, response size, and user agent.

2. Log Format:

The custom log format in Nginx includes:

Client IP and user
Request details (method, URI, protocol)
Status and response size
Referrer and user agent
Upstream address and response time
Health check status

## Notes
Ensure you have sufficient system resources to run multiple Docker containers simultaneously.
Some projects may require additional configuration or dependencies. Refer to the individual project README files for specific instructions.
Monitor the Docker logs using docker-compose logs if you encounter any issues.








   
   
