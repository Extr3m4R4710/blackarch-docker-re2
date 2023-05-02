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
Blackarch containers naturally inherit ArchLinux images. Therefore, only en_* type languages can be used. This didn't seem to stop in the process of lightweighting ArchLinux containers. Have a look at [this](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59). Therefore, we redesigned it based on the multilingual and easy-to-use Manjaro system. This allows non-latin characters to be typed into the console
