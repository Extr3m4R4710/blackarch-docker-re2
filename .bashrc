# colors
darkgrey="$(tput setaf 8)"
white="$(tput setaf 15)"
blue="$(tput setaf 12)"
cyan="$(tput setaf 14)"
red="$(tput setaf 8)"
nc="$(tput sgr0)"

# exports
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"

export PS1="\[$blue\]┌[\[$darkgrey\]\u@\[$cyan\]\H\[$blue]\]-[\[$cyan\]$(date +"%Y-%m-%d/%H:%M:%S")\[$blue\]]-[\[$cyan\]\w\[$blue\]]\n\[$blue\]└--\[$blue\]╼\[$cyan\]#>> \[$nc\]"

# alias
alias ls="ls --color"
alias vi="vim"
alias sqlmap="sqlmap --tor"
alias shred="shred -uvzf"
alias nmap="nmap -vvv -Pn --dns-server 1.1.1.1"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*


# custom functions

en()
{
  echo -e "$blue[$cyan*$blue]$ne $cyan EN => JA"
  echo "$1" | trans en:ja -
}

ja()
{
  echo -e "$blue[$cyan*$blue]$ne $cyan JA => EN"
  echo "$1" | trans ja:en -
}
# domain OSINT function that curl-base whois and dig-command like record views 
clwhois()
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


