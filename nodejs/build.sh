docker build --build-arg USERNAME=`whoami` -t `whoami`-nodejs .
docker image prune --force
