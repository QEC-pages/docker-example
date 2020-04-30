FROM ubuntu:xenial

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# to avoid setting up time zone
# ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get install -y \
    libblas-dev \
    liblapack-dev \
    libitpp-dev \
    libeigen3-dev

# note: gcc is install along with blas, g++ is installed along with eigen. make is also installed

RUN apt-get install -y emacs

COPY ./sample /root/sample
WORKDIR /root

# RUN useradd -ms /bin/bash guest

# COPY ./sample /home/guest/sample
# USER guest
# WORKDIR /home/guest