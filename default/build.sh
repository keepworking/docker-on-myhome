docker build --build-arg USERNAME=`whoami` -t `whoami`-default .
docker image prune --force
