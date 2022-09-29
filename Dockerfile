FROM openjdk:11
#镜像环境
LABEL maintainer=hlz

COPY ./build/libs/redis-0.0.1-SNAPSHOT.jar /app.jar
#运行环境内目录

ENTRYPOINT ["java","-jar","/app.jar"]