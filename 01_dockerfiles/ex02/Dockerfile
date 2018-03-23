FROM 	debian

COPY 	. /opt/app/
WORKDIR	/opt/app/hello

RUN 	apt-get update && apt-get install -y \
			libpq-dev \
			nodejs \ 
			build-essential \
			patch \
			zlib1g-dev \
			liblzma-dev \
	 		ruby \
			ruby-dev  && \
			gem install rails 

RUN		apt-get update && apt-get install -y \
		   	libsqlite3-dev && \
			bundle update

EXPOSE 	3000
