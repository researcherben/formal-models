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

RUN apt --purge autoremove python3-pip

RUN apt install -y python3-pip

# adding non-root user
# based on https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=auser
ARG USER_ID=1000
ARG USER_GID=$USER_ID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd  --uid $USER_ID --gid $USER_GID $USERNAME && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

ARG INSTALL_PATH=/opt/gryphon

RUN mkdir $INSTALL_PATH
RUN chgrp $USER_GID $INSTALL_PATH
RUN chown $USER_ID  $INSTALL_PATH

ARG INSTALL_PATH=$INSTALL_PATH

USER $USERNAME

WORKDIR $INSTALL_PATH

#RUN cd /opt/ && wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/blob/master/install_mp.bash

RUN wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/raw/master/install_mp.bash

RUN chmod u+x $INSTALL_PATH/install_mp.bash 

USER root

RUN yes | bash $INSTALL_PATH/install_mp.bash ubuntu

# these installions are an attempt to debug the Qt issues

RUN apt -y install \
    libgl1-mesa-glx

RUN apt -y install \
     libxkbcommon-x11-0

RUN apt -y install \
    libegl1

#RUN apt -y install \
#    qt5-default

RUN apt -y install \
    xcb

# https://stackoverflow.com/a/69817921/1164295
RUN apt-get install -y libqt5gui5 && \
    rm -rf /var/lib/apt/lists/*
ENV QT_DEBUG_PLUGINS=1

USER $USERNAME

#WORKDIR /root/mp_gryphon/gryphon/python

#RUN chmod 777 -R *

