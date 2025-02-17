FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y \ 
    build-essential \
    wget \
    sudo \
    net-tools \
    iputils-ping \
    python \
    && \
    rm -rf /var/lib/apt/lists/*

#get boost
RUN cd /home && wget http://downloads.sourceforge.net/project/boost/boost/1.66.0/boost_1_66_0.tar.gz \
  && tar xfz boost_1_66_0.tar.gz \
  && rm boost_1_66_0.tar.gz \
  && cd boost_1_66_0 \
  && ./bootstrap.sh --prefix=/usr/local  --with-libraries=system,thread,program_options,log  \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_66_0

RUN useradd -ms /bin/bash -G sudo user

USER user
WORKDIR /home/user


#get all runtime files and make
RUN mkdir /home/user/galapagos_runtime \
    &&  cd galapagos_runtime \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/Makefile \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/control_device.cpp \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/control_device.hpp \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/net_control_device.hpp \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/net_control_device.cpp \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/net_control_server.cpp \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/util.h \
    && wget https://raw.githubusercontent.com/UofT-HPRC/galapagos/dev/middleware/control/gmem.py \
    && make net_control_server \
    && cd 


RUN export LD_LIBRARY_PATH=/usr/local/lib \
    && touch .bashrc \ 
    && echo "export LD_LIBRARY_PATH=\"/usr/local/lib\"" >> .bashrc 


