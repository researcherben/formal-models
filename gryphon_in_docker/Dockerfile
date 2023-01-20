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

WORKDIR /opt

#RUN cd /opt/ && wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/blob/master/install_mp.bash

RUN wget https://gitlab.nps.edu/monterey-phoenix/user-interfaces/gryphon/-/raw/master/install_mp.bash

RUN chmod u+x /opt/install_mp.bash 

RUN yes | bash /opt/install_mp.bash ubuntu

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

WORKDIR /root/mp_gryphon/gryphon/python


