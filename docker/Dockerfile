FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y \ 
    git \
    cmake \
    build-essential \
    wget \
    python3 \
    python3-pip \ 
    ipython \
    ipython-notebook \
    grep \
    screen \  
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxrandr2 \
    libfreetype6 \
    libfontconfig \
    vim \
    sudo \
    net-tools \
    iputils-ping \
    && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyter pyfiglet pyinquirer prompt_toolkit==1.0.14 xmltodict numpy

RUN pip3 uninstall -y ipython 

RUN pip3 install ipython==6.5.0

RUN cd /home && wget http://downloads.sourceforge.net/project/boost/boost/1.66.0/boost_1_66_0.tar.gz \
  && tar xfz boost_1_66_0.tar.gz \
  && rm boost_1_66_0.tar.gz \
  && cd boost_1_66_0 \
  && ./bootstrap.sh --prefix=/usr/local  --with-libraries=system,thread,program_options  \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_66_0

RUN useradd -ms /bin/bash -G sudo user

USER user
WORKDIR /home/user

#configures bash_kernel
RUN git clone https://github.com/takluyver/bash_kernel \
    && cd /home/user/bash_kernel \
    && pip3 install bash_kernel \
    && python3 -m bash_kernel.install
RUN rm -rf /home/user/bash_kernel

RUN git clone --recursive https://github.com/UofT-HPRC/galapagos.git

RUN git clone https://github.com/tarafdar/HCAL_HLS4ML.git


