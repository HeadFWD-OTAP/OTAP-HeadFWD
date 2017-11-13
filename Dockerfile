FROM openjdk:8-jre-alpine

COPY /Spring-starter/complete/target /target/

RUN java -jar /target/gs-spring-boot-0.1.0.jar