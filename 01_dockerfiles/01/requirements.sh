apt-get update && apt-get upgrade -y && apt-get install -y wget
adduser --disabled-password --gecos "" teamspeak && \
cd /home/teamspeak && \
wget http://dl.4players.de/ts/releases/3.0.11.1/teamspeak3-server_linux-amd64-3.0.11.1.tar.gz && \
tar -xzvf *.tar.gz && rm *.tar.gz
apt-get clean
rm -rf /var/lib/apt/lists/*
