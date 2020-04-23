FROM ubuntu:latest
MAINTAINER Avinash Ravishankar <avinash.ravishankar@outlook.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | \
debconf-set-selections

RUN apt-get update && apt-get install -y apt-utils \
       && apt-get install -y software-properties-common \
       && add-apt-repository universe \
       && apt-get install -y git \
       && apt-get install -y fontconfig \
       && mkdir -p ~/.fonts/SF-Pro \
       && apt-get update && apt-get -y upgrade \
       && apt-get install -y texlive-xetex

RUN git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git \
       ~/.fonts/SF-Pro \
       && fc-cache -f -v \
       && rm -rf /var/lib/apt/lists/*

WORKDIR ~/
