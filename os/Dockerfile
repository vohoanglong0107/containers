# https://github.com/fedora-silverblue/issue-tracker/issues/359
# https://github.com/fedora-silverblue/issue-tracker/issues/334#issuecomment-1315737913
FROM quay.io/fedora/fedora-silverblue:40

# On system with ostree, dracut is patched so no need to rewrite initramfs with dracut -f or plymouth-set-default-theme -R 
COPY usr/share/plymouth /usr/share/plymouth
RUN plymouth-set-default-theme catppuccin-mocha && ostree container commit

# rpm-ostree install or override automatically call grub-mkconfig
COPY usr/share/grub /usr/share/grub

COPY packages.txt packages.sh ./
RUN ./packages.sh && \
  rm packages.txt packages.sh && \
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

COPY installers/  ./installers/
RUN ./installers/installers.sh && rm -rf ./installers && ostree container commit
