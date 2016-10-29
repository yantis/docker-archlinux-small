# archlinux-small

On Docker hub [archlinux-small](https://registry.hub.docker.com/u/yantis/archlinux-small/)
on Github [docker-archlinux-small](https://github.com/yantis/docker-archlinux-small)

This small layer adds 27 MB to the 119 MB Arch Linux base container [archlinux-tiny](https://registry.hub.docker.com/u/yantis/archlinux-tiny/)
Still extremely small compared to other Arch Linux containers with some more features and packages above the tiny one.
The goal this was to have a more usable base that just worked without having to install dependencies for normal tasks as well as some normal tools I like working with.
It also has some amazing repos like [BlackArch](https://blackarch.org) and [BBQLinux](http://bbqlinux.org).

Updated: 10/29/2016

### Docker Images Structure
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
* [BlackArch](http://blackarch.org) repo for penetration testers and security professionals.
* [Arch Linux CN](https://github.com/archlinuxcn) repo 
* [Reflector] (https://wiki.archlinux.org/index.php/Reflector) mirror optimized for western USA.
* cower and package-query for interacting with the AUR. 
* compact (removal of a lot of unneeded stuff that pacman will auto re-install if needed)


As an example this is a search for chrome with the above repos installed (Screenshot is from April 2015)
![](http://yantis-scripts.s3.amazonaws.com/screenshot_20150407-030717.jpg)

## Added packages
* diffutils
* execline
* expac
* file
* gcc-libs
* gdbm
* grep
* gzip
* htop
* iputils
* less
* libsystemd
* lz4
* mlocate
* oh-my-zsh-git
* patch
* pcre
* procps-ng-nosystemd
* s6
* sed
* shadow
* sudo
* sysfsutils
* tar
* util-linux
* vim-tiny
* wget
* zsh

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
package-query -Sl blackarch
```

![](http://yantis-scripts.s3.amazonaws.com/screenshot_20150407-023220.jpg)
