FROM debian

MAINTAINER baudiber <baudiber@student.42.fr>

EXPOSE 9987
EXPOSE 30033
EXPOSE 10011

#ADD requirements.sh /
ADD script /etc/init.d/teamspeak

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget && \
		adduser --disabled-password --gecos "" teamspeak && \
		cd /home/teamspeak && echo $(pwd) && \
		wget http://dl.4players.de/ts/releases/3.0.11.1/teamspeak3-server_linux-x86-3.0.11.1.tar.gz && \
		tar -xzvf *.tar.gz && rm *.tar.gz && \
		cd / 

RUN chmod 700 /etc/init.d/teamspeak && \
		update-rc.d teamspeak defaults && \
		service teamspeak start > logs.txt


