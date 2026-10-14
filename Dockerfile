## If you have problems with blackarch's mirror server, please see here
## https://raw.githubusercontent.com/Extr3m4R4710/BlackArchMirrors/master/blackarch-mirrors
FROM archlinux:latest

# 設定と環境変数
# Setting file and env-var
## Setting color
ENV TERM=xterm-256color

## Copy config file
COPY ./config_files/vim/ /root/.vim
COPY ./config_files/vimrc /root/.vimrc
COPY ./config_files/bashrc /root/.bashrc
COPY ./config_files/themes /usr/share/themes
COPY ./config_files/icons /usr/share/icons

#RUN cp -r /etc/skel/. /root/.
RUN rm -f /usr/bin/websockify

## Set blackarch user config and allow ssh root login
RUN echo 'root:blackarch' | chpasswd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# Expose needed ports
EXPOSE 22/tcp
EXPOSE 8080/tcp

# Set operable environment
ENV DISPLAY=:0
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUN { \
#        echo "nameserver 1.1.1.1"; \
#        echo "nameserver 1.0.0.1"; \
#    } > /etc/resolv.conf

# ロケール定義(i18n/locale)の展開を許可
# Allow extracting locale definition files
# archlinuxイメージは/etc/pacman.confのNoExtractでロケール定義を除外しているため、
# 多言語対応にはこの除外ルールを解除する必要がある
RUN sed -i '/^NoExtract/ {/locale\|i18n/d}' /etc/pacman.conf

# パッケージのアップデート
# Update packages
RUN pacman -Syu --noconfirm

# 剥がされたglibcのロケール定義を復元、多言語ロケールを生成
# Restore stripped glibc locale definitions and generate multilingual locales
RUN pacman -S --noconfirm glibc && \
    sed -i 's/^#\(en_US.UTF-8\|ja_JP.UTF-8\|zh_CN.UTF-8\|zh_TW.UTF-8\|ko_KR.UTF-8\|ru_RU.UTF-8\|ar_SA.UTF-8\) /\1 /' /etc/locale.gen && \
    locale-gen && \
    echo 'LANG=en_US.UTF-8' > /etc/locale.conf
ENV LANG=en_US.UTF-8

# BlackArchセットアップとミラー設定
# Setup to BlackArch and BlackArch Mirrors
RUN curl -sL blackarch.org/strap.sh | bash - && pacman -Syyu --noconfirm
#RUN curl -sL https://extr3m4r4710.github.io/0x1248723/blackarch-init | bash - && pacman -Syyu --noconfirm

#RUN { \
#        echo "Server = https://www.blackarch.org/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.halifax.rwth-aachen.de/blackarch/$repo/os/$arch"; \
#        echo "Server = https://www.ftp.ne.jp/Linux/packages/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.kddilabs.jp/Linux/packages/blackarch/$repo/os/$arch"; \
#        echo "Server = https://download.nus.edu.sg/mirror/blackarch/$repo/os/$arch"; \
#        echo "Server = https://mirror.zetup.net/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.linux.org.tr/blackarch/$repo/os/$arch"; \
#        echo "Server = https://mirror.math.princeton.edu/pub/blackarch/$repo/os/$arch"; \
#    } > /etc/pacman.d/blackarch-mirrorlist

# pacman署名チェックの緩和
#RUN sed -i "/^\[blackarch\]/,/^Include/ s/SigLevel.*/SigLevel=Never/" /etc/pacman.conf

# "Levon 'noptrix' Kayan"鍵の信頼と鍵のリロード
# Reload to Noptrix's GPG Key and trust
RUN echo "F9A6E68A711354D84A9B91637533BAFE69A25079:4:" >> /usr/share/pacman/keyrings/blackarch-trusted

# セキュリティ・開発ツール・VNCとデスクトップ
RUN pacman -Syy && \
    pacman -S --noconfirm \
    tor torsocks proxychains-ng \
    nmap masscan zmap sqlmap smbmap nikto \
    sn0int recon-ng phoneinfoga bind-tools \
    metasploit msfdb feroxbuster dirb john \
    hashcat hydra blackarch-officials \
    fastfetch finalrecon whois \
    base-devel nasm clang \
    ruby lua nodejs npm python python-pip rust \
    blackarch-config-zsh jq bat eza sqlite p7zip \
    vim zsh bash fish go \
    openssh git vim tmux screen \
    supervisor iw man mlocate pciutils less bash-completion novnc \
    xorg-server-xvfb x11vnc xfce4 xfce4-goodies xfce4-power-manager \
    blackarch-config-zsh ttf-liberation dbus blackarch-wallpaper

#RUN cp -v /usr/share/blackarch
# 壁紙を適切なファイルに
# Point wallpaper to the right files

# root dir使用明示
WORKDIR /root
# supervisord起動
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf", "--pidfile", "/run/supervisord.pid"]
ENTRYPOINT []
