# how to run : docker run -it -v /Users/baudiber/.vimrc:/.vimrc -v /Users/baudiber/docker_files:/files <nameofbuild>

FROM	debian

RUN		apt-get update && apt-get upgrade && apt-get install -y \
		sudo \
		python vim bc htop ssh software-properties-common curl \
		gcc autoconf automake pkg-config \
		valgrind \
		git \
		nodejs \
		php \
		cmake make
