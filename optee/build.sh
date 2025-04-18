docker build --build-arg USERNAME=`whoami` -t `whoami`-optee .
docker image prune --force
