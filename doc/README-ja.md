# 🌶️チリユーティリティ

**chili-utils** は、Vilmar Catafesta** によって作成された **Linux ツールのコレクションです。これは、**Bash**、**C**、**Go**、**Harbour**、および **Python** で作成された、高速かつ簡単で余分な機能のないユーティリティのセットです。

すべては古典的な Unix 哲学に基づいています。
> _「各ツールは 1 つのことを実行し、それを適切に実行します。」_

---

## 🧩 概要

|カテゴリー |説明 |例 |
|-----------|---------------|----------|
| 🧰 **システムとカーネル** |システム構成と診断 | `chili-cpuinfo`、`chili-memuse`、`chili-glibc-version`、`chili-systemd-services` |
| 💾 **ディスクとパーティション** |ディスク管理、テスト、リカバリ | `chili-disk-test-bench`、`chili-parted`、`chili-power-disk`、`chili-e2fsck-wrapper`、`chili-writesector` |
| 🔒 **ブートと EFI** |ブートローダーと EFI パーティションのメンテナンス | `chili-manager-efi`、`chili-create-efi-entry`、`chili-grub-fix`、`chili-update-grub-btrfs`、`chili-update-uuid` |
| 🌐 **ネットワークとインターネット** |接続、Wi-Fi、時刻同期 | `chili-wifi-config`、`chili-wifi-config-wpa`、`chili-syncdatetime`、`chili-testmirror` |
| 📦 **圧縮と梱包** |パッケージとファイルの作成と変換 | `chili-maketar`、`chili-deb2zst`、`chili-recompress-btrfs`、`chili-make-pacman-conf` |
| 🧠 **翻訳と自動化** |機械翻訳と並列スクリプト | `chili-translator.sh`、`chili-translator-go`、`chili-translator-Parallel` |
| ⚙️ **アンビエンテス クロートと刑務所** |モンタージュとchrootsの実行 | `chili-chroot`、`chili-jailchroot`、`chili-break_chroot`、`chili-runiso` |
| 🧹 **メンテナンスとクリーニング** |パッケージのクリーニング、更新、初期化 | `chili-cleaner`、`chili-init-keys`、`chili-update`、`chili-testmirror` |
| 💡 **変換とグラフィックス** |画像およびフォーマットコンバータ | `chili-convert-png-to-avif`、`chili-convert-png-to-svg.py`、`chili-convertpng.py`、`chili-convertpng40x40.py` |
| 🪄 **デスクトップとインターフェイス** |テーマ、フォント、モニターの調整 | `chili-setfont`、`chili-dialog-theme-selector`、`chili-sysmontask-root`、`chili-xrandr`、`chili-util-selector` |
| 🧱 **古いシステム (レトロ モード)** | MS-DOS、FreeDOS、Windows 3.11 用のスクリプト | `chili-setup-freedos`、`chili-setup-msdos`、`chili-setup-windows311` |
| 🧨 **管理とセキュリティ** |プロセス、権限、ユーザー | `chili-sudo-wayland`、`chili-rename-user`、`chili-killer`、`chili-locale-config` |
| 🧪 **コンパレータと同期** |ディレクトリの同期と比較 | `chili-compare-dirs`、`chili-compare-dirs-comm`、`chili-compare-dirs-rsync`、`chili-compare-dirs-simple` |

---

## ⚙️ハイライト

### 🔥 **チリマケタール**
複数のアルゴリズムと GPG による暗号化をサポートするユニバーサル コンプレッサー。

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa

🧠 chili-tradutor-go

Tradutor escrito em Go com threads paralelos e suporte a JSON.

chili-tradutor-go texto_entrada.json

🔒 chili-manager-efi

Gerencia partições e entradas EFI, reinstala GRUB e detecta múltiplos sistemas operacionais.
🧪 chili-compare-dirs

Compara e sincroniza diretórios com diferentes modos (rsync, comm, simples).

chili-compare-dirs /mnt/diskA /mnt/diskB

🧠 Filosofia

    “Automatizar é reduzir o tédio, não a atenção.”
    — Vilmar Catafesta

Os chili-utils seguem quatro mandamentos:

    Simplicidade acima de tudo.

    Zero dependências externas sempre que possível.

    Scripts autoexplicativos e com mensagens claras.

    Compatibilidade total com ambientes POSIX.

🧱 Instalação
🧩 Opção 1 — via PKGBUILD (Arch / Manjaro)

git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si

🧩 Opção 2 — via Makefile (instalação manual)

git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install

Para remover:

sudo make uninstall

### 🧩 Opção 3 — Instalar diretamente do repositório Chili Linux

> **Pacote pré-compilado (Arch, Manjaro e derivados)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Se o link acima falhar, acesse o diretório de pacotes e pegue a versão mais recente manualmente:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

📜 Licença

Licenciado sob BSD 2-Clause License

Copyright (c) 2019-2025
Vilmar Catafesta <vcatafesta@gmail.com>
All rights reserved.

🧩 Autor

Vilmar Catafesta
💻 Programador & SysAdmin
✉️ vcatafesta@gmail.com
🌶️ Conclusão

chili-utils é o canivete suíço definitivo pra quem vive no terminal —
um arsenal de ferramentas Unix puras, feitas pra resolver, não pra enfeitar.

    “Não existe mágica. Só shell bem escrito.” 🧙‍♂️
    — vcatafesta


---
