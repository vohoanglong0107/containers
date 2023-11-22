FROM rust:1.72.0-slim-buster 

RUN apt-get update \
  && apt-get upgrade --no-install-recommends -y --force-yes \
  && apt-get install -y --no-install-recommends \
  openssh-client \
  make \
  gcc \
  default-libmysqlclient-dev \
  libxrender1 \
  pkg-config \
  libssl-dev \
  libpq-dev \
  cmake \
  g++ \
  libsasl2-dev \
  libsasl2-2 \    
  libsasl2-modules

RUN rustup component add rust-analyzer rustfmt clippy && cargo install sqlx-cli

