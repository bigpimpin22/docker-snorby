FROM  themistymay/snort:0.1.0
MAINTAINER Mike May <themistymay@gmail.com>

RUN apt-get update
RUN apt-get install -y -q ruby1.9.3

RUN gem install bundler

RUN git clone git://github.com/Snorby/snorby.git /usr/local/src/snorby

WORKDIR /usr/local/src/snorby
RUN bundle install
