FROM openjdk:8-jdk-slim
LABEL authors="dhwnk"

# Dockerfile 변수 선언
ARG WAR_FILE=egov.war
ARG COPY_WAR_FILE=egov.war

# 컨테이너의 환경 변수 선언
ENV COPY_WAR_FILE=${COPY_WAR_FILE}

ADD ${WAR_FILE} ${COPY_WAR_FILE}
ADD app_start.sh app_start.sh
ENTRYPOINT ["bash", "-e", "app_start.sh"]
#ENTRYPOINT ["java", "-Dspring.profiles.active=dev", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/$COPY_JAR_FILE"]
