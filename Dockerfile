FROM ubuntu:latest

RUN mkdir /opt/dymodriver
WORKDIR /opt/dymodriver

RUN apt update -y

RUN apt install -y -qq \
    libboost-all-dev \
    cups \
    libcups2-dev \
    git

RUN git clone https://github.com/dymosoftware/Drivers.git .

RUN apt install -y -qq \
    build-essential \
    autoconf \
    automake \
    checkinstall \
    autotools-dev

WORKDIR /opt/dymodriver/LW5xx_Linux

RUN aclocal
RUN automake
RUN autoconf -i -v -f
RUN sh ./configure  

# Fix broken files
RUN sed -i 's/#include <unistd.h>/#include <unistd.h>\n#include <ctime>/' src/lm/LabelManagerLanguageMonitorV2.cpp

RUN make

RUN checkinstall --install=no --pkgversion='1.0'
