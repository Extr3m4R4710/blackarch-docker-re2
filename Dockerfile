## If you have problems with blackarch's mirror server, please see here
## https://raw.githubusercontent.com/Extr3m4R4710/BlackArchMirrors/master/blackarch-mirrors
# 必ずManjaroを使用
FROM manjarolinux/base

# 設定と環境変数
ENV TERM=xterm-256color
COPY .vim/ /root/.vim
COPY .vimrc /root/
COPY .bashrc /root/

#RUN { \
#        echo "nameserver 1.1.1.1"; \
#        echo "nameserver 1.0.0.1"; \
#    } > /etc/resolv.conf

# パッケージミラーとアップデート
RUN pacman-mirrors -f3 && pacman -Syyu --noconfirm

# BlackArchセットアップとミラー設定
RUN curl -sL blackarch.org/strap.sh | bash - &&\
    pacman -Syyu --noconfirm

#RUN  { \
#        echo "Server = https://us.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://sg.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://jp.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://de.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ca.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://au.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://in.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://kr.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://eu.mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#        echo "Server = https://mirrors.cicku.me/blackarch/$repo/os/$arch"; \
#    } > /etc/pacman.d/blackarch-mirrorlist

#RUN { \
#        echo "Server = https://www.blackarch.org/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.halifax.rwth-aachen.de/blackarch/$repo/os/$arch"; \
#        echo "Server = https://www.ftp.ne.jp/Linux/packages/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.kddilabs.jp/Linux/packages/blackarch/$repo/os/$arch"; \
#        echo "Server = https://download.nus.edu.sg/mirror/blackarch/$repo/os/$arch"; \
#        echo "Server = Server = https://mirror.zetup.net/blackarch/$repo/os/$arch"; \
#        echo "Server = https://ftp.linux.org.tr/blackarch/$repo/os/$arch"; \
#        echo "Server = https://mirror.math.princeton.edu/pub/blackarch/$repo/os/$arch"; \
#    } > /etc/pacman.d/blackarch-mirrorlist

# pacman署名チェックの緩和
#RUN sed -i "/^\[blackarch\]/,/^Include/ s/SigLevel.*/SigLevel=Never/" /etc/pacman.conf

# "Levon 'noptrix' Kayan"鍵の信頼と鍵のリロード
#RUN echo "F9A6E68A711354D84A9B91637533BAFE69A25079:4:" >> /usr/share/pacman/keyrings/blackarch-trusted &&\


# 必要なパッケージインストール
# パッケージインストール
RUN pacman -Syy && \
    pacman -S --noconfirm \
    tor torsocks proxychains-ng \
    nmap masscan zmap sqlmap smbmap nikto \
    sn0int recon-ng phoneinfoga bind-tools \
    metasploit msfdb \
    feroxbuster dirb \
    john hashcat hydra \
    blackarch-officials

# 開発ツールインストール
RUN pacman -S --noconfirm \
    base-devel nasm clang \
    ruby lua nodejs npm python python-pip rust \
    blackarch-config-zsh jq bat eza sqlite p7zip \
    vim zsh bash fish

# デフォルトシェル
CMD ["/usr/bin/bash"]

