[**ENG**](https://github.com/SecretShangri-La/blackarch-docker/blob/main/README.md) |
JPN
## このイメージについて
このイメージは、侵入テストと開発用に設計されたDockerfileです。例えばC言語で記述されたシェルコードとアセンブリの学習といった(俗に言う)ハッカーの嗜みに加えて純粋なコーディング環境としても機能します。
vimには[blackarch-config-vim](https://github.com/BlackArch/blackarch-config-vim)モッドを適用しています。その他[coc](https://github.com/neoclide/coc.nvim)を追加するとより快適にコーディングできます。またdockerを直接vscodeに接続してコーディングするのも良い考えです。

拡張機能はvim-plugでインストールしてください。

## What is BlackArch
Coming Soon

## なぜ再設計したのか？
Blackarch コンテナは当然 ArchLinux イメージを継承します。したがって、en_* タイプの言語**のみ**を使用できます。これは、ArchLinux コンテナーの軽量化の過程で止む終えなかったようです。 詳しくは[こちらをご覧ください](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/59)。そこで、多言語対応で使いやすいManjaroシステムをベースに再設計しました。これにより、非ラテン文字(日本語、中国語、韓国語、ロシア語)をコンソールに入力できます
