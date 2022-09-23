FROM openjdk:11
EXPOSE 8090
LABEL maintainer=hlz

COPY ./build/libs/redis-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]