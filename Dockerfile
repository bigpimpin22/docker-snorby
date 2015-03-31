FROM  themistymay/snort:0.1.0
MAINTAINER Mike May <themistymay@gmail.com>

RUN apt-get update
RUN apt-get install -y -q ruby1.9.3 mysql-server libmysqlclient-dev

RUN gem install bundler

RUN git clone git://github.com/Snorby/snorby.git /usr/local/src/snorby

WORKDIR /usr/local/src/snorby
RUN bundle install

RUN mkdir -p /usr/local/src/snorby/config
COPY files/config /usr/local/src/snorby/config/

ENV DB_ADDRESS=127.0.0.1 DB_USER=root DB_PASS= SNORBY_CONFIG=/usr/local/src/snorby/config/snorby_config.yml OINKCODE=community

ADD files/bootstrap.sh /bootstrap.sh

ENTRYPOINT ["/bootstrap.sh"]
