docker build --build-arg USERNAME=`whoami` -t `whoami`-go .
docker image prune --force
