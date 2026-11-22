# 🌶️ utilitaires-chili

**chili-utils** est une collection de **outils Linux créés par Vilmar Catafesta** — un ensemble d'utilitaires rapides, directs et sans fioritures, faits en **Bash**, **C**, **Go**, **Harbour** et **Python**.

Tout avec la philosophie classique d'Unix :  
> _“Chaque outil fait une chose, et la fait bien.”_

---

## 🧩 Vue d'ensemble

| Catégorie | Description | Exemples |
|------------|------------|----------|
| 🧰 **Système et Kernel** | Configuration et diagnostic du système | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Disques et Partitions** | Gestion, test et récupération de disques | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot et EFI** | Maintenance des bootloaders et des partitions EFI | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Réseau et Internet** | Connectivité, Wi-Fi et synchronisation de l'heure | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compression et Emballage** | Création et conversion de paquets et fichiers | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Traduction et Automatisation** | Traduction automatique et scripts parallèles | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Environnements Chroot et Jail** | Montage et exécution sécurisée de chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Maintenance et Nettoyage** | Nettoyage, mise à jour et initialisation des packages | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversion et Graphiques** | Convertisseurs d'images et de formats | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Bureau et Interface** | Réglages des thèmes, des polices et des moniteurs | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Systèmes anciens (mode rétro)** | Scripts pour MS-DOS, FreeDOS et Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administration et Sécurité** | Processus, permissions et utilisateurs | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparateurs et Sync** | Synchronisation et comparaison de répertoires | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Points forts

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Génère le profil de votre machine (fabricant, modèle, BIOS, châssis et matériel), sans numéro de série, UUID ni MAC, et l'envoie par issue. Avec les profils, le `chili-fr` simule dans QEMU l'installation de VoidBR sur des machines réelles.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Documentation complète : [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **chili-maketar**
Compresseur universel avec support pour plusieurs algorithmes et chiffrement via GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-traducteur-go**
Traducteur écrit en Go avec des threads parallèles et support JSON.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Gère les partitions et les entrées EFI, réinstalle GRUB et détecte plusieurs systèmes d'exploitation.

### 🧪 **chili-comparer-dossiers**
Compare et synchronise des répertoires avec différents modes (rsync, comm, simple).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Philosophie

> _« Automatiser, c’est réduire l’ennui, pas l’attention. »_  
> — Vilmar Catafesta

Les chili-utils suivent quatre commandements :

1. La simplicité avant tout.
2. Zéro dépendances externes autant que possible.
3. Scripts auto-explicatifs et avec des messages clairs.
4. Compatibilité totale avec les environnements POSIX.

---

## 🧱 Installation

### 🧩 Option 1 — via PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Option 2 — via Makefile (installation manuelle)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Pour enlever :

```bash
sudo make uninstall
```

### 🧩 Option 3 — Installer directement depuis le dépôt Chili Linux

> **Package pré-compilé (Arch, Manjaro et dérivés)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Si le lien ci-dessus échoue, accédez au répertoire des paquets et prenez la version la plus récente manuellement :  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Licence

Licencié sous le [Licença MIT](LICENSE).

Droits d'auteur (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Auteur

**Vilmar Catafesta*  
💻 Programmeur & SysAdmin  
✉️ vcatafesta@gmail.com

---

## 🌶️ Conclusion

**chili-utils** est le couteau suisse définitif pour ceux qui vivent dans le terminal —  
un arsenal d'outils Unix purs, faits pour résoudre, pas pour embellir.

> _“Il n’y a pas de magie. Seulement des scripts shell bien écrits.”_ 🧙‍♂️  
> — vcatafesta
