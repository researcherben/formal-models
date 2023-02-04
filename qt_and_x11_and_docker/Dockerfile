from ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential libc6-dev-i386 csh
RUN apt-get install -y python3-pip

# Qt requires non-root
RUN adduser --quiet --disabled-password mp_user && usermod -a -G audio mp_user
USER mp_user:audio
RUN pip3 install --upgrade pip
RUN pip3 install opencv-python-headless
RUN pip3 install PySide6
RUN pip3 install pyqtdarktheme

WORKDIR /opt

COPY minimum_qt_demo.py /opt 

# Qt environment
ENV QT_DEBUG_PLUGINS=1


