FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

#CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
CMD ["java", "-Dspring.data.mongodb.uri=mongodb://springboot-mongo:27017/spring-boot-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-boot-mongo-1.0.jar"]