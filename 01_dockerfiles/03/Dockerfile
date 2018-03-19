FROM	debian

EXPOSE	5432 5431

EXPOSE	6379

EXPOSE	22/tcp 80/tcp 443/tcp

RUN		apt-get update && apt-get upgrade -y && \
		apt-get install -y sudo \
	    build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libre2-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate rsync python-docutils pkg-config cmake \
		git-core

RUN		sudo apt-get remove ruby1.8
RUN 	mkdir /tmp/ruby && cd /tmp/ruby && \
		curl --remote-name --progress https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.3.tar.gz && \
		tar xzf ruby-2.4.3.tar.gz && cd ruby-2.4.3 && ./configure --disable-install-rdoc && \
		make && sudo make install

RUN		sudo gem install bundler --no-ri --no-rdoc

RUN		curl --remote-name --progress https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && \
		echo '1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772  go1.8.3.linux-amd64.tar.gz' | shasum -a256 -c - && \
  		sudo tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz && \
  		sudo ln -sf /usr/local/go/bin/{go,godoc,gofmt} /usr/local/bin/ && \
  		rm go1.8.3.linux-amd64.tar.gz

RUN		curl --location https://deb.nodesource.com/setup_8.x | sudo bash - &&  sudo apt-get install -y nodejs && \
		curl --silent --show-error https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
		sudo apt-get update && \
		sudo apt-get install yarn

RUN 	sudo adduser --disabled-login --gecos 'GitLab' git

RUN		sudo apt-get install -y postgresql postgresql-client libpq-dev postgresql-contrib

USER	postgres 

RUN     /etc/init.d/postgresql start && psql -d template1 -c "CREATE USER git CREATEDB;" && psql -d template1 -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;" && psql -d template1 -c "CREATE DATABASE gitlabhq_production OWNER git;"

USER	root

RUN 	sudo apt-get install -y redis-server

WORKDIR	/home/git

RUN		sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-ce.git -b 10-6-stable gitlab

WORKDIR	/home/git/gitlab

RUN		sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml && \
		sudo -u git -H cp config/secrets.yml.example config/secrets.yml && \
		sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb && \
		sudo -u git -H cp config/initializers/rack_attack.rb.example config/initializers/rack_attack.rb 

RUN		sudo -u git -H chmod 0600 config/secrets.yml && \
		sudo -u git -H chown -R git log/ && \
		sudo -u git -H chown -R git tmp/ && \
		sudo -u git -H chmod -R u+rwX,go-w log/ && \
		sudo -u git -H chmod -R u+rwX tmp/ && \
		sudo -u git -H chmod -R u+rwX tmp/pids/ && \
		sudo -u git -H chmod -R u+rwX tmp/sockets/ && \
		sudo -u git -H mkdir public/uploads/ && \
		sudo -u git -H chmod 0700 public/uploads && \
		sudo -u git -H chmod -R u+rwX builds/ && \
		sudo -u git -H chmod -R u+rwX shared/artifacts/ && \
		sudo -u git -H chmod -R ug+rwX shared/pages/ && \
		sudo -u git -H git config --global core.autocrlf input && \
		sudo -u git -H git config --global gc.auto 0 && \
		sudo -u git -H git config --global repack.writeBitmaps true && \
		sudo -u git -H git config --global receive.advertisePushOptions true

RUN		cp config/database.yml.postgresql config/database.yml && \
		chmod o-rwx config/database.yml

RUN 	apt-get update && apt-get install -y \
		libpq-dev \
		nodejs \
		patch \
		zlib1g-dev \
		liblzma-dev \
		golang

RUN 	sudo -u git -H bundle install --deployment --without development test mysql aws kerberos
RUN		gem install rails
#RUN	service postgresql restart
RUN 	bundle exec rake gitlab:shell:install REDIS_URL=unix:/var/run/redis/redis.sock RAILS_ENV=production SKIP_STORAGE_VALIDATION=true

RUN		bundle exec rake "gitlab:workhorse:install[/home/git/gitlab-workhorse]" RAILS_ENV=production
RUN		bundle exec rake gitlab:setup -q RAILS_ENV=production --trace | echo yes
