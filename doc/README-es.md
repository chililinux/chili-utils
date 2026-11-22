# 🌶️ utilidades-chili

**chili-utils** es una colección de **herramientas Linux creadas por Vilmar Catafesta** — un conjunto de utilidades rápidas, directas y sin complicaciones, hechas en **Bash**, **C**, **Go**, **Harbour** y **Python**.

Todo con la filosofía clásica de Unix:  
> _“Cada herramienta hace una cosa, y la hace bien.”_

---

## 🧩 Visión general

| Categoría | Descripción | Ejemplos |
|------------|------------|----------|
| 🧰 **Sistema y Kernel** | Configuración y diagnóstico del sistema | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Discos y Particiones** | Gestión, prueba y recuperación de discos | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot y EFI** | Mantenimiento de bootloaders y particiones EFI | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Red e Internet** | Conectividad, Wi-Fi y sincronización de tiempo | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Compresión y Empaquetado** | Creación y conversión de paquetes y archivos | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Traducción y Automatización** | Traducción automática y scripts paralelos | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Entornos Chroot y Jail** | Montaje y ejecución segura de chroots | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Mantenimiento y Limpieza** | Limpieza, actualización e inicialización de paquetes | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Conversión y Gráficos** | Convertidores de imágenes y formatos | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Escritorio e Interfaz** | Ajustes de temas, fuentes y monitores | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Sistemas antiguos (modo retro)** | Scripts para MS-DOS, FreeDOS y Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Administración y Seguridad** | Procesos, permisos y usuarios | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Comparadores y Sync** | Sincronización y comparación de directorios | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Destaques

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Genera el perfil de tu máquina (fabricante, modelo, BIOS, chasis y hardware), sin serial, UUID ni MAC, y envíalo por issue. Con los perfiles, el `chili-fr` simula en QEMU la instalación de VoidBR en máquinas reales.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Documentación completa: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **chili-maketar**
Compactador universal con soporte para múltiples algoritmos y cifrado mediante GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-traductor-go**
Traductor escrito en Go con hilos paralelos y soporte para JSON.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Gestiona particiones y entradas EFI, reinstala GRUB y detecta múltiples sistemas operativos.

### 🧪 **chili-comparar-directorios**
Compara y sincroniza directorios con diferentes modos (rsync, comm, simple).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Filosofía

> _“Automatizar es reducir el aburrimiento, no la atención.”_  
> — Vilmar Catafesta

Los chili-utils siguen cuatro mandamientos:

1. Simplicidad por encima de todo.
2. Cero dependencias externas siempre que sea posible.
3. Scripts autoexplicativos y con mensajes claros.
4. Compatibilidad total con entornos POSIX.

---

## 🧱 Instalación

### 🧩 Opción 1 — vía PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Opción 2 — vía Makefile (instalación manual)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Para eliminar:

```bash
sudo make uninstall
```

### 🧩 Opción 3 — Instalar directamente desde el repositorio Chili Linux

> **Paquete precompilado (Arch, Manjaro y derivados)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Si el enlace anterior falla, acceda al directorio de paquetes y obtenga la versión más reciente manualmente:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Licencia

Licenciado bajo la [Licença MIT](LICENSE).

Derechos de autor (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 Autor

**Vilmar Catafesta*  
💻 Programador & SysAdmin  
✉️ vcatafesta@gmail.com

---

## 🌶️ Conclusión

**chili-utils** es la navaja suiza definitiva para quien vive en el terminal —  
un arsenal de herramientas Unix puras, hechas para resolver, no para adornar.

> _“No existe magia. Solo un shell bien escrito.”_ 🧙‍♂️  
> — vcatafesta
