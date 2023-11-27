[**JPN**](https://github.com/SecretShangri-La/blackarch-docker/blob/main/README.jpn.md) |
ENG
## About to images
This image is a Dockerfile designed for penetration test and development. For example, in addition to the hacker's taste for learning shellcode and assembly written in C, it also functions as a pure coding environmen.
Since the mod of [blackarch-config-vim](https://github.com/BlackArch/blackarch-config-vim) is applied to vim, you can code more comfortably by installing [coc](https://github.com/neoclide/coc.nvim) It is also a good idea to code by directly connecting docker to vscode.

Install vim extensions with vim-plug

## What is BlackArch
### excerpt
BlackArch Linux is an Arch Linux-based penetration testing distribution for penetration testers and security researchers. The repository contains more than 2600 tools. You can install tools individually or in groups. BlackArch Linux is compatible with existing Arch installs.

## Why redesign?
Blackarch containers naturally inherit ArchLinux images. Therefore, only en_* type languages **can be used**. This didn't seem to stop in the process of lightweighting ArchLinux containers. Have a look at [this](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59). Therefore, we redesigned it based on the multilingual and easy-to-use Manjaro system. This allows non-latin characters to be typed into the console

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
