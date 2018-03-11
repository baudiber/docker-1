FROM 	debian


COPY 	. /opt/app/

RUN 	apt-get update && apt-get install -y libpq-dev nodejs
RUN     apt-get install -y build-essential patch zlib1g-dev liblzma-dev
RUN		apt-get install -y ruby ruby-dev 
RUN		gem install rails

RUN		apt-get install -y libsqlite3-dev
RUN		bundle update
RUN		rails s

WORKDIR	/opt/app/hello

EXPOSE 	3000

