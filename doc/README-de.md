# 🌶️ Chili-Utilitys

**chili-utils** ist eine Sammlung von **Linux-Tools, die von Vilmar Catafesta** erstellt wurden – eine Reihe schneller, unkomplizierter und schnörkelloser Dienstprogramme, erstellt in **Bash**, **C**, **Go**, **Harbour** und **Python**.

Alles mit der klassischen Unix-Philosophie:
> _„Jedes Werkzeug macht eine Sache, und zwar gut.“_

---

## 🧩 Übersicht

| Kategorie | Beschreibung | Beispiele |
|------------|------------|----------|
| 🧰 **System und Kernel** | Systemkonfiguration und Diagnose | „chili-cpuinfo“, „chili-memuse“, „chili-glibc-version“, „chili-systemd-services“ |
| 💾 **Festplatten und Partitionen** | Datenträgerverwaltung, -tests und -wiederherstellung | „chili-disk-test-bench“, „chili-parted“, „chili-power-disk“, „chili-e2fsck-wrapper“, „chili-writesector“ |
| 🔒 **Boot und EFI** | Bootloader und EFI-Partitionen pflegen | „chili-manager-efi“, „chili-create-efi-entry“, „chili-grub-fix“, „chili-update-grub-btrfs“, „chili-update-uuid“ |
| 🌐 **Netzwerk und Internet** | Konnektivität, WLAN und Zeitsynchronisation | „chili-wifi-config“, „chili-wifi-config-wpa“, „chili-syncdatetime“, „chili-testmirror“ |
| 📦 **Verdichtung und Verpackung** | Erstellung und Konvertierung von Paketen und Dateien | „chili-maketar“, „chili-deb2zst“, „chili-recompress-btrfs“, „chili-make-pacman-conf“ |
| 🧠 **Übersetzung und Automatisierung** | Maschinelle Übersetzung und parallele Skripte | „chili-translator.sh“, „chili-translator-go“, „chili-translator-parallel“ |
| ⚙️ **Ambientes Chroot e Jail** | Installations- und Ausführungssicherheit von Chroots | „chili-chroot“, „chili-jailchroot“, „chili-break_chroot“, „chili-runiso“ |
| 🧹 **Wartung und Reinigung** | Bereinigen, Aktualisieren und Initialisieren von Paketen | „Chili-Cleaner“, „Chili-Init-Keys“, „Chili-Update“, „Chili-Testmirror“ |
| 💡 **Konvertierung und Grafiken** | Bild- und Formatkonverter | „chili-convert-png-to-avif“, „chili-convert-png-to-svg.py“, „chili-convertpng.py“, „chili-convertpng40x40.py“ |
| 🪄 **Desktop und Schnittstelle** | Theme-, Schriftart- und Monitoranpassungen | „chili-setfont“, „chili-dialog-theme-selector“, „chili-sysmontask-root“, „chili-xrandr“, „chili-util-selector“ |
| 🧱 **Alte Systeme (Retro-Modus)** | Skripte für MS-DOS, FreeDOS und Windows 3.11 | „chili-setup-freedos“, „chili-setup-msdos“, „chili-setup-windows311“ |
| 🧨 **Verwaltung und Sicherheit** | Prozesse, Berechtigungen und Benutzer | „chili-sudo-wayland“, „chili-rename-user“, „chili-killer“, „chili-locale-config“ |
| 🧪 **Komparatoren und Synchronisierung** | Verzeichnissynchronisierung und -vergleich | „chili-compare-dirs“, „chili-compare-dirs-comm“, „chili-compare-dirs-rsync“, „chili-compare-dirs-simple“ |

---

## ⚙️ Highlights

### 🔥 **Chili-Maketar**
Universeller Kompressor mit Unterstützung mehrerer Algorithmen und Verschlüsselung per GPG.

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
