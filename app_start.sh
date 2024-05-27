#!/bin/bash -e

java -Dspring.profiles.active=local -Djava.security.egd=file:/dev/./urandom -jar /$COPY_WAR_FILE