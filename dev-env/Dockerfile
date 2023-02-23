FROM registry.fedoraproject.org/fedora-toolbox:37

# Neovim deps: ripgrep, fd-find, neovim, python3-neovim, make,gcc, gcc-c++, wl-clipboard
# Kitty for kitty terminfo

RUN dnf install -y \
  bat-0.21.0 \
  fd-find-8.2.1 \
  foot-terminfo-1.13.1 \
  fzf-0.35.1 \
  gcc-12.2.1 \
  gcc-c++-12.2.1 \
  gh-2.23.0 \
  jq-1.6 \
  make-4.3 \
  neovim-0.8.3 \
  nodejs-18.12.1-1.fc37.x86_64 \
  python3-3.11.0 \
  ripgrep-13.0.0 \
  wl-clipboard-2.0.0 \
  zsh-5.9 \
  && dnf clean all

RUN python3 -m venv /usr/local/venv && \
  /usr/local/venv/bin/pip install pynvim

RUN wget -q https://go.dev/dl/go1.20.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz \
  && rm go1.20.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

RUN wget -qO /usr/local/bin/bazel \
  https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 \
  && chmod +x /usr/local/bin/bazel

COPY gopackagesdriver.sh /usr/local/bin/gopackagesdriver.sh

ENV GOPACKAGESDRIVER=/usr/local/bin/gopackagesdriver.sh

COPY podman /usr/local/bin/podman
RUN ln -s /usr/local/bin/podman /usr/local/bin/docker
COPY buildah /usr/local/bin/buildah

# https://github.com/rust-lang/rustup/issues/618#issuecomment-570951132
ENV CARGO_HOME=/usr/local/cargo
ENV RUSTUP_HOME=/usr/local/rust
RUN wget -qO /tmp/rust-init.sh https://sh.rustup.rs \
  && chmod +x /tmp/rust-init.sh \
  && /tmp/rust-init.sh -y --no-modify-path \
  && rm /tmp/rust-init.sh
ENV PATH=$PATH:/usr/local/cargo/bin

ENV ZSH=/usr/share/oh-my-zsh

RUN git clone --single-branch --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${ZSH} \
  && \
  git clone --single-branch --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k \ 
  && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH}/custom/plugins/zsh-autosuggestions \ 
  && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH}/custom/plugins/zsh-syntax-highlighting
