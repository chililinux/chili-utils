# 🌶️ 辣椒市场商

**chili-maketar** 是一个用 Bash 制作的工具，用于创建 `.tar`（及其派生文件），支持多种压缩器、加密和依赖关系自动检测。

简单、快速且高效 — 一切都采用*经典类 Unix*风格，无不必要的依赖。

---

## 📦 关于

- **作者：** Vilmar Catafesta  
- **版本:** 3.3.3 — _13/11/2025_  
- **许可证:** MIT  
- **描述:** 使用不同的方法创建压缩或加密的 `.tar` 文件。  
- **兼容性：** Linux（在 Arch/Manjaro 上测试过）

---

## ⚙️ 资源

✅ 支持多压缩器的压缩  
✅ 可选加密通过 `gpg`  
✅ 带进度计数器的详细日志  
✅ 自动检测和安装依赖项  
✅ 支持颜色和静音模式  
✅ 即使只有隐藏文件也进行备份  
✅ 干净且标准化的输出  

---

## 🧩 可用的压缩机

| 选项 | 压缩器 | 生成的扩展名 | 速度 | 压缩等级 | 备注 |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 快速 | 🟢 高 | 标准（多线程 Zstandard） |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 中等 | 并行 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中等 | 传统 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 高 | Linux 包标准 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 低 | 超快 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 低 | 简单且轻量 |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 高 | 适合网页 (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 高 | 对大文件非常好 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 极端 | 最大压缩，后处理 |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 高 | Zstandard + 加密 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 高 | 使用 `gpg2` 的加密 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 高 | 高整体压缩率 |
| `-Z` | **拉链** | `.zip` | ⚡ | 🟡 中等 | 通用格式 |

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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
