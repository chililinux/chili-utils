# 🌶️ chili-maker

**chili-maketar** is a Bash tool made to create `.tar` files (and derivatives) with support for various compressors, encryption, and automatic dependency detection.

Simple, fast, and efficient — all in the classic *Unix-like* style, without unnecessary dependencies.

---

## 📦 About

- **Author:** Vilmar Catafesta  
- **Version:** 3.3.3 — _11/13/2025_  
- **License:** MIT  
- **Description:** Creates `.tar` files compressed or encrypted using different methods.  
- **Compatibility:** Linux (tested on Arch/Manjaro)

---

## ⚙️ Features

✅ Compression with support for multiple compressors  
✅ Optional encryption via `gpg`  
✅ Detailed log with progressive counter  
✅ Automatic detection and installation of dependencies  
✅ Color support and silent mode  
✅ Backup even with only hidden files  
✅ Clean and standardized outputs  

---

## 🧩 Available compressors

| Option | Compressor | Generated Extension | Speed | Compression Level | Note |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Fast | 🟢 High | Standard (Multithreaded Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Medium | parallel gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Medium | traditional gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 High | Linux package standard |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Low | Ultra fast |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Low | Simple and light |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 High | Ideal for web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 High | Excellent for large files |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extreme | Maximum compression, post-processing |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 High | Zstandard + encryption |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 High | Encryption with `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 High | High overall compression |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Medium | Universal format |

---

## 💻 Example of use

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
