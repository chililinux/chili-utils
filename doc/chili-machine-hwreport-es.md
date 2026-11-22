# 🌶️ informe-de-hardware-de-chili

**chili-machine-hwreport** genera el **perfil de tu máquina**: un pequeño archivo de texto con fabricante, modelo, BIOS, chasis y hardware. Luego envía el perfil al mantenedor de VoidBR mediante un issue en GitHub.

Con estos perfiles, el **chili-fr** puede simular, en una máquina virtual (QEMU), la instalación de VoidBR en computadoras reales de los usuarios: portátiles antiguos, ordenadores de oficina, máquinas con BIOS heredado o UEFI. Así, los problemas aparecen antes de llegar a ti.

---

## 📦 Sobre

- **Autor:** Vilmar Catafesta
- **Licencia:** MIT
- **Herramientas involucradas:**
  - `chili-machine-hwreport`: genera y envía el perfil. Es quien el usuario ejecuta.
  - `chili-fr`: usa el perfil para simular la máquina en QEMU (`-M`).
  - `tools/chili-machine-import`: valida e importa el perfil enviado. Es una herramienta del mantenedor y no va en el paquete.
- **Compatibilidad:** cualquier Linux con `/sys/class/dmi/id`, incluso un live USB. Solo se necesita `bash`.

---

## 🔄 El proceso, de principio a fin

```
 sua máquina                         GitHub                         repositório
┌──────────────────────┐   issue   ┌──────────────────┐ importa ┌───────────────────────────┐
│ chili-machine-       │ ────────► │ [perfil-maquina] │ ──────► │ usr/share/chili-fr/       │
│ hwreport             │           │ Fabricante Modelo│         │ machines/<nome>.conf      │
└──────────────────────┘           └──────────────────┘         └─────────────┬─────────────┘
                                                                              │
                                                                              ▼
                                                                 chili-fr -M <nome> voidbr.iso
```

**1. En su máquina: `chili-machine-hwreport`**
El comando lee la información de identificación del ordenador, la misma que Linux muestra en `/sys/class/dmi/id`: fabricante, modelo, BIOS, placa base y tipo de chasis (portátil, escritorio…). También lee el procesador, la cantidad de núcleos, la memoria, el tipo de disco (SATA o NVMe) y el modo de arranque (UEFI o BIOS heredada). Con eso, construye el **perfil de la máquina** (`.conf`).

**2. El envío: issue en GitHub**
El comando abre (o muestra el enlace y el código QR de) un issue `[perfil-maquina]` ya completado en el repositorio `chililinux/chili-utils`. Solo hay que hacer clic en **Submit new issue**.

**3. La conferencia y la importación**
El mantenedor revisa el perfil, que pasa por una validación automática: fabricante y modelo reales, valores dentro de lo esperado, ningún dato personal y ninguna máquina repetida. Luego se incluye en `usr/share/chili-fr/machines/`, con un nombre como `lenovo-ideapad-s145-15iil`. En ese momento la issue recibe un comentario y se cierra.

**4. El uso: `chili-fr -M`**
La VM pasa a presentarse **como su máquina**: mismo fabricante, modelo, BIOS y tipo de chasis, procesador de la misma generación y el mismo tipo de disco y de arranque.

---

## 🔒 Privacidad

✅ **No se necesita root.** El comando nunca lee los campos protegidos del DMI.
✅ **El serial, UUID y MAC nunca** se leen ni se envían.
✅ **Etiqueta de activo** solo se utiliza cuando es texto de fábrica ("No Asset Tag"…). Algunos portátiles guardan allí el nombre del propietario.
✅ **Antes de enviar**, muestra todo lo que va a salir y pide confirmación.
✅ **La importación descarta** de nuevo cualquier serie, UUID o etiqueta de activo personal que aparezca en el problema.

---

## 🚀 Para quien envía el perfil

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Opción | Descripción |
|-------|-----------|
| `-n`, `--name <nome>` | nombre del perfil (predeterminado: `fabricante-modelo`) |
| `-s`, `--save-only` | solo genera el archivo local, no envía |
| `-y`, `--yes` | no pregunta nada (confirma todo) |
| `--nocolor` | salida sin colores |
| `-V`, `--version` | muestra la versión |
| `-h`, `--help` | muestra la ayuda |

**Dónde se encuentra el perfil:**
- `~/.config/chili-fr/machines/<nome>.conf`, listo para usar con `chili-fr -M <nome>`. Funcionando con `sudo` o `doas`, va al home de quien llamó el comando.
- En el **portapapeles**, cuando hay `wl-copy` (Wayland) o `xclip`/`xsel` (X11).

**Cómo funciona el envío:**
- **Con `gh` instalado y conectado:** el problema se crea directamente desde la terminal.
- **Sin `gh`:** el comando muestra un enlace de issue ya rellenado y, con `qrencode` instalado, un código QR para enviar por el móvil. Es necesario estar logueado en GitHub, porque no acepta issues anónimas.
- **¿Sin cuenta en GitHub?** Pegue el perfil, que ya está en el portapapeles, en una conversación con el mantenedor en Telegram o en un correo electrónico. Si lo prefiere, envíe el archivo `.conf`.

