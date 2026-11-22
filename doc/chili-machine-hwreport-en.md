# 🌶️ chili-machine-hwreport

**chili-machine-hwreport** generates the **profile of your machine**: a small text file with manufacturer, model, BIOS, chassis, and hardware. Then it sends the profile to the maintainer of VoidBR via an issue on GitHub.

With these profiles, **chili-fr** can simulate, on a virtual machine (QEMU), the installation of VoidBR on users' real computers: old notebooks, office desktops, machines with legacy BIOS or UEFI. This way, problems appear before reaching you.

---

## 📦 About

- **Author:** Vilmar Catafesta
- **License:** MIT
- **Tools involved:**
  - `chili-machine-hwreport`: generates and sends the profile. It's what the user runs.
  - `chili-fr`: uses the profile to simulate the machine in QEMU (`-M`).
  - `tools/chili-machine-import`: validates and imports the sent profile. It is a maintainer's tool and does not go in the package.
- **Compatibility:** any Linux with `/sys/class/dmi/id`, including a live USB. Only `bash` is needed.

---

## 🔄 The process, from start to finish

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

**1. On your machine: `chili-machine-hwreport`**
The command reads the computer's identification information, the same that Linux shows in `/sys/class/dmi/id`: manufacturer, model, BIOS, motherboard, and chassis type (notebook, desktop…). It also reads the processor, the number of cores, the memory, the type of disk (SATA or NVMe), and the boot mode (UEFI or legacy BIOS). With this, it builds the **machine profile** (`.conf`).

**2. The submission: issue on GitHub**
The command opens (or shows the link and QR code of) a pre-filled issue `[perfil-maquina]` in the repository `chililinux/chili-utils`. Just click **Submit new issue**.

**3. The conference and the import*
The maintainer reviews the profile, which goes through an automatic validation: real manufacturer and model, values within the expected range, no personal data, and no duplicate machines. Then it is included in `usr/share/chili-fr/machines/`, with a name like `lenovo-ideapad-s145-15iil`. At that moment, the issue receives a comment and is closed.

**4. The use: `chili-fr -M`**
The VM starts to present itself **as your machine**: same manufacturer, model, BIOS and chassis type, processor of the same generation, and the same type of disk and boot.

---

## 🔒 Privacy

✅ **No root needed.** The command never reads the protected DMI fields.
✅ **Serial, UUID, and MAC are never** read or sent.
✅ **Asset tag** only appears when it is factory text ("No Asset Tag"…). Some notebooks store the owner's name there.
✅ **Before sending**, show everything that will be sent and ask for confirmation.
✅ **The import discards** again any serial, UUID, or personal asset tag that appears in the issue.

---

## 🚀 For those who send the profile

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Option | Description |
|-------|-----------|
| `-n`, `--name <nome>` | profile name (default: `fabricante-modelo`) |
| `-s`, `--save-only` | only generates the local file, does not send |
| `-y`, `--yes` | doesn't ask anything (confirms everything) |
| `--nocolor` | output without colors |
| `-V`, `--version` | displays the version |
| `-h`, `--help` | displays the help |

**Where the profile is located:**
- `~/.config/chili-fr/machines/<nome>.conf`, ready to use with `chili-fr -M <nome>`. Running with `sudo` or `doas`, it goes to the home of whoever called the command.
- In the **clipboard**, when there is `wl-copy` (Wayland) or `xclip`/`xsel` (X11).

**How shipping works:**
- **With `gh` installed and logged in:** the issue is created directly from the terminal.
- **Without `gh`:** the command shows a pre-filled issue link and, with `qrencode` installed, a QR code to send via mobile. You need to be logged in to GitHub, because it does not accept anonymous issues.
- **No GitHub account?** Paste the profile, which is already in the clipboard, into a conversation with the maintainer on Telegram or in an email. If you prefer, send the `.conf` file.

---

## 🧰 For the maintainer: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

When importing, it asks before each step:

1. Download the issue, extract the `conf` block and **clean** the profile: remove extra spaces, delete unknown keys, and discard personal data.
2. **Validates** with the same rules as chili-fr: real manufacturer and model, chassis type, CPU model, cores, memory, disk bus, UEFI, BIOS date, and video device. It also rejects control characters and overly long texts.
3. It notifies if the machine **is already registered** (same manufacturer, model, and BIOS version).
4. Save in `usr/share/chili-fr/machines/<nome>.conf`, with the source in the header (issue number and who sent it).
5. Make **commit and push** to `main`.
6. **Comment and close** the issue.

You need to be logged into `gh` and `jq`.

**GitHub Actions:** the workflow `.github/workflows/import-machine-profile.yml` does the same process with `-y`. For now, it only runs manually (Actions → *Import machine profile* → *Run workflow*). If the profile is invalid, it comments on the issue what is wrong and does not import. To automatically import when the label `aprovado` is put on an issue, uncomment the `issues:` block of the workflow.

---

## 🖥️ Using profiles on chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr` searches for profiles in `~/.config/chili-fr/machines/` (of the user) and in `/usr/share/chili-fr/machines/` (those that come with the package). The bash completion completes the names with `chili-fr -M <Tab>`.

What changes in the VM:
- **Identity (SMBIOS/DMI):** the guest system sees the manufacturer, model, BIOS, motherboard, and **chassis type** of the real machine. The chassis type goes into a binary SMBIOS table, because QEMU does not allow this field to be defined any other way.
- **Processor:** uses the QEMU model of the same generation (`Penryn`, `Nehalem`, `IvyBridge`…), without instructions that the real CPU did not have. For example, old Core i3s come without AES, so a program that requires newer instructions fails in the VM just as it would on the machine.
- **Disk and boot:** the disk is attached as SATA or NVMe, so the installer sees `/dev/sda` or `/dev/nvme0n1`, as on the real machine. The boot is UEFI or legacy BIOS.

---

## 📄 Profile format

A text file with one `chave="valor"` line for each field. Lines starting with `#` are comments.

| Key | Example | Description |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | description displayed in `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | system identification (SMBIOS type 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | motherboard (SMBIOS type 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS type 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` or the number (1–36) | chassis type |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | chassis (SMBIOS type 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU CPU model |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | name of the CPU seen by the guest |
| `smp` | `4` | cores |
| `mem` | `4G` | memory |
| `video` | `VGA`, `virtio-vga-gl` | video device |
| `net` | `e1000e` | network card |
| `disk_bus` | `virtio`, `sata`, `nvme` | disk bus |
| `uefi` | `true`, `false` | UEFI or legacy BIOS |

Example (`lg-a410.conf`):

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

## ⚠️ Limitations

- **Hardware remains virtual:** the VM presents itself as the machine, but the devices are those of QEMU. Battery, charger, and lid are not emulated.
- **Empty fields:** what the profile does not fill in receives QEMU's default value, for example `Standard PC (Q35…)`.
- **Very new AMD CPUs** use `cpu=host`, because QEMU's AMD models require an AMD processor in the computer running the VM.

---

## 🤝 Contribute

Do you have a different computer, whether an old laptop, a desktop office PC, or a machine with legacy BIOS? Run `chili-machine-hwreport` and send the profile. Every new machine helps test VoidBR on real hardware.
