UBT=$1
docker build --build-arg USERNAME=`whoami` \
             --build-arg USERUID=`id -u` \
             --build-arg USERGID=`id -g` \
             --build-arg UBT_VER="${UBT:-22.04}" \
	     --no-cache -t `whoami`-base${UBT:-22.04} .

docker image prune --force
