###########################################################
# Dockerfile for custom Arch Linux
############################################################

FROM yantis/archlinux-tiny
MAINTAINER Jonathan Yantis <yantis@yantis.net>

RUN pacman -Syyu --noconfirm

ENV TERM xterm

    # Allow passwordedless sudo for now but we will remove it later.
RUN pacman --noconfirm -S sudo && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman --noconfirm -S zsh wget file patch diffutils s6 execline htop mlocate expac vim-tiny gzip tar \
            shadow util-linux sed grep iputils

# Add in the s6 stuff since it is small for optional usage.
ADD service /service
ADD init /init
RUN ln -s /bin/true /service/s6-svscan-log/finish

# Install yaourt for easy AUR installs
RUN pacman -S --noconfirm yaourt binutils gcc make autoconf fakeroot

USER docker

# Install procps without systemd.
RUN yaourt -S --noconfirm procps-ng-nosystemd

# Install oh-my-zsh
RUN yaourt -S oh-my-zsh-git --noconfirm && \
    cp /usr/share/oh-my-zsh/zshrc /home/docker/.zshrc

# Setup root enviroment to be zsh
USER root
WORKDIR /
RUN cp /usr/share/oh-my-zsh/zshrc /root/.zshrc && \
    chsh -s /usr/bin/zsh root && \
    chsh -s /usr/bin/zsh docker

RUN pacman --noconfirm -Rs yaourt binutils gcc make autoconf fakeroot

##########################################################################
# CLEAN UP SECTION - THIS GOES AT THE END                                #
##########################################################################
RUN localepurge && \

    # Remove info, man and docs
    rm -r /usr/share/info/* && \
    rm -r /usr/share/man/* && \
    rm -r /usr/share/doc/* && \

    # Delete any backup files like /etc/pacman.d/gnupg/pubring.gpg~
    find /. -name "*~" -type f -delete && \

    # Keep only xterm related profiles in terminfo.
    find /usr/share/terminfo/. ! -name "*xterm*" ! -name "*screen*" ! -name "*screen*" -type f -delete && \

    # Remove anything left in temp.
    rm -r /tmp/*

RUN bash -c "echo 'y' | pacman -Scc >/dev/null 2>&1" && \
    paccache -rk0 >/dev/null 2>&1 &&  \
    pacman-optimize && \
    rm -r /var/lib/pacman/sync/*

#########################################################################

WORKDIR /
CMD /usr/bin/zsh
