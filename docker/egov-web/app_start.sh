#!/bin/bash -e

java -Dspring.profiles.active=$ACTIVE_PROFILE -Djava.security.egd=file:/dev/./urandom -jar /$COPY_WAR_FILE