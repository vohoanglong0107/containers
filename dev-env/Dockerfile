FROM registry.fedoraproject.org/fedora-toolbox:38

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
RUN git clone --single-branch --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${ZSH} && \
  git clone --single-branch --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH}/custom/plugins/zsh-autosuggestions && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH}/custom/plugins/zsh-syntax-highlighting

RUN wget -qO  lazygit_0.37.0_Linux_x86_64.tar.gz  https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Linux_x86_64.tar.gz && \
  wget -qO /tmp/checksums.txt https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/checksums.txt && \
  sha256sum --check --ignore-missing < /tmp/checksums.txt && \
  tar -C /usr/local/bin -xzf lazygit_0.37.0_Linux_x86_64.tar.gz lazygit  && \
  rm /tmp/checksums.txt lazygit_0.37.0_Linux_x86_64.tar.gz

RUN wget -qO /tmp/argocd https://github.com/argoproj/argo-cd/releases/download/v2.6.6/argocd-linux-amd64 &&\
  install -m 555 /tmp/argocd /usr/local/bin/argocd && \
  rm /tmp/argocd

# hadolint ignore=DL4006
RUN wget -qO /tmp/kubectl https://dl.k8s.io/release/v1.24.12/bin/linux/amd64/kubectl && \
  wget -qO /tmp/kubectl.sha256 "https://dl.k8s.io/v1.24.12/bin/linux/amd64/kubectl.sha256" && \
  echo "$(cat /tmp/kubectl.sha256)  /tmp/kubectl" | sha256sum --check && \
  install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl && \
  rm /tmp/kubectl /tmp/kubectl.sha256

RUN wget -qO go-containerregistry_Linux_x86_64.tar.gz https://github.com/google/go-containerregistry/releases/download/v0.14.0/go-containerregistry_Linux_x86_64.tar.gz && \
  wget -qO checksums.txt https://github.com/google/go-containerregistry/releases/download/v0.14.0/checksums.txt && \
  sha256sum --check --ignore-missing < checksums.txt && \
  tar -C /usr/local/bin -xzf go-containerregistry_Linux_x86_64.tar.gz crane gcrane && \
  rm go-containerregistry_Linux_x86_64.tar.gz checksums.txt

RUN wget -q https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/kubeseal-0.20.2-linux-amd64.tar.gz && \
  tar -xvzf kubeseal-0.20.2-linux-amd64.tar.gz kubeseal && \
  install -m 755 kubeseal /usr/local/bin/kubeseal && \
  rm kubeseal kubeseal-0.20.2-linux-amd64.tar.gz

RUN wget -qO tektoncd-cli-0.30.0_Linux-64bit.rpm https://github.com/tektoncd/cli/releases/download/v0.30.0/tektoncd-cli-0.30.0_Linux-64bit.rpm && \
  wget -qO /tmp/checksums.txt https://github.com/tektoncd/cli/releases/download/v0.30.0/checksums.txt && \
  sha256sum --check --ignore-missing < /tmp/checksums.txt && \
  dnf -y install tektoncd-cli-0.30.0_Linux-64bit.rpm && \
  rm /tmp/checksums.txt tektoncd-cli-0.30.0_Linux-64bit.rpm && \
  dnf clean all

COPY etc /etc
RUN dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo && \
  dnf install -y \
  bat-0.21.0 \
  git-delta-0.13.0 \
  fd-find-8.2.1 \
  foot-terminfo-1.13.1 \
  fzf-0.39.0 \
  gcc-12.2.1 \
  gcc-c++-12.2.1 \
  gh-2.23.0 \
  google-cloud-sdk-gke-gcloud-auth-plugin \
  helm-3.11.1 \
  jq-1.6 \
  libxcrypt-compat-4.4.33 \
  make-4.3 \
  neovim-0.9.0 \
  nodejs-18.15.0 \
  python3-3.11.2 \
  ripgrep-13.0.0 \
  terraform-1.4.2 \
  wl-clipboard-2.0.0 \
  zsh-5.9 \
  && dnf clean all

RUN python3 -m venv /usr/local/venv && \
  /usr/local/venv/bin/pip install pynvim==0.4.3 

RUN npm install -g tldr@3.3.8

RUN wget -q https://github.com/bazelbuild/bazel-watcher/releases/download/v0.22.0/ibazel_linux_amd64 \
  && mv ibazel_linux_amd64 /usr/local/bin/ibazel \
  &&  chmod +x /usr/local/bin/ibazel
