FROM	debian

RUN		apt-get update && apt-get upgrade && apt-get install -y \
		sudo \
		vim bc curl gcc autoconf automake pkg-config valgrind git cmake make

CMD		git clone https://github.com/bendatta/mlx-template.git && bash
