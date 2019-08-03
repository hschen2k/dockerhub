FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && npm i -g yarn \
  && curl https://getsubstrate.io -sSf | bash -s -- --fast \
  && /bin/bash -c "source ~/.cargo/env" \
  && echo "source ~/.cargo/env" >> ~/.profile \
  && git clone https://github.com/paritytech/substrate-up \
  && cp -a substrate-up/substrate-* ~/.cargo/bin \
  && cp -a substrate-up/polkadot-* ~/.cargo/bin \
  && substrate-node-new substrate-node-template demo \
  && substrate-ui-new substrate
