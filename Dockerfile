FROM manjarolinux/base

ENV TERM=xterm-256color

RUN pacman -Syy &&\
            pacman -S --noconfirm curl &&\
            curl -sL blackarch.org/strap.sh | bash - &&\
            pacman -Syyu --noconfirm &&\
            :> /etc/pacman.d/blackarch-mirrorlist &&\
            echo 'Server = https://download.nus.edu.sg/mirror/blackarch/$repo/os/$arch' >> /etc/pacman.d/blackarch-mirrorlist &&\
            pacman -Syu --noconfirm && pacman -S --noconfirm \
 # |Defensive
            tor torsocks proxychains\
 # |Scanner
            nmap masscan zmap sqlmap\
 # |Recon
            sn0int recon-ng phoneinfoga bind-tools\
 # |exploitation
            metasploit msfdb &&\
 # Initialization torrc
            rm /etc/tor/torrc && :> /etc/tor/torrc
RUN pacman -S --noconfirm base-devel nasm clang ruby lua nodejs npm python python-pip rustup
RUN pacman -S --noconfirm blackarch-config-vim blackarch-config-zsh\
              vim zsh nodejs npm &&\
              cp -a /usr/share/blackarch/config/vim/vim ~/.vim &&\
              cp -a /usr/share/blackarch/config/vim/vimrc ~/.vimrc &&\
              cp -a /usr/share/blackarch/config/zsh/zshrc ~/.zshrc

CMD ["/usr/bin/zsh"]
