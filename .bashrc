## v1.0.3
neofetch --ascii_distro blackarch
# colors
darkgrey="$(tput setaf 8)"
white="$(tput setaf 15)"
blue="$(tput setaf 12)"
cyan="$(tput setaf 14)"
red="$(tput setaf 9)"
green="$(tput setaf 35)"
nc="$(tput sgr0)"

# exports
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:var/lib/snapd/snap/bin:"

if [[ $EUID -eq 0 ]]; then
  export PS1="\[$red\][ \[$darkgrey\]\u@\[$green\]\H \[$darkgrey\]\W\[$darkgrey\] \[$red\]]\[$green\]:\[$darkgrey\]# \[$nc\]"
else
  export PS1="\[$red\][ \[$darkgrey\]\u@\[$green\]\H \[$darkgrey\]\W\[$darkgrey\] \[$red\]]\[$green\]:\[$darkgrey\]% \[$nc\]"
fi

export LD_PRELOAD=""
export EDITOR="vim"

# alias
alias ls="ls --color"
alias vi="vim"
alias sqlmap="sqlmap --tor"
alias shred="shred -uvzf"
alias nmap="nmap -vvv -Pn --dns-server 1.1.1.1"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"
alias neofetch_blue="neofetch --ascii_colors 4 4 0 4 --colors 4 4 4 4 --ascii_distro blackarch"
alias neofetch="neofetch --ascii_distro blackarch"

# custom functions
#

ops-mode()
{
  export PS1="\[$blue\]┌[\[$darkgrey\]\u@\[$cyan\]\H\[$blue]\]-[\[$cyan\]$(date +"%Y-%m-%d/%H:%M:%S")\[$blue\]]-[\[$cyan\]\w\[$blue\]]\n\[$blue\]└-\[$blue\]╼\[$cyan\]#>> \[$nc\]"
}

curlwhois()
{
  curl -sL http://cli.fyi/$1 | jq .
}

remoteshell()
{
  sshpass -p 'segfault' ssh -D 1080 root@segfault.net
}

myip()
{
  curl -sL ip-api.com/json | jq .
}

wiki()
{
  case $1 in
    ja)
      proxychains4 -q w3m ja.wikipedia.org/wiki/$2
    ;;
    en)
      proxychains4 -q w3m en.wikipedia.org/wiki/$2
    ;;
    arch)
      proxychains4 -q w3m wiki.archlinux.org/title/$2
  esac

}

whatime()
{
  date +"%Y-%m-%d %H:%M"
}
