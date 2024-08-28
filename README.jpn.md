[**ENG**](https://github.com/SecretShangri-La/blackarch-docker/blob/main/README.md) |
JPN
## このイメージについて
このイメージは、侵入テストと開発用に設計されたDockerfileです。例えばC言語で記述されたシェルコードとアセンブリの学習といった(俗に言う)ハッカーの嗜みに加えて純粋なコーディング環境としても機能します。
vimには[blackarch-config-vim](https://github.com/BlackArch/blackarch-config-vim)モッドを適用しています。その他[coc](https://github.com/neoclide/coc.nvim)を追加するとより快適にコーディングできます。またdockerを直接vscodeに接続してコーディングするのも良い考えです。

拡張機能はvim-plugでインストールしてください。

## What is BlackArch
Coming Soon

## なぜ再設計したのか？
Blackarch コンテナは当然 ArchLinux イメージを継承します。したがって、en_* タイプの言語**のみ**を使用できます。これは、ArchLinux コンテナーの軽量化の過程で止む終えなかったようです。 詳しくは[こちらをご覧ください](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59)。そこで、多言語対応で使いやすいManjaroシステムをベースに再設計しました。これにより、非ラテン文字(日本語、中国語、韓国語、ロシア語、アラビア語)をコンソールに入力できます

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
