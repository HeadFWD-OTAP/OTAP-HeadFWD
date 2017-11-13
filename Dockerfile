FROM openjdk:8-jre-alpine

COPY /Spring-starter/complete/target

RUN java -jar