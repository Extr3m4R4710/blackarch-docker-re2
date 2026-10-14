JPN | [**ENG**](https://github.com/Extr3m4R4710/blackarch-docker-re2/blob/main/README.md)
## このイメージについて
このイメージは、侵入テストと開発用に設計されたDockerfileです。例えばC言語で記述されたシェルコードとアセンブリの学習といった(俗に言う)ハッカーの嗜みに加えて純粋なコーディング環境としても機能します。

vimには[blackarch-config-vim](https://github.com/BlackArch/blackarch-config-vim)モッドを適用しています。その他[coc](https://github.com/neoclide/coc.nvim)を追加するとより快適にコーディングできます。またdockerを直接vscodeに接続してコーディングするのも良い考えです。

拡張機能はvim-plugでインストールしてください。

# 使用例
```bash
docker build -t blackarch-re2 .
docker run -it --rm blackarch-re2 bash
```

## What is BlackArch
### 抜粋(blackarch.orgより)
BlackArch Linuxは、侵入テストを行うテスターとセキュリティ研究者向けのArch Linuxベースの侵入テストディストリビューションです。リポジトリには2600を超えるツールが含まれています。ツールは個別に、またはグループでインストールでき、BlackArch Linuxは既存のArchのインストールと互換性があります。

## なぜ再設計したのか？
BlackArch LinuxはArchLinuxベースのため、本イメージも上流のArchLinuxイメージをベースにしています。

ただしArchLinuxイメージは軽量化のため、`/etc/pacman.conf`の`NoExtract`でロケール定義(`/usr/share/i18n/locales/*`と`/usr/share/locale/*`)を展開せず、en_* タイプの言語**のみ**を使用できます(詳しくは[こちら](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59))。

そこでDockerfile内でこの除外ルールを解除し、glibcを再インストールして剥がされたロケール定義を復元したうえで、`locale-gen`により多言語ロケールを生成しています。これにより、非ラテン文字(日本語、中国語、韓国語、ロシア語、アラビア語)をコンソールに入力・表示できます

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
#### Exploitation
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

## 使い方

### 前提条件
- DockerとDocker Composeがインストールされていること

### 起動
```bash
# イメージをビルドしてコンテナを起動
docker-compose up -d --build
```

### アクセス方法

**SSH接続:**
```bash
ssh root@localhost -p 2288
# パスワード: blackarch
```

**Webブラウザ経由 (noVNC):**
- URL: `http://localhost:8077`
- パスワード: なし（設定変更可能）

### コンテナ操作
```bash
# 停止
docker-compose stop

# 再起動
docker-compose restart

# 削除
docker-compose down
```

### コンテナ内で作業
```bash
# コンテナに入る
docker exec -it blackarch-docker-re2 /bin/bash
```
