# https://github.com/fedora-silverblue/issue-tracker/issues/359
# https://github.com/fedora-silverblue/issue-tracker/issues/334#issuecomment-1315737913
FROM quay.io/fedora-ostree-desktops/silverblue:38

# On system with ostree, dracut is patched so no need to rewrite initramfs with dracut -f or plymouth-set-default-theme -R 
COPY usr/share/plymouth /usr/share/plymouth
RUN plymouth-set-default-theme catppuccin-mocha && ostree container commit

# rpm-ostree install or override automatically call grub-mkconfig
COPY usr/share/grub /usr/share/grub

RUN rpm-ostree install \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" \
  && \
  # https://discussion.fedoraproject.org/t/unable-to-install-ffmpeg-libs-on-fedora-38-silverblue-beta/79632/7
  rpm-ostree override remove libavcodec-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free --install ffmpeg-6.0 \
  && \
  rpm-ostree install \
  abook-0.6.1 \
  bat-0.21.0 \
  btop-1.2.13 \
  fcitx5-5.0.23 \
  fcitx5-anthy-5.0.14 \
  fcitx5-unikey-5.0.13 \
  ffmpeg-6.0 \
  fuzzel-1.9.1 \
  fzf-0.40.0 \
  gh-2.28.0 \
  gstreamer1-plugins-bad-free-extras-1.22.5 \
  gstreamer1-plugins-bad-freeworld-1.22.3 \
  gstreamer1-plugins-ugly-1.22.3 \
  gstreamer1-vaapi-1.22.5 \
  imv-4.4.0 \
  intel-media-driver-23.1.6 \
  isync-1.4.4 \
  light-1.2.2 \
  mako-1.7.1 \
  neomutt-20230407 \
  notmuch-0.37 \
  msmtp-1.8.23 \
  pavucontrol-5.0 \
  podman-compose-1.0.6 \
  pulseaudio-utils-16.1 \
  sway-1.8.1 \
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

RUN setsebool -P domain_can_mmap_files=true container_manage_cgroup=true && ostree container commit

COPY etc /etc
COPY usr /usr

RUN wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraMono.zip \
  && unzip FiraMono.zip -d /usr/share/fonts/fira-mono-nerd-fonts/ \
  && fc-cache -f && ostree container commit

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
