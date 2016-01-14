FROM ubuntu:16.04
MAINTAINER Cedric DUE <cedric.due@gmail.com>

# Install node.js and git
RUN apt-get update && apt-get install -y \
  git \
  git-core \
  nodejs \
  npm \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Create a symlink for nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install grunt
RUN npm install -g grunt-cli

# Install reveal.js
RUN git clone https://github.com/hakimel/reveal.js.git
RUN cd reveal.js; npm install

# Replace example slides given with reveal.js with our slides
# COPY index.html /slides/
RUN rm /reveal.js/index.html
RUN ln -s /slides/index.html /reveal.js/index.html
RUN ln -s /slides/assets /reveal.js/assets

WORKDIR reveal.js
CMD grunt serve
EXPOSE 8000
