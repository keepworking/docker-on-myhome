docker build --build-arg USERNAME=`whoami` -t `whoami`-con-urllib3 .
docker image prune --force
