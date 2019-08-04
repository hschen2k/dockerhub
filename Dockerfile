FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && npm i -g yarn \
  && curl https://getsubstrate.io -sSf | bash -s -- --fast

RUN /bin/bash -c "source ~/.cargo/env" \
  && echo "source ~/.cargo/env" >> ~/.profile \
  && echo "source ~/.cargo/env" >> ~/.bashrc \
  && f=`mktemp -d` \
  && git clone https://github.com/paritytech/substrate-up $f \
  && cp -a $f/substrate-* ~/.cargo/bin \
  && cp -a $f/polkadot-* ~/.cargo/bin

RUN /bin/bash -c "~/.cargo/bin/substrate-node-new substrate-node-template demo" \
  && /bin/bash -c "~/.cargo/bin/substrate-ui-new substrate"
