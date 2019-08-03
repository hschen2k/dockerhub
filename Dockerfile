FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install curl \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && npm i -g yarn \
  && curl https://getsubstrate.io -sSf | bash -s -- --fast \
  && source ~/.cargo/env \
  && echo "source ~/.cargo/env" >> ~/.profile \
  && f=`mktemp -d` \
  && git clone https://github.com/paritytech/substrate-up $f \
  && cp -a $f/substrate-* ~/.cargo/bin \
  && cp -a $f/polkadot-* ~/.cargo/bin \
  && substrate-node-new substrate-node-template demo \
  && substrate-ui-new substrate
