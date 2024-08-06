# Spring PetClinic Deployment with Multi-Stage Dockerfile and Multiple Environments

This project demonstrates how to deploy the Spring PetClinic application using a multi-stage Dockerfile and Docker Compose to set up different environments (development and production).

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Development Environment](#development-environment)
- [Production Environment](#production-environment)
- [Running the Application](#running-the-application)
- [Development Environment](#development-environment)
- [Production Environment](#production-environment)
- [Notes](#notes)

## Overview

The setup includes:
- A multi-stage Dockerfile to build and package the Spring PetClinic application.
- Docker Compose configurations for development (`docker-compose-dev.yml`) and production (`docker-compose-prod.yml`) environments.

## Prerequisites

- Docker: Ensure you have Docker installed on your system. Follow the [Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.
- Docker Compose: Docker Compose should be installed as part of the Docker installation. Verify by running `docker-compose --version`.

### Development Environment

The development environment is set up to facilitate local development and i am use mysql as database for petclinic app.

1. **Multi-Stage Dockerfile:**

   The `Dockerfile` in the `Multi-Stage-Dockerfile` directory is used to build and package the Spring PetClinic application. The multi-stage build reduces the final image size by excluding unnecessary build dependencies.

2. **Docker Compose for Development:**

   The `docker-compose-dev.yml` file contains the Docker Compose configuration for the development environment. It includes services for the Spring PetClinic application, MySQL.

### Production Environment

The production environment is optimized for deployment to production servers and i am use postgresql as database for petclinic app..

1. **Multi-Stage Dockerfile:**

   The same `Dockerfile` in the `Multi-Stage-Dockerfile` directory is used to build the production image.

2. **Docker Compose for Production:**

   The `docker-compose-prod.yml` file contains the Docker Compose configuration for the production environment. It includes services for the Spring PetClinic application, PostgreSQL databases.
