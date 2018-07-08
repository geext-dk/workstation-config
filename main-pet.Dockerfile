FROM fedora 
ENV User geext
# ncurses-compat-libs is for YouCompleteMe (libintl.so)
# everything else is pretty streightforward
ENV Packages "coreutils findutils nc sudo libuser tmux zsh gpg wget rsync passwd sqlite pinentry git \
              neovim python-neovim python3-neovim gcc gcc-c++ make \
              gtk3-devel meson ncurses-compat-libs gstreamer1*devel"
# to get gpg-agent to work it is necessary to create the /run/user/1000 directory
# dnf upgrade fails with installing "setup" package so it is necessary to avoid breaking the sequence of commands
RUN (dnf upgrade -y --allowerasing --best --refresh || true) \
  && dnf install -y --allowerasing --best ${Packages} \
  && useradd -G wheel ${User} \
  && echo "geext:0000" | chpasswd \
  && echo "/bin/zsh" | lchsh geext \
  && mkdir /run/user/1000 \
  && chown 1000:1000 /run/user/1000
USER ${User}
WORKDIR /home/${User}/workdir
# set entrypoint to always launch tmux (it is a pet container so it is intended to be used interactively)
ENTRYPOINT zsh -l -c tmux
