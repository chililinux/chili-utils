# 🌶️ chili-utils

**chili-utils** é uma coleção de **ferramentas Linux criadas por Vilmar Catafesta** — um conjunto de utilitários rápidos, diretos e sem frescura, feitos em **Bash**, **C**, **Go**, **Harbour** e **Python**.

Tudo com a filosofia clássica do Unix:  
> _“Cada ferramenta faz uma coisa, e faz bem.”_

---

## 🧩 Visão geral

| Categoria | Descrição | Exemplos |
|------------|------------|----------|
| 🧰 **Sistema e Kernel** | Configuração e diagnóstico do sistema | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Discos e Partições** | Gerenciamento, teste e recuperação de discos | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot e EFI** | Manutenção de bootloaders e partições EFI | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Rede e Internet** | Conectividade, Wi-Fi e sincronização de tempo | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compactação e Empacotamento** | Criação e conversão de pacotes e arquivos | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Tradução e Automação** | Tradução automática e scripts paralelos | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Ambientes Chroot e Jail** | Montagem e execução segura de chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Manutenção e Limpeza** | Limpeza, atualização e inicialização de pacotes | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversão e Gráficos** | Conversores de imagens e formatos | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Desktop e Interface** | Ajustes de temas, fontes e monitores | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Sistemas antigos (retro mode)** | Scripts para MS-DOS, FreeDOS e Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administração e Segurança** | Processos, permissões e usuários | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparadores e Sync** | Sincronização e comparação de diretórios | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Destaques

### 🔥 **chili-maketar**
Compactador universal com suporte a múltiplos algoritmos e criptografia via GPG.

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
