FROM registry.fedoraproject.org/fedora-toolbox:38-15 as builder

RUN dnf install -y \
  gcc-c++-13.1.1 \
  java-11-openjdk-headless-11.0.19.0.7 \
  make-4.4 \
  && dnf clean all

RUN wget -qO /usr/local/bin/bazel \
  https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 && \
  chmod +x /usr/local/bin/bazel

WORKDIR /app/copybara

RUN git init && \
  git remote add origin https://github.com/google/copybara.git && \
  git fetch --depth 1 origin 241a8132d2705c96e71773f97a8acabe9c092020 && \
  git checkout FETCH_HEAD && \
  /usr/local/bin/bazel build //java/com/google/copybara:copybara_deploy.jar --java_runtime_version=remotejdk_11

RUN echo '#!/usr/bin/env -S java -jar' > ./copybara_wrapper && \
  cat bazel-bin/java/com/google/copybara/copybara_deploy.jar >> ./copybara_wrapper && \
  chmod +x ./copybara_wrapper

FROM registry.fedoraproject.org/fedora-toolbox:38-15

ENV PATH=$PATH:/usr/local/go/bin:/usr/local/cargo/bin
ENV GOPACKAGESDRIVER=/usr/local/bin/gopackagesdriver.sh
# https://github.com/rust-lang/rustup/issues/618#issuecomment-570951132
ENV CARGO_HOME=/usr/local/cargo
ENV RUSTUP_HOME=/usr/local/rust
ENV ZSH=/usr/share/oh-my-zsh

COPY --from=builder /app/copybara/copybara_wrapper /usr/local/bin/copybara

COPY etc /etc

WORKDIR /usr/local
COPY packages/system/ ./packages/system/
RUN ./packages/system/packages.sh && rm -r ./packages/system

COPY installers/  ./installers/
RUN ./installers/installers.sh && rm -rf ./installers

COPY packages/python/requirements.txt .
RUN python3 -m venv /usr/local/packages/python/venv && \
  /usr/local/packages/python/venv/bin/pip install -r requirements.txt && \
  rm requirements.txt
ENV PATH=/usr/local/packages/python/venv/bin:$PATH

WORKDIR /usr/local/packages/nodejs
COPY packages/nodejs/ ./
RUN npm ci
ENV PATH=/usr/local/packages/nodejs/node_modules/.bin:$PATH

COPY gopackagesdriver.sh /usr/local/bin/gopackagesdriver.sh

COPY usr /usr
RUN ln -s /usr/local/bin/podman /usr/local/bin/docker
