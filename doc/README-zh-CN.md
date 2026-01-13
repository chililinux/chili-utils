# 🌶️辣椒实用工具

**chili-utils** 是由 Vilmar Catafesta** 创建的 **Linux 工具的集合 - 一组快速、简单且简洁的实用程序，使用 **Bash**、**C**、**Go**、**Harbour** 和 **Python** 制作。

一切都遵循经典的 Unix 哲学：
> _“每个工具只做一件事，而且做得很好。”_

---

## 🧩 概述

|类别 |描述 |示例 |
|------------|------------|----------|
| 🧰 **系统和内核** |系统配置和诊断| `chili-cpuinfo`、`chili-memuse`、`chili-glibc-version`、`chili-systemd-services` |
| 💾 **磁盘和分区** |磁盘管理、测试和恢复| `chili-disk-test-bench`、`chili-parted`、`chili-power-disk`、`chili-e2fsck-wrapper`、`chili-writesector` |
| 🔒 **启动和 EFI** |维护引导加载程序和 EFI 分区 | `chili-manager-efi`、`chili-create-efi-entry`、`chili-grub-fix`、`chili-update-grub-btrfs`、`chili-update-uuid` |
| 🌐 **网络和互联网** |连接、Wi-Fi 和时间同步 | `chili-wifi-config`、`chili-wifi-config-wpa`、`chili-syncdatetime`、`chili-testmirror` |
| 📦 **压实和包装** |包和文件的创建和转换 | `chili-maketar`、`chili-deb2zst`、`chili-recompress-btrfs`、`chili-make-pacman-conf` |
| 🧠 **翻译和自动化** |机器翻译和并行脚本| `chili-translator.sh`、`chili-translator-go`、`chili-translator-parallel` |
| ⚙️ **Chroot 和 Jail 环境** | Montagem 和 chroot 执行安全 | `chili-chroot`、`chili-jailchroot`、`chili-break_chroot`、`chili-runiso` |
| 🧹 **维护和清洁** |清理、更新和初始化包 | `chili-cleaner`、`chili-init-keys`、`chili-update`、`chili-testmirror` |
| 💡 **转换和图形** |图像和格式转换器| `chili-convert-png-to-avif`、`chili-convert-png-to-svg.py`、`chili-convertpng.py`、`chili-convertpng40x40.py` |
| 🪄 **桌面和界面** |主题、字体和显示器调整 | `chili-setfont`、`chili-dialog-theme-selector`、`chili-sysmontask-root`、`chili-xrandr`、`chili-util-selector` |
| 🧱 **旧系统（复古模式）** | MS-DOS、FreeDOS 和 Windows 3.11 的脚本 | `chili-setup-freedos`、`chili-setup-msdos`、`chili-setup-windows311` |
| 🧨 **管理和安全** |进程、权限和用户| `chili-sudo-wayland`、`chili-rename-user`、`chili-killer`、`chili-locale-config` |
| 🧪 **比较器和同步** |目录同步与比较| `chili-compare-dirs`、`chili-compare-dirs-comm`、`chili-compare-dirs-rsync`、`chili-compare-dirs-simple` |

---

## ⚙️亮点

### 🔥 **辣椒马塔尔**
通用压缩器，支持多种算法并通过 GPG 进行加密。

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
