# 🌶️ 辣椒市場

**chili-maketar** 是一個用 Bash 製作的工具，用於創建 `.tar`（及其衍生文件），支持多種壓縮器、加密及自動依賴檢測。

簡單、快速且高效——一切都採用*經典類 Unix*風格，沒有不必要的依賴。

---

## 📦 關於

- **作者:** Vilmar Catafesta  
- **版本：** 3.3.3 — _13/11/2025_  
- **許可證:** MIT  
- **描述:** 使用不同的方法創建已壓縮或加密的 `.tar` 文件。  
- **相容性：** Linux（已在 Arch/Manjaro 測試）

---

## ⚙️ 資源

✅ 支援多重壓縮器的壓縮  
✅ 可選的加密方式透過 `gpg`  
✅ 詳細日誌，帶有累計計數器  
✅ 自動偵測與安裝依賴  
✅ 支援顏色與靜音模式  
✅ 即使只有隱藏檔案也備份  
✅ 清潔且標準化的輸出  

---

## 🧩 可用壓縮機

| 選項 | 壓縮器 | 生成的副檔名 | 速度 | 壓縮等級 | 備註 |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 快速 | 🟢 高 | 標準 (多線程 Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 中等 | 平行 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中等 | 傳統 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 高 | Linux 套件標準 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 低 | 極速 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 低 | 簡單且輕量 |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 高 | 適用於網頁 (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 高 | 對大檔案表現優異 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 極端 | 最大壓縮，後處理 |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 高 | Zstandard + 加密 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 高 | 加密與 `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 高 | 高壓縮率
| `-Z` | **壓縮檔** | `.zip` | ⚡ | 🟡 中等 | 通用格式 |

---

## 💻 使用範例

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
