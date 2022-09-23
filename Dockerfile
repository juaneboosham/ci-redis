FROM openjdk:11
EXPOSE 8090
LABEL maintainer=hlz

COPY ./**/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]