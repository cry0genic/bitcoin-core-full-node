FROM ubuntu:latest

RUN useradd -r app

RUN apt-get update \
    && apt-get install -y wget

ENV BITCOIN_VERSION=23.0

RUN wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz 

ENV APP_HOME=/home/app/unpkg

ENV BITCOIN_HOME=/home/app/.bitcoin

RUN mkdir -p ${APP_HOME}

RUN tar -xzf *.tar.gz -C ${APP_HOME}

ENV PATH=${APP_HOME}/bitcoin-${BITCOIN_VERSION}/bin:$PATH

COPY ./rpcauth.py ${APP_HOME}/share/rpcauth

WORKDIR ${BITCOIN_HOME}

COPY ./bitcoin.conf ./

RUN chmod 700 ${BITCOIN_HOME}

RUN chown -R app ${BITCOIN_HOME}

CMD bitcoind -regtest -datadir=/home/app/.bitcoin