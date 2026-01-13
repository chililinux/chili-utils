# 🌶️ chili-utils

**chili-utils** est une collection d'outils **Linux créés par Vilmar Catafesta** — un ensemble d'utilitaires rapides, simples et sans fioritures, réalisés en **Bash**, **C**, **Go**, **Harbour** et **Python**.

Le tout avec la philosophie Unix classique :
> _« Chaque outil fait une chose et le fait bien. »_

---

## 🧩 Aperçu

| Catégorie | Descriptif | Exemples |
|------------|------------|--------------|
| 🧰 **Système et noyau** | Configuration et diagnostic du système | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Disques et partitions** | Gestion des disques, tests et récupération | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot et EFI** | Maintenance des chargeurs de démarrage et des partitions EFI | `chili-manager-efi`, `chili-create-efi-entry`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Réseau et Internet** | Connectivité, Wi-Fi et synchronisation de l'heure | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compaction et emballage** | Création et conversion de packages et de fichiers | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Traduction et automatisation** | Traduction automatique et scripts parallèles | `chili-translator.sh`, `chili-translator-go`, `chili-translator-parallel` |
| ⚙️ **Ambientes Chroot et Jail** | Montage et exécution sécurisés de chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Entretien et nettoyage** | Nettoyage, mise à jour et initialisation des packages | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversion et graphisme** | Convertisseurs d'images et de formats | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Bureau et interface** | Ajustements du thème, de la police et du moniteur | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Anciens systèmes (mode rétro)** | Scripts pour MS-DOS, FreeDOS et Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administration et sécurité** | Processus, autorisations et utilisateurs | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparateurs et synchronisation** | Synchronisation et comparaison d'annuaires | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Faits saillants

### 🔥 **chili-maketar**
Compresseur universel avec prise en charge de plusieurs algorithmes et cryptage via GPG.

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
