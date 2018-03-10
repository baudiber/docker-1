FROM 	debian

EXPOSE 	3000

COPY 	. /opt/app/

RUN 	apt-get update && apt-get install -y libpq-dev nodejs
RUN     apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN		gem install rails

WORKDIR	/opt/app/hello

