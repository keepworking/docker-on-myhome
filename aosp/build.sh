docker build --build-arg USERNAME=`whoami` -t `whoami`-aosp .
docker image prune --force
