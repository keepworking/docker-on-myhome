docker build --build-arg USERNAME=`whoami` -t `whoami`-example .
docker image prune --force
