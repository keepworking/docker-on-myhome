docker build --build-arg USERNAME=`whoami` -t `whoami`-yocto .
docker image prune --force
