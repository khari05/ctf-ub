FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

RUN apt-get update && apt-get install -yq \
  tmux vim nano man-db \
  pip python \
  binwalk steghide file imagemagick zbar-tools \
  radare2 gdb \
  john hashcat ophcrack \
  python-gmpy2-common sagemath \
  netcat nmap telnet \
  && apt-get clean

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /stuff
