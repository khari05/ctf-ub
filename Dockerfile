FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -yq tmux vim nano \
  pip python \
  binwalk steghide file imagemagick zbar-tools \
  radare2 gdb \
  john hashcat ophcrack \
  python-gmpy2-common sagemath \
  netcat nmap telnet
RUN apt-get clean

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /stuff
