FROM	debian:9

VOLUME /User/Admin/WM

RUN		apt-get update && apt-get upgrade -y && \
			apt-get install -y curl \
			git \
			autoconf \
			automake \
			libtool \
			clang \
			gcc \
			make

RUN		git clone https://github.com/json-c/json-c.git 
WORKDIR	json-c

RUN		sh autogen.sh

RUN		./configure 
RUN		make	
RUN		make install
WORKDIR /


