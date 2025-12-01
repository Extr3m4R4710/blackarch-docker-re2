## v1.0.3
fastfetch
# colors
darkgrey="$(tput setaf 8)"
white="$(tput setaf 15)"
blue="$(tput setaf 12)"
cyan="$(tput setaf 14)"
red="$(tput setaf 9)"
green="$(tput setaf 35)"
tactical_white="$(tput setaf 247)"
tactical_black="$(tput setaf 238)"
tactical_green="$(tput setaf 58)"
okegreen="$(tput setaf 36)"

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
alias fastfetch_blue="fastfetch --ascii_colors 4 4 0 4 --colors 4 4 4 4 --ascii_distro blackarch"
alias fastfetch="fastfetch --ascii_distro blackarch"

# custom functions
#

hack()
{
  IP=$(curl -s http://ip-api.com/json/ | jq -r .query)
  COUNTRY_CODE=$(curl -s http://ip-api.com/json/ | jq -r .countryCode)

  if [[ $EUID -eq 0 ]]; then
    export PS1="\[$blue\]┌──[\[$darkgrey\]0x0000@\[$okegreen\]\h\[$blue\]]\[$blue\]-[\[$okegreen\]\W\[$blue\]]-[\[$red\]CODE\[$nc\]:\[$okegreen\]$COUNTRY_CODE\[$nc\] \[$red\]EXIT$nc:\[$okegreen\]$IP\[$nc\]\[$blue\]]\n\[$blue\]└──╼\[$okegreen\] \# \[$nc\]"
  else
    export PS1="\[$blue\]┌──[\[$darkgrey\]\u@\[$okegreen\]\h\[$blue\]]\[$blue\]-[\[$okegreen\]\W\[$blue\]]-[\[$red\]CODE\[$nc\]:\[$okegreen\]$COUNTRY_CODE\[$nc\] \[$red\]EXIT$nc:\[$okegreen\]$IP\[$nc\]\[$blue\]]\n\[$blue\]└──╼\[$okegreen\] % \[$nc\]"
  fi
}


tactical()
{
  export PS1="\[$tactical_black\]\W \[$tactical_green\]>\[$tactical_white\]>\[$tactical_green\]> \[$nc\]"
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
