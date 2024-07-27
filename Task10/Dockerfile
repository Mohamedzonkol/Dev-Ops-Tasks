FROM ubuntu:latest AS build

ENV DEBIAN_FRONTEND=noninteractive

## \ for Readability and Organization 
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk git maven curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/dockersamples/spring-petclinic-docker.git

WORKDIR /app/spring-petclinic-docker

RUN ./mvnw package

FROM openjdk:17-jdk-slim

ENV APP_VERSION="1.0.0"
ENV JAVA_OPTS=""

WORKDIR /app

COPY --from=build /app/spring-petclinic-docker/target/spring-petclinic-*.jar /app/spring-petclinic.jar

EXPOSE 8080
RUN echo "Running Spring Petclinic version $APP_VERSION"

CMD ["java", "-jar", "/app/spring-petclinic.jar"]