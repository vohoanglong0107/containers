# https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/
FROM ghcr.io/cgwalters/fedora-silverblue:37
# See https://pagure.io/releng/issue/11047 for final location

COPY etc/yum.repos.d /etc/yum.repos.d

# On system with ostree, dracut is patched so no need to rewrite initramfs with dracut -f or plymouth-set-default-theme -R 
COPY usr/share/plymouth /usr/share/plymouth
RUN plymouth-set-default-theme catppuccin-mocha && ostree container commit

# rpm-ostree install or override automatically call grub-mkconfig
COPY usr/share/grub /usr/share/grub

RUN rpm-ostree install \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" \
  && \
  rpm-ostree install \
  abook-0.6.1 \
  bat-0.21.0 \
  btop-1.2.13 \
  fcitx5-5.0.21 \
  fcitx5-anthy-5.0.13 \
  fcitx5-unikey-5.0.12 \
  ffmpeg-5.1.2 \
  fuzzel-1.8.2 \
  fzf-0.35.1 \
  gh-2.23.0 \
  gstreamer1-plugin-libav-1.20.5 \
  gstreamer1-plugins-bad-free-extras-1.20.5 \
  gstreamer1-plugins-bad-freeworld-1.20.5 \
  gstreamer1-plugins-ugly-1.20.5 \
  gstreamer1-vaapi-1.20.5 \
  intel-media-driver-22.5.4 \
  isync-1.4.4 \
  light-1.2.2 \
  mako-1.7.1 \
  neomutt-6:20230407 \
  notmuch-0.37 \
  msmtp-1.8.23 \
  pavucontrol-5.0 \
  sway-1.7 \
  urlscan-0.9.10 \
  waybar-0.9.17 \
  wl-clipboard-2.0.0 \
  wtype-0.4 \
  zsh-5.9 \
  && \
  rpm-ostree cleanup -m && \
  ostree container commit

RUN wget -q \
  https://github.com/catppuccin/cursors/releases/download/v0.2.0/Catppuccin-Mocha-Lavender-Cursors.zip \
  && \
  unzip -qd /usr/share/icons/ Catppuccin-Mocha-Lavender-Cursors.zip && \
  rm Catppuccin-Mocha-Lavender-Cursors.zip && \
  ostree container commit

RUN wget -q \
  https://github.com/catppuccin/gtk/releases/download/v0.4.1/Catppuccin-Mocha-Standard-Lavender-Dark.zip \
  && \
  unzip -qd /usr/share/themes/ Catppuccin-Mocha-Standard-Lavender-Dark.zip && \
  rm Catppuccin-Mocha-Standard-Lavender-Dark.zip && \
  ostree container commit

ENV ZSH=/usr/share/oh-my-zsh

RUN git clone --single-branch --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${ZSH} \
  && \
  git clone --single-branch --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k \ 
  && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH}/custom/plugins/zsh-autosuggestions \ 
  && \
  git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH}/custom/plugins/zsh-syntax-highlighting \
  && \
  ostree container commit

RUN setsebool -P domain_can_mmap_files=true container_manage_cgroup=true && ostree container commit

COPY etc /etc
COPY usr /usr

RUN fc-cache -f && ostree container commit
