# 🌶️辣椒马塔尔

**chili-maketar** 是一个 Bash 工具，旨在创建“.tar”文件（及其衍生文件），支持各种压缩器、加密和自动依赖性检测。

简单、快速、高效——全部采用*经典的类 Unix* 风格，没有不必要的依赖。

---

## 📦 关于

- **作者：** 维尔玛·卡塔菲斯塔
- **版本：** 3.3.3 — _13/11/2025_
- **许可证：** BSD 2 条款
- **描述：** 使用不同的方法创建压缩或加密的“.tar”文件。
- **兼容性：** Linux（在 Arch/Manjaro 上测试）

---

## ⚙️特点

✅ 支持多个压缩器的压缩
✅ 通过 `gpg` 可选加密
✅ 带有渐进式计数器的详细日志
✅ 自动依赖检测和安装
✅ 颜色支持和静音模式
✅ 即使只有隐藏文件也可以备份
✅ 干净且标准化的输出

---

## 🧩 可用压缩机

|选项 |压缩机|生成的扩展 |速度|压缩级别|注意|
|--------|-------------|------------------|------------------------|------------------------|----------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 快| 🟢 大声 |标准（Z标准多线程）|
| `-z` | **pigz** `.tar.gz` | ⚡⚡ | 🟡 媒体 |并行 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 中等 |传统 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 大声 | Linux 封装标准 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 贝斯 |超快 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 贝斯 |简单轻便|
| `-b` | **布罗特利** | `.tar.br` | 🐢 | 🟢 大声 |非常适合网络（HTML、JS、CSS）|
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 大声 |非常适合大文件 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 极端 |最大压缩，后处理|
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 大声 | Z标准+加密|
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 大声 |使用“gpg2”加密 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 大声 |整体压缩率高|
| `-Z` | **压缩** | `.zip` | ⚡ | 🟡 中等 |通用格式 |

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
