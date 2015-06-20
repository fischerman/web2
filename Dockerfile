FROM tutum/lamp
MAINTAINER fischerman

RUN apt-get update &&
  apt-get -y install nodejs npm ruby-full

RUN gem install sass
RUN npm install -g grunt-cli

WORKDIR /tmp

RUN git clone https://github.com/fischerman/web2.git web2

WORKDIR /tmp/web2

RUN grunt

RUN cp dist/ /app
