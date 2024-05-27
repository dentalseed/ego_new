#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <server_address>"
    exit 1
fi

URL="$1:8080/health"
SUCCESS_MESSAGE="SUCCESS"
MAX_ATTEMPTS=40
DELAY_SECONDS=1
# 도커 스탑, 삭제
docker stop $1
docker rm $1

# api 배포
docker compose -p $1 -f  ./dev/$1-compose.yml build && docker compose -p $1 -f  ./dev/$1-compose.yml up -d

# 실행 확인
attempt=1
while [ $attempt -le $MAX_ATTEMPTS ]
do
    echo "Attempting health check for server $1, attempt: $attempt"
   # Nginx 컨테이너에서 요청... 8080포트로 접근하기위해
    response=$( docker exec nginx curl -sS "$URL")
    if [[ $response == *"$SUCCESS_MESSAGE"* ]]; then
        echo "Health check successful for server $1!"
        exit 0
    else
        echo "Health check failed for server $1. Retrying in $DELAY_SECONDS seconds..."
        sleep $DELAY_SECONDS
        ((attempt++))
    fi
done
echo "Maximum attempts reached. Health check failed for server $1."
exit 1
