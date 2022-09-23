FROM openjdk:20-ea-11-jdk-slim
LABEL maintainer=hlz

COPY build/libs/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]