FROM fedora:39

RUN dnf install -y neovim openssh-server sudo tmux curl zsh fzf ripgrep fd-find git gcc gcc-c++ make nodejs
RUN command -v zsh | tee -a /etc/shells && \
  cat /etc/shells && useradd -u 1001 dev && \
  chsh -s "$(command -v zsh)" dev && \
  chown -R dev:dev /home/dev
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 20022/' /etc/ssh/sshd_config
EXPOSE 20022
RUN ssh-keygen -q -t ed25519 -N '' -f /id_ed25519

RUN mkdir -p /home/dev/.ssh
ARG authorized_keys
RUN echo "${authorized_keys}" > /home/dev/.ssh/authorized_keys

# https://medium.com/@leicao.me/how-to-ssh-into-a-docker-container-remotely-as-root-or-a-non-root-user-b2105c797273
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER dev
WORKDIR /home/dev
RUN sh -c "$(curl -fsLS get.chezmoi.io)" && \
  ./bin/chezmoi init --apply https://github.com/vohoanglong0107/dotfiles.git && \
  nvim --headless "+Lazy! sync" +qa

USER root

CMD [ "/usr/sbin/sshd", "-D", "-h", "/id_ed25519" ]
