FROM openjdk:8-jre-alpine

ADD Spring-starter/complete/target/gs-spring-boot-*.jar app-server.jar

ENTRYPOINT ["sh", "-c", "java -jar /app-server.jar"]

EXPOSE 8080