---

## 🧰 Para el mantenedor: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

Al importar, pregunta antes de cada paso:

1. Descarga el issue, extrae el bloque `conf` y **limpia** el perfil: quita espacios sobrantes, elimina llaves desconocidas y descarta datos personales.
2. **Valida** con las mismas reglas de chili-fr: fabricante y modelo reales, tipo de chasis, modelo de CPU, núcleos, memoria, bus de disco, UEFI, fecha del BIOS y dispositivo de video. También rechaza caracteres de control y textos demasiado largos.
3. Avisa si la máquina **ya está registrada** (mismo fabricante, modelo y versión de BIOS).
4. Guarda en `usr/share/chili-fr/machines/<nome>.conf`, con la fuente en el encabezado (número del issue y quién lo envió).
5. Haz **commit y push** en `main`.
6. **Comenta y cierra** el issue.

Necesita estar conectado a `gh` y a `jq`.

**GitHub Actions:** el flujo de trabajo `.github/workflows/import-machine-profile.yml` hace el mismo proceso con `-y`. Por ahora solo se ejecuta manualmente (Actions → *Importar perfil de máquina* → *Run workflow*). Si el perfil es inválido, comenta en el issue lo que está mal y no lo importa. Para importar automáticamente cuando se coloque la etiqueta `aprovado` en un issue, descomenta el bloque `issues:` del flujo de trabajo.

---

## 🖥️ Usando los perfiles en chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr` busca los perfiles en `~/.config/chili-fr/machines/` (del usuario) y en `/usr/share/chili-fr/machines/` (los que vienen con el paquete). El autocompletado de bash completa los nombres con `chili-fr -M <Tab>`.

Lo que cambia en la VM:
- **Identidad (SMBIOS/DMI):** el sistema invitado ve el fabricante, el modelo, el BIOS, la placa y el **tipo de chasis** de la máquina real. El tipo de chasis va en una tabla SMBIOS binaria, porque QEMU no permite definir este campo de otra manera.
- **Procesador:** usa el modelo de QEMU de la misma generación (`Penryn`, `Nehalem`, `IvyBridge`…), sin instrucciones que la CPU real no tuviera. Por ejemplo, los Core i3 antiguos vienen sin AES, así que un programa que requiera instrucciones más nuevas falla en la VM como fallaría en la máquina.
- **Disco y arranque:** el disco se adjunta como SATA o NVMe, entonces el instalador ve `/dev/sda` o `/dev/nvme0n1`, como en la máquina real. El arranque es UEFI o BIOS legado.

---

## 📄 Formato del perfil

Un archivo de texto con una línea `chave="valor"` para cada campo. Las líneas que comienzan con `#` son comentarios.

| Clave | Ejemplo | Descripción |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | descripción mostrada en `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | identificación del sistema (SMBIOS tipo 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | placa base (SMBIOS tipo 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS tipo 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` o el número (1–36) | tipo de chasis |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | chasis (SMBIOS tipo 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | modelo de CPU de QEMU |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | nombre de la CPU visto por el invitado |
| `smp` | `4` | núcleos |
| `mem` | `4G` | memoria |
| `video` | `VGA`, `virtio-vga-gl` | dispositivo de vídeo |
| `net` | `e1000e` | tarjeta de red |
| `disk_bus` | `virtio`, `sata`, `nvme` | bus del disco |
| `uefi` | `true`, `false` | UEFI o BIOS heredado |

Ejemplo (`lg-a410.conf`):

```conf
desc="LG A410-G.BC44P1 (notebook 2011, Core i3 M 390 Arrandale, BIOS legado INSYDE)"
vendor="LG Electronics"
product="A410-G.BC44P1"
version="TBD"
bios_vendor="INSYDE"
bios_version="QL7L3F92"
bios_date="03/14/2011"
chassis_type="other"
cpu="Nehalem"
cpu_name="Intel(R) Core(TM) i3 CPU       M 390  @ 2.67GHz"
smp=4
mem="3G"
disk_bus="sata"
uefi=false
```

---

## ⚠️ Limitaciones

- **Hardware continuo virtual:** la VM se presenta como la máquina, pero los dispositivos son los del QEMU. Batería, cargador y tapa no están emulados.
- **Campos vacíos:** lo que el perfil no complete recibe el valor predeterminado de QEMU, por ejemplo `Standard PC (Q35…)`.
- **CPUs AMD y muy nuevas** usan `cpu=host`, porque los modelos AMD de QEMU requieren un procesador AMD en el ordenador que ejecuta la VM.

---

## 🤝 Contribuya

¿Tienes un ordenador diferente, ya sea un portátil antiguo, un escritorio de oficina o una máquina con BIOS heredada? Ejecuta `chili-machine-hwreport` y envía el perfil. Cada máquina nueva ayuda a probar VoidBR en hardware real.
