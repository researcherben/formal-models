FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y \
     build-essential \
     libc6-dev-i386 \
     csh \
     python3-pip \
     libgl1-mesa-glx \
     libxkbcommon-x11-0 \
     libegl1 \
     xcb \
     libqt5gui5


# Qt requires non-root
RUN adduser --quiet --disabled-password mp_user && usermod -a -G audio mp_user
USER mp_user:audio
RUN pip3 install --upgrade pip
RUN pip3 install \
     opencv-python-headless \
     PySide6 \
     pyqtdarktheme

# WORKDIR does not create directories
RUN mkdir /home/mp_user/mp_gryphon && \
    mkdir /home/mp_user/mp_gryphon/trace-generator && \
    mkdir /home/mp_user/mp_gryphon/gryphon && \
    mkdir /home/mp_user/mp_gryphon/preloaded-examples

WORKDIR /home/mp_user/mp_gryphon
ADD --chown=mp_user:audio gryphon.tar gryphon
ADD --chown=mp_user:audio trace-generator.tar trace-generator
ADD --chown=mp_user:audio preloaded-examples.tar preloaded-examples

# ADD chown doesn't work
USER root
run chown -R mp_user .
USER mp_user:audio

# build trace-generator
WORKDIR /home/mp_user/mp_gryphon/trace-generator/RIGAL/rigsc.446/src
RUN make

# Qt environment
ENV QT_DEBUG_PLUGINS=1

# open into Gryphon
WORKDIR /home/mp_user/mp_gryphon/gryphon/python
ENTRYPOINT ["python3", "mp.py", "-v"]
