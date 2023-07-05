## If you have problems with blackarch's mirror server, please see here
## https://raw.githubusercontent.com/Extr3m4R4710/BlackArchMirrors/master/blackarch-mirrors


FROM manjarolinux/base
ENV TERM=xterm-256color
COPY .vim/ /root/.vim
COPY .vimrc /root/
COPY .bashrc /root/

RUN pacman-mirrors -f3 && pacman -Syy &&\
            pacman -S --noconfirm curl &&\
            curl -sL blackarch.org/strap.sh | bash - ;\
            :> /etc/pacman.d/blackarch-mirrorlist &&\
            echo 'Server = https://download.nus.edu.sg/mirror/blackarch/$repo/os/$arch' >> /etc/pacman.d/blackarch-mirrorlist &&\
            pacman -Syyu --noconfirm &&\
            pacman -S --noconfirm\
 # |Defensive
            tor torsocks proxychains-ng\
 # |Scanner
            nmap masscan zmap sqlmap smbmap nikto\
 # |Recon
            sn0int recon-ng phoneinfoga bind-tools\
 # |exploitation
            metasploit msfdb\
 # |fuzzer
            feroxbuster dirb\
 # |cracker 
            john hashcat hydra &&\
 # Initialization torrc
            rm /etc/tor/torrc && :> /etc/tor/torrc
 # Dev tools
RUN pacman -S --noconfirm base-devel nasm clang ruby lua nodejs npm python python-pip rustup
RUN pacman -S --noconfirm blackarch-config-zsh jq bat exa sqlite p7zip vim zsh bash &&\
              cp -a /usr/share/blackarch/config/zsh/zshrc ~/.zshrc

CMD ["/usr/bin/bash"]
