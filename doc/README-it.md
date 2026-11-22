# 🌶️ utilità-peperoncino

**chili-utils** è una collezione di **strumenti Linux creati da Vilmar Catafesta** — un insieme di utilità rapide, dirette e senza fronzoli, realizzate in **Bash**, **C**, **Go**, **Harbour** e **Python**.

Tutto con la filosofia classica di Unix:  
> _“Ogni strumento fa una cosa, e la fa bene.”_

---

## 🧩 Panoramica

| Categoria | Descrizione | Esempi |
|------------|------------|----------|
| 🧰 **Sistema e Kernel** | Configurazione e diagnostica del sistema | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Dischi e Partizioni** | Gestione, test e recupero dei dischi | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot e EFI** | Manutenzione di bootloader e partizioni EFI | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Rete e Internet** | Connettività, Wi-Fi e sincronizzazione dell'orario | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compressione e Impacchettamento** | Creazione e conversione di pacchetti e file | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Traduzione e Automazione** | Traduzione automatica e script paralleli | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Ambienti Chroot e Jail** | Montaggio ed esecuzione sicura dei chroot | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Manutenzione e Pulizia** | Pulizia, aggiornamento e inizializzazione dei pacchetti | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversione e Grafici** | Convertitori di immagini e formati | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Desktop e Interfaccia** | Impostazioni di temi, font e monitor | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Sistemi antichi (modalità retrò)** | Script per MS-DOS, FreeDOS e Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Amministrazione e Sicurezza** | Processi, permessi e utenti | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparatori e Sync** | Sincronizzazione e confronto di directory | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Evidenzia

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Genera il profilo della tua macchina (produttore, modello, BIOS, chassis e hardware), senza seriale, UUID o MAC, e lo invia tramite issue. Con i profili, il `chili-fr` simula su QEMU l'installazione di VoidBR su macchine reali.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Documentazione completa: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **chili-marketer**
Compressore universale con supporto a più algoritmi e crittografia tramite GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-traduttore-go**
Traduttore scritto in Go con thread paralleli e supporto JSON.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Gestisce partizioni e voci EFI, reinstalla GRUB e rileva più sistemi operativi.

### 🧪 **chili-confronta-cartelle**
Confronta e sincronizza directory con diverse modalità (rsync, comm, semplice).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Filosofia

> _“Automatizzare significa ridurre la noia, non l’attenzione.”_  
> — Vilmar Catafesta

I chili-utils seguono quattro comandamenti:

1. Semplicità sopra ogni cosa.
2. Zero dipendenze esterne ogni volta che possibile.
3. Script autoesplicativi e con messaggi chiari.
4. Compatibilità totale con ambienti POSIX.

---

## 🧱 Installazione

### 🧩 Opzione 1 — tramite PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Opzione 2 — tramite Makefile (installazione manuale)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Per rimuovere:

```bash
sudo make uninstall
```

### 🧩 Opzione 3 — Installare direttamente dal repository Chili Linux

> **Pacchetto pre-compilato (Arch, Manjaro e derivati)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Se il link sopra non funziona, accedi alla directory dei pacchetti e prendi manualmente l'ultima versione:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Licenza

Licenziato secondo la [Licença MIT](LICENSE).

Copyright (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Autore

**Vilmar Catafesta*  
💻 Programmatore & SysAdmin  
✉️ vcatafesta@gmail.com

---

## 🌶️ Conclusione

**chili-utils** è il coltellino svizzero definitivo per chi vive nel terminale —  
un arsenale di strumenti Unix puri, fatti per risolvere, non per decorare.

> _“Non esiste magia. Solo shell ben scritto.”_ 🧙‍♂️  
> — vcatafesta
