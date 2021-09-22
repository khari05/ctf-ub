FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -yq vim nano pip python \
  binwalk steghide file imagemagick zbar-tools \
  radare2 gdb \
  john hashcat ophcrack
RUN apt-get clean

COPY requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /stuff
