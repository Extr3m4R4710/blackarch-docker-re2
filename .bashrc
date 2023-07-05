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

export PS1="\[$blue\]┌[\[$darkgrey\]\u@\[$cyan\]\H\[$blue]\]-[\[$cyan\]$(date +"%Y-%m-%d/%H:%M:%S")\[$blue\]]-[\[$cyan\]\w\[$blue\]]\n\[$blue\]└--\[$darkgrey\][\[$red\]$?\[$darkgrey\]]\[$blue\]╼\[$cyan\]#>> \[$nc\]"

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

# domain OSINT function that curl-base whois and dig-command like record views 
clwhois()
{
  curl -sL http://cli.fyi/$1 | jq .
}
#joint segfault root server function. no password
remoteshell()
(
  sshpass -p 'segfault' ssh -D 1080 root@segfault.net
)
myip()
{
  curl -sL ip-api.com/json | jq .
}



