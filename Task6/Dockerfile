# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set maintainer label
LABEL maintainer="Mohamed Elsayed <mo.zonkol@gmail.com>"
LABEL description="Custom Docker image for Spring Petclinic application"

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk git maven curl && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Clone the Spring Petclinic repository
RUN git clone https://github.com/dockersamples/spring-petclinic-docker.git

# Change working directory to the cloned repository
WORKDIR /app/spring-petclinic-docker

# Build the Spring Petclinic application using Maven
RUN ./mvnw package

# Expose the port on which the app runs
EXPOSE 8080

# Set environment variable
ENV APP_VERSION="1.0.0"

# Echo environment variable
RUN echo "Running Spring Petclinic version $APP_VERSION"

# Health check to ensure application is ready
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:8080 || exit 1

# Run the Spring Petclinic application
CMD ["java", "-jar", "target/spring-petclinic*.jar"]
