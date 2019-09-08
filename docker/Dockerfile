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
    && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyter pyfiglet pyinquirer prompt_toolkit==1.0.14 xmltodict

RUN pip3 uninstall -y ipython 

RUN pip3 install ipython==6.5.0

RUN useradd -ms /bin/bash -G sudo user

USER user
WORKDIR /home/user

RUN git clone --recursive https://github.com/UofT-HPRC/galapagos.git

RUN git clone https://github.com/tarafdar/HCAL_HLS4ML.git

ADD utoronto_license.sh /home/user/.license.sh

RUN touch /home/user/.bashrc \
    && echo "source .license.sh" >> /home/user/.bashrc
