FROM registry.fedoraproject.org/fedora-toolbox:40

ENV GOPACKAGESDRIVER=/usr/local/bin/gopackagesdriver.sh
ENV ZSH=/usr/share/oh-my-zsh

COPY gopackagesdriver.sh /usr/local/bin/gopackagesdriver.sh

COPY etc /etc

WORKDIR /usr/local
COPY packages/system/ ./packages/system/
RUN ./packages/system/packages.sh && rm -r ./packages/system

WORKDIR /usr/local/packages/go
ENV GOPATH=/usr/local/packages/go/gopath
ENV GOBIN=${GOPATH}/bin
ENV PATH=${GOBIN}:$PATH
COPY packages/go/go.sh ./
RUN ./go.sh && rm go.sh

COPY packages/python/requirements.txt .
RUN python3 -m venv /usr/local/packages/python/venv && \
  /usr/local/packages/python/venv/bin/pip install -r requirements.txt && \
  rm requirements.txt
ENV PATH=/usr/local/packages/python/venv/bin:$PATH

WORKDIR /usr/local/packages/nodejs
COPY packages/nodejs/ ./
RUN npm ci
ENV PATH=/usr/local/packages/nodejs/node_modules/.bin:$PATH

COPY installers/  ./installers/
RUN ./installers/installers.sh && rm -rf ./installers

COPY usr /usr
RUN ln -s /usr/local/bin/podman /usr/local/bin/docker
