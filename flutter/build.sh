docker build --build-arg USERNAME=`whoami` -t `whoami`-flutter .
docker image prune --force
