docker build --build-arg USERNAME=`whoami` \
             --build-arg USERUID=`id -u` \
             --build-arg USERGID=`id -g` \
	     --no-cache -t `whoami`-base .
