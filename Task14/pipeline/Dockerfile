FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk git maven curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN ./mvnw package

EXPOSE 8080

CMD ["java", "-jar", "/app/target/spring-petclinic-3.3.0-SNAPSHOT.jar"]
