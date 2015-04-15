# archlinux-small

On Docker hub [archlinux-small](https://registry.hub.docker.com/u/yantis/archlinux-small/)
on Github [docker-archlinux-small](https://github.com/yantis/docker-archlinux-small)

This small layer adds 30MB to the 97MB Arch Linux base container [archlinux-tiny](https://registry.hub.docker.com/u/yantis/archlinux-tiny/)
Still extremely small compared to other Arch Linux containers with some more features and packages above the tiny one.
The goal this was to have a more usable base that just worked without having to install dependencies for normal tasks as well as some normal tools I like working with.
It also has some amazing repos like [ArchAssault](https://www.archassault.org),
[BlackArch](http://blackarch.org) and [BBQLinux](http://bbqlinux.org).

## Docker Images Structure
>[yantis/archlinux-tiny](https://github.com/yantis/docker-archlinux-tiny)
>>[yantis/archlinux-small](https://github.com/yantis/docker-archlinux-small)
>>>[yantis/archlinux-small-ssh-hpn](https://github.com/yantis/docker-archlinux-ssh-hpn)
>>>>[yantis/ssh-hpn-x](https://github.com/yantis/docker-ssh-hpn-x)
>>>>>[yantis/dynamic-video](https://github.com/yantis/docker-dynamic-video)
>>>>>>[yantis/virtualgl](https://github.com/yantis/docker-virtualgl)
>>>>>>>[yantis/wine](https://github.com/yantis/docker-wine)

## Added Features
* Lots of linux utlities that were not included in the tiny version. See list below.
* util-linux & iputils
* user:docker password:docker with password-less sudo.
* locate/updatedb (mlocate)
* [S6 supervisor] (http://skarnet.org/software/s6/) - ([Les Aker's code](https://github.com/amylum/s6))
* [execline] (http://skarnet.org/software/execline/)
* [zsh](http://www.zsh.org/) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) setup for both root and docker users.
* [htop](http://hisham.hm/htop/)
* vim ([vim-tiny](http://askubuntu.com/questions/104138/what-features-does-vim-tiny-have))

## Features (from [archlinux-tiny](https://registry.hub.docker.com/u/yantis/archlinux-tiny/))
* Arch Linux 64 bit core, extra, community repos
* Arch Linux 32 bit multilib repo
* [BBQLinux](http://bbqlinux.org) repo for Android Developers.
* [ArchAssault](https://www.archassault.org) repo for penetration testers and security professionals.
* [BlackArch](http://blackarch.org) repo for penetration testers and security professionals.
* [Arch Linux CN](https://github.com/archlinuxcn) repo 
* [Reflector] (https://wiki.archlinux.org/index.php/Reflector) mirror optimized for western USA.
* cower and package-query for interacting with the AUR. 
* compact (removal of a lot of unneeded stuff that pacman will auto re-install if needed)


As an example this is a search for chrome with the above repos installed:
![](http://yantis-scripts.s3.amazonaws.com/screenshot_20150407-030717.jpg)

## Added packages
* diffutils 3.3-2
* execline 2.1.1.0_15-1
* expac 4-3
* file 5.22-1
* gcc-libs 4.9.2-4
* gdbm 1.11-1
* glib2 2.42.2-1
* grep 2.21-2
* gzip 1.6-1
* htop 1.0.3-2
* iputils 20121221-3
* less 471-1
* libsystemd 218-2
* lz4 128-1
* mlocate 0.26-5
* oh-my-zsh-git 3110.75b9030-1
* patch 2.7.5-1
* pcre 8.36-2
* procps-ng-nosystemd 3.3.10-1
* s6 2.1.3.0_22-1
* sed 4.2.2-3
* shadow 4.2.1-3
* sudo 1.8.13-1
* sysfsutils 2.1.0-9
* tar 1.28-1
* util-linux 2.26.1-3
* vim-tiny 7.4.691-1
* wget 1.16.3-1
* zsh 5.0.7-1

## Included from [archlinux-tiny](https://registry.hub.docker.com/u/yantis/archlinux-tiny/)
* acl 2.2.52-2
* archassault-keyring 20140202-3
* archassault-mirrorlist 20150214-1
* archlinux-keyring 20150212-1
* archlinuxcn-keyring 20141118-1
* attr 2.4.47-1
* bash 4.3.033-1
* bbqlinux-keyring 20131129-1
* blackarch-keyring 20140118-3
* bzip2 1.0.6-5
* ca-certificates 20140923-9
* ca-certificates-cacert 20140824-2
* ca-certificates-mozilla 3.18-3
* ca-certificates-utils 20140923-9
* coreutils 8.23-1
* cower 12-2
* cracklib 2.9.1-1
* curl 7.41.0-1
* e2fsprogs 1.42.12-2
* expat 2.1.0-4
* filesystem 2015.02-1
* findutils 4.4.2-6
* gawk 4.1.1-1
* gcc-libs 4.9.2-4
* glibc 2.21-2
* gmp 6.0.0-2
* gnupg 2.1.2-3
* gnutls 3.3.14-2
* gpgme 1.5.3-1
* iana-etc 2.30-4
* keyutils 1.5.9-1
* krb5 1.13.1-1
* libarchive 3.1.2-8
* libassuan 2.1.3-1
* libcap 2.24-2
* libffi 3.2.1-1
* libgcrypt 1.6.3-2
* libgpg-error 1.18-1
* libidn 1.30-1
* libksba 1.3.2-1
* libldap 2.4.40-2
* libsasl 2.1.26-7
* libssh2 1.4.3-2
* libtasn1 4.4-1
* libtirpc 0.2.5-1
* libutil-linux 2.26.1-3
* licenses 20140629-1
* linux-api-headers 3.18.5-1
* localepurge 0.7.3.4-1
* lzo 2.09-1
* mpfr 3.1.2.p11-1
* ncurses 5.9-7
* nettle 2.7.1-1
* npth 1.1-1
* openssl 1.0.2.a-1
* p11-kit 0.23.1-2
* package-query 1.5-2
* pacman 4.2.1-1
* pacman-mirrorlist 20150315-1
* pam 1.1.8-5
* pambase 20130928-1
* pinentry 0.9.0-1
* pth 2.0.7-5
* readline 6.3.006-1
* texinfo-fake 1.2-1
* tzdata 2015b-1
* xz 5.2.1-1
* yajl 2.1.0-1
* zlib 1.2.8-3

## How did you get it so small.
The biggest win was the removal of Perl at 40MB. Perl is needed for two things on the base Arch Linux install
OpenSSL (it shouldn't be honestly since it isn't really used other than for one small thing on Windows)
Some other distros have already fixed this [issue] (https://github.com/NixOS/nixpkgs/issues/6763) like NixOS 
Also, see this [thread](https://bbs.archlinux.org/viewtopic.php?id=73200) and [this](https://bugs.archlinux.org/task/14903).
And for [texinfo](http://www.gnu.org/software/texinfo) (8 MB) which we patched out with a fake stub.

As well as a lot of aggressively cleaning of info, doc and man pages as well as stripping out the non English international stuff.

## Caveats
This is slimmed down as much as possible while still having full pacman functionality to install any package needed.

Where it might break is all but the English locales have been removed, as well as any terminfo configs that are not xterm based.
Do not expect any info, documents or manual pages to exist locally either as those have been purged as well.

I am currently experimenting with the removal of zoneinfo and i18n and no problems so far.

Anything you install with pacman should just install fine but if you want to install something from the AUR you are going to need
to install dev tools first like make, gcc, autoconf etc.


## Miscellaneous

To save on space the pacman databases are purged. You need run pacman -Sy at least once before using pacman.

```bash
RUN pacman -Sy
```

If you are building a package from the AUR you will want to install and uninstall the dev tools like this.

```bash
RUN sudo pacman -S --noconfirm yaourt binutils gcc make autoconf fakeroot && \
    yaourt -S --noconfirm procps-ng-nosystemd && \
    pacman --noconfirm -Rs yaourt binutils gcc make autoconf fakeroot
```

This image has a user docker with the password docker. You will most likely want to change the password. Just add this line to your Dockerfile.

```bash
RUN echo -e "docker\nyournewpassword" | passwd docker
```

The mirrors are optimized for US West  If you want it for your area just add this to the top of your Dockerfile.

```bash
RUN pacman -S reflector --noconfirm && \
    reflector --verbose -l 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && \
    pacman -Rs reflector --noconfirm
```

The different repositories have a lot of really nice packages. To get a list just run package-query like this.

```bash
package-query -Sl archassault
```

![](http://yantis-scripts.s3.amazonaws.com/screenshot_20150407-023220.jpg)
