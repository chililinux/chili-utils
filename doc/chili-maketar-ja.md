# 🌶️チリマケタール

**chili-maketar** は、さまざまなコンプレッサー、暗号化、自動依存関係検出をサポートする `.tar` ファイル (およびその派生ファイル) を作成するように設計された Bash ツールです。

シンプル、高速、効率的で、すべて *古典的な Unix のような * スタイルであり、不要な依存関係はありません。

---

## 📦について

- **著者:** ヴィルマール・カタフェスタ
- **バージョン:** 3.3.3 — _2025/11/13_
- **ライセンス:** BSD 2-Clause
- **説明:** さまざまな方法を使用して、圧縮または暗号化された `.tar` ファイルを作成します。
- **互換性:** Linux (Arch/Manjaro でテスト済み)

---

## ⚙️ 特徴

✅ 複数のコンプレッサーをサポートする圧縮
✅ `gpg` によるオプションの暗号化
✅ プログレッシブカウンター付きの詳細なログ
✅ 依存関係の自動検出とインストール
✅ カラーサポートとサイレントモード
✅ 隠しファイルだけでもバックアップ可能
✅ クリーンで標準化された出力

---

## 🧩 コンプレッサーが利用可能

|オプション |コンプレッサー |生成された拡張子 |スピード |圧縮レベル |注 |
|----------|---------------|----------|---------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 速い | 🟢 大声で |標準 (Zstandard マルチスレッド) |
| `-z` | **豚** `.tar.gz` | ⚡⚡ | 🟡メディア |並列gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中 |従来の gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 大声で | Linux パッケージ標準 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴ベース |超高速 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴ベース |シンプルで軽い |
| `-b` | **ブロトリ** | `.tar.br` | 🐢 | 🟢 大声で | Web に最適 (HTML、JS、CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 大声で |大きなファイルに最適 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣エクストリーム |最大圧縮、ポストプロセス |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 大声で | Zstandard + 暗号化 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 大声で | `gpg2` による暗号化 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 大声で |全体的に高い圧縮率 |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 中 |ユニバーサルフォーマット |

---

## 💻使用例

```bash
# Compacta diretório atual com zstd (padrão)
chili-maketar

# Usa compressão pigz (gzip paralelo)
chili-maketar -z

# Usa lrzip (ótimo pra arquivos grandes)
chili-maketar -r /var/log

# Cria um .tar.zst.gpg criptografado com senha
chili-maketar -p backup

# Compacta usando zpaq (máxima compressão)
chili-maketar -q ~/Documentos

🔒 Compactação + Criptografia (modo -p)

O modo -p cria um arquivo .tar.zst.gpg criptografado via gpg, pedindo senha de proteção:

chili-maketar -p documentos/

Saída esperada:

[➡] Compactando com zstd e criptografando com gpg (modo seguro)
[✓✓✓] Successfully created: documentos-13112025-020320.tar.zst.gpg (28K)

⚙️ Instalação
🔧 Manual

sudo install -m755 chili-maketar /usr/local/bin/

Ou clone o repositório:

git clone https://github.com/vcatafesta/chili-maketar.git
cd chili-maketar
sudo make install

🧱 Pacote (Arch/Manjaro)

Um PKGBUILD pode ser gerado com:

makepkg -si

🧠 Dicas

    Modo silencioso (padrão): saída limpa.

    Use -v para modo verbose.

    Mesmo diretórios com apenas arquivos ocultos são compactados corretamente.

    Todos os logs ficam em /tmp/chili-maketar_<data>_<user>.log.

📜 Licença

Licenciado sob BSD 2-Clause

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
