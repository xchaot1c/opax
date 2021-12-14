FROM debian:buster-slim

RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends ca-certificates dirmngr wget \
    && apt-get clean 

ENV BITCOIN_VERSION 0.21.0
ENV BITCOIN_URL https://bitcoincore.org/bin/bitcoin-core-0.21.0/bitcoin-0.21.0-x86_64-linux-gnu.tar.gz
ENV BITCOIN_SHA256 da7766775e3f9c98d7a9145429f2be8297c2672fe5b118fd3dc2411fb48e0032
ENV BITCOIN_DATA /bitcoin

RUN  mkdir $BITCOIN_DATA && \
     wget -qO /tmp/bitcoin.tar.gz "$BITCOIN_URL" && \
     echo "$BITCOIN_SHA256 /tmp/bitcoin.tar.gz" | sha256sum -c - && \
     tar -xzvf /tmp/bitcoin.tar.gz -C /bitcoin && \
     ln -s /$BITCOIN_DATA/bitcoin-${BITCOIN_VERSION}/ /$BITCOIN_DATA/latest && \
     rm -rf /tmp/* && \
	 groupadd -g 1000 -r bitcoin && \
     useradd -u 1000 -g bitcoin -d /$BITCOIN_DATA bitcoin && \
     chown -R bitcoin:bitcoin "$BITCOIN_DATA"

WORKDIR $BITCOIN_DATA
VOLUME  $BITCOIN_DATA
USER bitcoin

ENTRYPOINT ["/bitcoin/latest/bin/bitcoind"]
EXPOSE 8332 8333 18332 18333 18443 18444
