# 🌶️ utilitários-chili

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
| 🧱 **Sistemas antigos (modo retrô)** | Scripts para MS-DOS, FreeDOS e Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administração e Segurança** | Processos, permissões e usuários | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparadores e Sync** | Sincronização e comparação de diretórios | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Destaques

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Gera o perfil da sua máquina (fabricante, modelo, BIOS, chassi e hardware), sem serial, UUID nem MAC, e envia por issue. Com os perfis, o `chili-fr` simula no QEMU a instalação do VoidBR em máquinas reais.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Documentação completa: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **chili-marketeer**
Compactador universal com suporte a múltiplos algoritmos e criptografia via GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-tradutor-go**
Tradutor escrito em Go com threads paralelos e suporte a JSON.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Gerencia partições e entradas EFI, reinstala o GRUB e detecta múltiplos sistemas operacionais.

### 🧪 **chili-comparar-diretórios**
Compara e sincroniza diretórios com diferentes modos (rsync, comm, simples).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Filosofia

> _“Automatizar é reduzir o tédio, não a atenção.”_  
> — Vilmar Catafesta

Os chili-utils seguem quatro mandamentos:

1. Simplicidade acima de tudo.
2. Zero dependências externas sempre que possível.
3. Scripts autoexplicativos e com mensagens claras.
4. Compatibilidade total com ambientes POSIX.

---

## 🧱 Instalação

### 🧩 Opção 1 — via PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Opção 2 — via Makefile (instalação manual)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Para remover:

```bash
sudo make uninstall
```

### 🧩 Opção 3 — Instalar diretamente do repositório Chili Linux

> **Pacote pré-compilado (Arch, Manjaro e derivados)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Se o link acima falhar, acesse o diretório de pacotes e pegue a versão mais recente manualmente:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Licença

Licenciado sob a [Licença MIT](LICENSE).

Direitos autorais (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Autor

**Vilmar Catafesta*  
💻 Programador & SysAdmin  
✉️ vcatafesta@gmail.com

---

## 🌶️ Conclusão

**chili-utils** é o canivete suíço definitivo para quem vive no terminal —  
um arsenal de ferramentas Unix puras, feitas para resolver, não para enfeitar.

> _“Não existe mágica. Só shell bem escrito.”_ 🧙‍♂️  
> — vcatafesta
