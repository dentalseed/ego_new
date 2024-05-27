if [ $# -ne 1 ]; then
    echo "Usage: $0 <server_address>"
    exit 1
fi

# 도커 스탑, 삭제
docker stop $1
docker rm $1

# api 배포 test
docker compose -p $1 -f  ./dev/$1-compose.yml build && docker compose -p $1 -f  ./dev/$1-compose.yml up -d

# 실행 확인
echo "Deployment successful for server $1!"
exit 0
