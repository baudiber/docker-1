FROM	debian:9

RUN		apt-get update && apt-get upgrade -y && \
			apt-get install -y curl \
			git \
			autoconf \
			automake \
			libtool \
			clang \
			gcc \
			make \
			vim

RUN		git clone https://github.com/json-c/json-c.git 
WORKDIR	json-c

RUN		sh autogen.sh
RUN		./configure 
RUN		make	
RUN		make install
WORKDIR /usr/local/lib/
RUN		rm libjson-c.so.4 libjson-c.so.4.0.0
WORKDIR /
