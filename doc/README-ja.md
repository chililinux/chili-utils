# 🌶️ チリユーティリティ

**chili-utils**は、**Vilmar Catafestaによって作成されたLinuxツールのコレクション**です — **Bash**、**C**、**Go**、**Harbour**、**Python**で作られた、迅速で直接的かつ無駄のないユーティリティのセットです。

すべては Unix の古典的な哲学に従います:  
＞ _「それぞれの道具は一つのことをする、それをうまくやる。」_

---

## 🧩 概要

| カテゴリ | 説明 | 例 |
|------------|------------|----------|
| 🧰 **システムとカーネル** | システムの設定と診断 | `chili-cpuinfo`、`chili-memuse`、`chili-glibc-version`、`chili-systemd-services` |
| 💾 **ディスクとパーティション** | ディスクの管理、テスト、回復 | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **ブートとEFI** | ブートローダーとEFIパーティションの保守 | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **ネットワークとインターネット** | 接続性、Wi-Fi、時間の同期 | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **圧縮とパッケージング** | パッケージとファイルの作成および変換 | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **翻訳と自動化** | 自動翻訳と並列スクリプト | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **ChrootおよびJail環境** | Chrootの安全なマウントと実行 | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **メンテナンスと清掃** | パッケージの清掃、更新、および初期化 | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **変換とグラフ** | 画像とフォーマットのコンバーター | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **デスクトップとインターフェース** | テーマ、フォント、モニターの調整 | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **古いシステム（レトロモード）** | MS-DOS、FreeDOS、Windows 3.11 用スクリプト | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **管理とセキュリティ** | プロセス、権限、ユーザー | `chili-sudo-wayland`、`chili-rename-user`、`chili-killer`、`chili-locale-config` |
| 🧪 **比較ツールと同期** | ディレクトリの同期と比較 | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ ハイライト

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
マシンのプロファイル（メーカー、モデル、BIOS、シャーシ、ハードウェア）をシリアル、UUID、MACなしで生成し、issueで送信します。プロファイルを使用して、`chili-fr`はQEMUで実際のマシンにVoidBRをインストールするシミュレーションを行います。

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 完全なドキュメント: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **チリマーケット**
複数のアルゴリズムに対応し、GPGによる暗号化も可能なユニバーサル圧縮機。

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **チリ-トラドゥトール-ゴ**
並列スレッドとJSONサポートを備えたGoで書かれた翻訳者。

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **チリマネージャーEFI**
パーティションとEFIエントリを管理し、GRUBを再インストールし、複数のオペレーティングシステムを検出します。

### 🧪 **chili-compare-dirs**
異なるモード（rsync、comm、シンプル）でディレクトリを比較および同期します。

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 哲学

> _「自動化とは、注意力を減らすことではなく、退屈を減らすことだ。」_  
> — ヴィルマール・カタフェスタ

チリユーティリティは四つの戒めに従う:

1. 何よりもシンプルさ。
2. 可能な限り外部依存ゼロ。
3. 自己説明的で明確なメッセージを持つスクリプト。
4. POSIX環境との完全な互換性。

---

## 🧱 設置

### 🧩 オプション1 — PKGBUILD経由（Arch / Manjaro）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 オプション2 — Makefile経由（手動インストール）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

削除するには:

```bash
sudo make uninstall
```

### 🧩 オプション3 — Chili Linuxのリポジトリから直接インストール

> **事前コンパイル済みパッケージ（Arch、Manjaroおよび派生）**  
>  
> チリ_REF_0_チリ  
>  
> 上記のリンクが機能しない場合は、パッケージのディレクトリにアクセスして、最新バージョンを手動で取得してください:  
> 👉 チリ_REF_0_チリ

---

## 📜 ライセンス

[Licença MIT](LICENSE)の下でライセンスされています。

著作権 (c) 2019-2025  
ヴィルマール・カタフェスタ <vcatafesta@gmail.com>

---

## 🧩 著者

**ヴィルマル・カタフェスタ*  
💻 プログラマー＆シスアドミン  
✉️ vcatafesta@gmail.com

---

## 🌶️ 結論

**chili-utils**は、ターミナルを使う人のための究極のスイスアーミーナイフです—  
飾るためではなく、解決するために作られた、純粋なUnixツールのアーセナル。

> _「魔法なんて存在しない。ただよく書かれたシェルがあるだけだ。」_ 🧙‍♂️  
> — vcatafesta
