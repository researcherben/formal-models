
# Initial attempt -- v0

`Dockerfile_v0` contains
```bash
# Use baseimage-docker which is a modified Ubuntu specifically for Docker
# https://hub.docker.com/r/phusion/baseimage
# https://github.com/phusion/baseimage-docker
#FROM phusion/baseimage:0.11
FROM phusion/baseimage:jammy-1.0.0

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Update and install packages
RUN apt update && apt -y upgrade && apt -y install \
    wget \
    sudo

RUN apt -y install \
    build-essential \
    python3-dev 

ARG INSTALL_PATH=/opt/gryphon

RUN mkdir $INSTALL_PATH

WORKDIR $INSTALL_PATH

RUN wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/raw/master/install_mp.bash

RUN chmod u+x $INSTALL_PATH/install_mp.bash 

RUN yes | bash $INSTALL_PATH/install_mp.bash ubuntu
```
I run 
```bash
docker build -f Dockerfile_v0 -t mp_gryphon .
```
and get an error:
```bash
#12 26.18 Unpacking git (1:2.34.1-1ubuntu1.6) ...
#12 26.51 Setting up liberror-perl (0.17029-1) ...
#12 26.52 Setting up git-man (1:2.34.1-1ubuntu1.6) ...
#12 26.53 Setting up git (1:2.34.1-1ubuntu1.6) ...
#12 26.60 /opt/gryphon/install_mp.bash: line 99: pip3: command not found
------
executor failed running [/bin/sh -c yes | bash $INSTALL_PATH/install_mp.bash ubuntu]: exit code: 127
make: *** [docker_build_v0] Error 1
```

# v1 -- add pip3

`Dockerfile_v1`
```bash
# Use baseimage-docker which is a modified Ubuntu specifically for Docker
# https://hub.docker.com/r/phusion/baseimage
# https://github.com/phusion/baseimage-docker
#FROM phusion/baseimage:0.11
FROM phusion/baseimage:jammy-1.0.0

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Update and install packages
RUN apt update && apt -y upgrade && apt -y install \
    wget \
    sudo

RUN apt -y install \
    build-essential \
    python3-dev \
    python3-pip 

ARG INSTALL_PATH=/opt/gryphon

RUN mkdir $INSTALL_PATH

WORKDIR $INSTALL_PATH

RUN wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/raw/master/install_mp.bash

RUN chmod u+x $INSTALL_PATH/install_mp.bash 

RUN yes | bash $INSTALL_PATH/install_mp.bash ubuntu
```
I run
```bash
docker build -f Dockerfile_v1 -t mp_gryphon .
```
and get an error:
```bash
#7 28.33 Get:97 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-wheel all 0.37.1-2 [31.9 kB]
#7 28.37 Get:98 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-pip all 22.0.2+dfsg-1 [1,306 kB]
#7 28.82 Fetched 89.3 MB in 24s (3,653 kB/s)
#7 28.82 E: Failed to fetch http://security.ubuntu.com/ubuntu/pool/main/l/linux/linux-libc-dev_5.15.0-56.62_amd64.deb  404  Not Found [IP: 91.189.91.39 80]
#7 28.82 E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
------
executor failed running [/bin/sh -c apt -y install     build-essential     python3-dev     python3-pip]: exit code: 100
```


