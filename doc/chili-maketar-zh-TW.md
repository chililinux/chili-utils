# 🌶️辣椒馬塔爾

**chili-maketar** 是一個 Bash 工具，旨在創建“.tar”文件（及其衍生文件），支持各種壓縮器、加密和自動依賴性檢測。

簡單、快速、高效——全部採用*經典的類 Unix* 風格，沒有不必要的依賴。

---

## 📦 關於

- **作者：** 維爾瑪·卡塔菲斯塔
- **版本：** 3.3.3 — _13/11/2025_
- **許可證：** BSD 2 條款
- **描述：** 使用不同的方法創建壓縮或加密的“.tar”文件。
- **兼容性：** Linux（在 Arch/Manjaro 上測試）

---

## ⚙️特點

✅ 支持多個壓縮器的壓縮
✅ 通過 `gpg` 可選加密
✅ 帶有漸進式計數器的詳細日誌
✅ 自動依賴檢測和安裝
✅ 顏色支持和靜音模式
✅ 即使只有隱藏文件也可以備份
✅ 乾淨且標準化的輸出

---

## 🧩 可用壓縮機

|選項 |壓縮機|生成的擴展 |速度|壓縮級別|注意|
|--------|-------------|------------------|------------------------|------------------------|----------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 快| 🟢 大聲 |標準（Z標準多線程）|
| `-z` | **pigz** `.tar.gz` | ⚡⚡ | 🟡 媒體 |並行 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中等 |傳統 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 大聲 | Linux 封裝標準 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 貝斯 |超快 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 貝斯 |簡單輕便|
| `-b` | **布羅特利** | `.tar.br` | 🐢 | 🟢 大聲 |非常適合網絡（HTML、JS、CSS）|
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 大聲 |非常適合大文件 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 極端 |最大壓縮，後處理|
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 大聲 | Z標準+加密|
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 大聲 |使用“gpg2”加密 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 大聲 |整體壓縮率高|
| `-Z` | **壓縮** | `.zip` | ⚡ | 🟡 中等 |通用格式 |

---

## 💻 使用示例

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
