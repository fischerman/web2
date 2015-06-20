FROM tutum/lamp
MAINTAINER fischerman

RUN apt-get update && \
  apt-get -y install nodejs npm ruby-full

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN gem install sass
RUN npm install -g grunt-cli
RUN npm install -g bower

WORKDIR /tmp

RUN git clone https://github.com/fischerman/web2.git web2

WORKDIR /tmp/web2

RUN npm install
RUN bower install --allow-root

RUN grunt

RUN cp dist/ /app
