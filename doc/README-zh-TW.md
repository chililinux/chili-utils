# 🌶️辣椒實用工具

**chili-utils** 是由 Vilmar Catafesta** 創建的 **Linux 工具的集合 - 一組快速、簡單且簡潔的實用程序，使用 **Bash**、**C**、**Go**、**Harbour** 和 **Python** 製作。

一切都遵循經典的 Unix 哲學：
> _“每個工具只做一件事，而且做得很好。”_

---

## 🧩 概述

|類別 |描述 |示例 |
|------------|------------|----------|
| 🧰 **系統和內核** |系統配置和診斷| `chili-cpuinfo`、`chili-memuse`、`chili-glibc-version`、`chili-systemd-services` |
| 💾 **磁盤和分區** |磁盤管理、測試和恢復| `chili-disk-test-bench`、`chili-parted`、`chili-power-disk`、`chili-e2fsck-wrapper`、`chili-writesector` |
| 🔒 **啟動和 EFI** |維護引導加載程序和 EFI 分區 | `chili-manager-efi`、`chili-create-efi-entry`、`chili-grub-fix`、`chili-update-grub-btrfs`、`chili-update-uuid` |
| 🌐 **網絡和互聯網** |連接、Wi-Fi 和時間同步 | `chili-wifi-config`、`chili-wifi-config-wpa`、`chili-syncdatetime`、`chili-testmirror` |
| 📦 **壓實和包裝** |包和文件的創建和轉換 | `chili-maketar`、`chili-deb2zst`、`chili-recompress-btrfs`、`chili-make-pacman-conf` |
| 🧠 **翻譯和自動化** |機器翻譯和並行腳本| `chili-translator.sh`、`chili-translator-go`、`chili-translator-parallel` |
| ⚙️ **Chroot 和 Jail 環境** | Montagem 和 chroot 執行安全 | `chili-chroot`、`chili-jailchroot`、`chili-break_chroot`、`chili-runiso` |
| 🧹 **維護和清潔** |清理、更新和初始化包 | `chili-cleaner`、`chili-init-keys`、`chili-update`、`chili-testmirror` |
| 💡 **轉換和圖形** |圖像和格式轉換器| `chili-convert-png-to-avif`、`chili-convert-png-to-svg.py`、`chili-convertpng.py`、`chili-convertpng40x40.py` |
| 🪄 **桌面和界面** |主題、字體和顯示器調整 | `chili-setfont`、`chili-dialog-theme-selector`、`chili-sysmontask-root`、`chili-xrandr`、`chili-util-selector` |
| 🧱 **舊系統（復古模式）** | MS-DOS、FreeDOS 和 Windows 3.11 的腳本 | `chili-setup-freedos`、`chili-setup-msdos`、`chili-setup-windows311` |
| 🧨 **管理和安全** |進程、權限和用戶| `chili-sudo-wayland`、`chili-rename-user`、`chili-killer`、`chili-locale-config` |
| 🧪 **比較器和同步** |目錄同步與比較| `chili-compare-dirs`、`chili-compare-dirs-comm`、`chili-compare-dirs-rsync`、`chili-compare-dirs-simple` |

---

## ⚙️亮點

### 🔥 **辣椒馬塔爾**
通用壓縮器，支持多種算法並通過 GPG 進行加密。

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
