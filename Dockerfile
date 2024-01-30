FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

RUN apt update && apt install -yq \
  tmux git vim nano man-db \
  pip python3 \
  binwalk steghide file imagemagick zbar-tools multimon-ng outguess \
  gdb \
  john hashcat ophcrack \
  python-gmpy2-common sagemath \
  netcat telnet \
  nmap traceroute aircrack-ng \
  device-tree-compiler \
  && apt clean

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN git clone https://github.com/longld/peda.git ~/peda && \
  echo "source ~/peda/peda.py" >> ~/.gdbinit

WORKDIR /stuff
