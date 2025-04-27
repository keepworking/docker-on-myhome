#docker run --rm -it --privileged --cap-add=SYS_ADMIN --security-opt apparmor=linux-sandbox -v /home/`whoami`:/home/`whoami` --net=host `whoami`-aosp
docker run --rm -it --privileged --security-opt apparmor=linux-sandbox -v /home/`whoami`:/home/`whoami` --net=host `whoami`-aosp
