[**JPN**](https://github.com/Extr3m4R4710/blackarch-docker-re2/blob/main/README.jpn.md) | ENG
## About This Image

This is a Dockerfile designed for penetration testing and development. It functions both as an environment for (colloquially speaking) hacker-style learning, such as studying shell code and assembly in C language, and as a pure coding environment.

The vim editor has the [blackarch-config-vim](https://github.com/BlackArch/blackarch-config-vim)モ mod applied. Adding [coc](https://github.com/neoclide/coc.nvim) can make coding even more comfortable. It's also a good idea to directly connect Docker to VSCode for coding.

Please install extensions using vim-plug.

## What is BlackArch
### Excerpt (from blackarch.org)

BlackArch Linux is an Arch Linux-based penetration testing distribution for testers and security researchers. The repository contains over 2,600 tools. Tools can be installed individually or in groups, and BlackArch Linux is compatible with existing Arch installations.

## Why Was It Redesigned?

The BlackArch container inherits the ArchLinux image. As a result, it could only use en_* type languages. This seemed to be unavoidable during the process of streamlining the ArchLinux container. For more details, please [see](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59) here. Therefore, it was redesigned based on the Manjaro system, which is more multi-language friendly. This allows input of non-Latin characters (Japanese, Chinese, Korean, Russian, Arabic) in the console.

## Tools & Package
#### Defensive
```
tor                                 : Anonymizing overlay network
torsocks                            : Wrapper to safely torify applications
proxychains-ng                      : A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies
```
#### Scanner
```
masscan                             : TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes
nmap                                : Utility for network discovery and security auditing
sqlmap                              : Automatic SQL injection and database takeover tool
zmap                                : Fast network scanner designed for Internet-wide network surveys
```
#### exploitation
```
metasploit                          : Advanced open-source platform for developing, testing, and using exploit code
msfdb                               : Manage the metasploit framework database. This package known as msfdb-blackarch
```
#### Recon
```
bind-tools                          : A complete, highly portable implementation of the DNS protocol
phoneinfoga                         : Information gathering & OSINT framework for phone numbers.
recon-ng                            : A full-featured Web Reconnaissance framework written in Python
sn0int                              : Semi-automatic OSINT framework and package manager
```

#### Devtools
##### vim is applied custom blackarch-config-vim mod by default
```
base-devel(into gcc and make etc...): Basic tools to build Arch Linux packages
nasm                                : 80x86 assembler designed for portability and modularity
clang                               : C language family frontend for LLVM
ruby                                : An object-oriented language for quick and easy programming
lua                                 : Powerful lightweight programming language designed for extending applications
nodejs                              : Evented I/O for V8 javascript
npm                                 : A package manager for javascript
python                              : Next generation of the python high-level scripting language
python-pip                          : The PyPA recommended tool for installing Python packages
rustup                              : The Rust toolchain installer
vim                                 : Vi Improved, a highly configurable, improved version of the vi text editor
```
