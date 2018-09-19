FROM eosio/builder as builder
ARG version="v1.3.0"
ARG symbol="EOS"

RUN git clone -b $version https://github.com/EOSIO/eos.git --recursive \
    && cd eos && echo "$version:$(git rev-parse HEAD)" > /etc/eosio-version \
    && cmake -j -DCMAKE_BUILD_TYPE=Release -DBINARYEN_BIN=/eos/externals/binaryen/bin -DWASM_ROOT=/opt/wasm -DOPENSSL_ROOT_DIR=/usr/bin/openssl -DOPENSSL_LIBRARIES=/usr/lib/ssl -DBUILD_MONGO_DB_PLUGIN=true . \
    && make -j \
    && make install


FROM ubuntu:18.04

LABEL maintainer="nanmu42 <i@nanmu.me>" version=$version \
  description="EOS docker image for mainnet production"
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssl ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/eosio/bin/ /opt/eosio/bin
COPY --from=builder /eos/contracts /
COPY --from=builder /eos/Docker/config.ini /
COPY --from=builder /etc/eosio-version /etc
COPY --from=builder /eos/Docker/nodeosd.sh /opt/eosio/bin/nodeosd.sh
ENV EOSIO_ROOT=/opt/eosio
RUN chmod +x /opt/eosio/bin/nodeosd.sh
VOLUME /opt/eosio/bin/data-dir
ENV PATH /opt/eosio/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
