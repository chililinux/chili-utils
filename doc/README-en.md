# 🌶️ chili-utils

**chili-utils** is a collection of **Linux tools created by Vilmar Catafesta** — a set of fast, straightforward, no-nonsense utilities, made in **Bash**, **C**, **Go**, **Harbour**, and **Python**.

Everything with the classic Unix philosophy:  
> _“Each tool does one thing, and does it well.”_

---

## 🧩 Overview

| Category | Description | Examples |
|------------|------------|----------|
| 🧰 **System and Kernel** | System configuration and diagnostics | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Disks and Partitions** | Disk management, testing, and recovery | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot and EFI** | Maintenance of bootloaders and EFI partitions | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Network and Internet** | Connectivity, Wi-Fi and time synchronization | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compression and Packaging** | Creation and conversion of packages and files | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Translation and Automation** | Automatic translation and parallel scripts | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Chroot and Jail Environments** | Safe mounting and execution of chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Maintenance and Cleaning** | Cleaning, updating, and initializing packages | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversion and Graphics** | Image and format converters | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Desktop and Interface** | Theme, font, and monitor adjustments | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Old systems (retro mode)** | Scripts for MS-DOS, FreeDOS, and Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administration and Security** | Processes, permissions, and users | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparators and Sync** | Directory synchronization and comparison | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Highlights

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Generates the profile of your machine (manufacturer, model, BIOS, chassis, and hardware), without serial, UUID, or MAC, and sends it via issue. With the profiles, `chili-fr` simulates the installation of VoidBR on real machines in QEMU.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Complete documentation: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **chili-stalker**
Universal compressor with support for multiple algorithms and encryption via GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-translator-go**
Translator written in Go with parallel threads and JSON support.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Manages partitions and EFI entries, reinstalls GRUB, and detects multiple operating systems.

### 🧪 **chili-compare-dirs**
Compares and synchronizes directories with different modes (rsync, comm, simple).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Philosophy

> _"To automate is to reduce boredom, not attention."_  
> — Vilmar Catafesta

The chili-utils follow four commandments:

1. Simplicity above all.
2. Zero external dependencies whenever possible.
3. Self-explanatory scripts with clear messages.
4. Full compatibility with POSIX environments.

---

## 🧱 Installation

### 🧩 Option 1 — via PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Option 2 — via Makefile (manual installation)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

To remove:

```bash
sudo make uninstall
```

### 🧩 Option 3 — Install directly from the Chili Linux repository

> **Precompiled package (Arch, Manjaro, and derivatives)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> If the link above fails, access the package directory and get the latest version manually:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 License

Licensed under [Licença MIT](LICENSE).

Copyright (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Author

**Vilmar Catafesta*  
💻 Programmer & SysAdmin  
✉️ vcatafesta@gmail.com

---

## 🌶️ Conclusion

**chili-utils** is the ultimate Swiss army knife for anyone who lives in the terminal —  
an arsenal of pure Unix tools, made to solve, not to adorn.

"> _'There is no magic. Only well-written shell.'_ 🧙‍♂️  
> — vcatafesta
