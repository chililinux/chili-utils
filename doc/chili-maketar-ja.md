# 🌶️ チリマケター

**chili-maketar** は、さまざまな圧縮方式、暗号化、および依存関係の自動検出に対応した `.tar`（および派生ファイル）を作成するために作られた Bash ツールです。

シンプルで、迅速かつ効率的 — すべてが*クラシックなUnix系*スタイルで、不要な依存関係はありません。

---

## 📦 について

- **著者:** ヴィルマール・カタフェスタ  
- **バージョン:** 3.3.3 — _2025/11/13_  
- **ライセンス:** MIT  
- **説明:** さまざまな方法を使用して、`.tar` ファイルを圧縮または暗号化して作成します。  
- **互換性:** Linux（Arch/Manjaroでテスト済み）

---

## ⚙️ リソース

✅ 複数の圧縮ツールをサポートする圧縮  
✅ `gpg` 経由の任意の暗号化  
✅ 進行カウンター付きの詳細ログ  
✅ 依存関係の自動検出とインストール  
✅ カラーサポートとサイレントモード  
✅ 隠しファイルだけでもバックアップ  
✅ クリーンで標準化された出力  

---

## 🧩 利用可能なコンプレッサー

| オプション | 圧縮プログラム | 生成された拡張子 | 速度 | 圧縮レベル | 備考 |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 速い | 🟢 高 | 標準 (マルチスレッド Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 中 | 並列 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中 | 従来のgzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 高 | Linuxパッケージの標準 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 低 | 超高速 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 低 | シンプルで軽量 |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 高 | Webに最適（HTML、JS、CSS） |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 高 | 大きなファイルに最適 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 エクストリーム | 最大圧縮、後処理 |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 高 | Zstandard + 暗号化 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 高 | `gpg2`による暗号化 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 高 | 全体的に高い圧縮率 |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 中 | ユニバーサルフォーマット |

---

## 💻 使用例

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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
