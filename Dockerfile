#2-stage build
#building a har file
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /docker/jenkinsdocker
COPY . /docker/jenkinsdocker
RUN mvn -f /docker/jenkinsdocker/pom.xml clean package



#create an image
FROM openjdk:8-jdk-alpine
EXPOSE 5000
COPY --from=build /docker/jenkinsdocker/targetjenkinsdocker jenkinsdocker.jar
ENTRYPOINT ["java -jar /jenkinsdocker.jar"]