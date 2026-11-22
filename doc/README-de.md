# 🌶️ Chili-Dienstprogramme

**chili-utils** ist eine Sammlung von **Linux-Tools, die von Vilmar Catafesta erstellt wurden** — eine Sammlung schneller, direkter und unkomplizierter Dienstprogramme, entwickelt in **Bash**, **C**, **Go**, **Harbour** und **Python**.

Alles nach der klassischen Unix-Philosophie:  
> _“Jedes Werkzeug macht eine Sache, und macht sie gut.”_

---

## 🧩 Übersicht

| Kategorie | Beschreibung | Beispiele |
|------------|------------|----------|
| 🧰 **System und Kernel** | Systemkonfiguration und -diagnose | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Festplatten und Partitionen** | Verwaltung, Test und Wiederherstellung von Festplatten | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot und EFI** | Wartung von Bootloadern und EFI-Partitionen | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Netzwerk und Internet** | Konnektivität, WLAN und Zeitsynchronisation | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Komprimierung und Verpackung** | Erstellung und Konvertierung von Paketen und Dateien | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Übersetzung und Automatisierung** | Automatische Übersetzung und parallele Skripte | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Chroot- und Jail-Umgebungen** | Sichere Einrichtung und Ausführung von Chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Wartung und Reinigung** | Reinigung, Aktualisierung und Initialisierung von Paketen | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Konvertierung und Grafiken** | Bild- und Formatkonverter | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Desktop und Oberfläche** | Anpassungen von Themen, Schriftarten und Monitoren | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Alte Systeme (Retro-Modus)** | Skripte für MS-DOS, FreeDOS und Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Verwaltung und Sicherheit** | Prozesse, Berechtigungen und Benutzer | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Vergleicher und Sync** | Synchronisierung und Vergleich von Verzeichnissen | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Highlights

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Erstellt das Profil Ihres Geräts (Hersteller, Modell, BIOS, Gehäuse und Hardware), ohne Seriennummer, UUID oder MAC, und sendet es per Issue. Mit den Profilen simuliert der `chili-fr` die Installation von VoidBR auf realen Maschinen im QEMU.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Vollständige Dokumentation: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **Chili-Maketar**
Universeller Kompressor mit Unterstützung für mehrere Algorithmen und Verschlüsselung über GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-übersetzer-go**
Übersetzer in Go geschrieben mit parallelen Threads und JSON-Unterstützung.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Verwalten von Partitionen und EFI-Einträgen, GRUB neu installieren und mehrere Betriebssysteme erkennen.

### 🧪 **chili-vergleiche-verzeichnisse**
Vergleicht und synchronisiert Verzeichnisse mit verschiedenen Modi (rsync, comm, einfach).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Philosophie

> _„Automatisieren bedeutet, Langeweile zu reduzieren, nicht Aufmerksamkeit.“_  
> — Vilmar Catafesta

Die chili-utils folgen vier Geboten:

1. Einfachheit über alles.
2. Keine externen Abhängigkeiten, wann immer möglich.
3. Selbsterklärende Skripte mit klaren Meldungen.
4. Volle Kompatibilität mit POSIX-Umgebungen.

---

## 🧱 Installation

### 🧩 Option 1 — über PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Option 2 — über Makefile (manuelle Installation)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Zum Entfernen:

```bash
sudo make uninstall
```

### 🧩 Option 3 — Direkt aus dem Chili Linux Repository installieren

> **Vorkompiliertes Paket (Arch, Manjaro und Derivate)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Wenn der obige Link nicht funktioniert, gehen Sie zum Paketverzeichnis und holen Sie sich die neueste Version manuell:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Lizenz

Lizenziert unter [Licença MIT](LICENSE).

Copyright (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Autor

**Vilmar Catafesta*  
💻 Programmierer & Systemadministrator  
✉️ vcatafesta@gmail.com

---

## 🌶️ Fazit

**chili-utils** ist das ultimative Schweizer Taschenmesser für alle, die im Terminal leben —  
ein Arsenal reiner Unix-Werkzeuge, gemacht, um Probleme zu lösen, nicht um zu verschönern.

> _„Es gibt keine Magie. Nur gut geschriebenes Shell.“_ 🧙‍♂️  
> — vcatafesta
