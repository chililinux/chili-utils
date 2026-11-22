# 🌶️ 辣椒-机器-硬件报告

**chili-machine-hwreport** 生成 **您的机器配置文件**：一个包含制造商、型号、BIOS、机箱和硬件的小型文本文件。然后它通过 GitHub issue 将配置文件发送给 VoidBR 的维护者。

通过这些配置文件，**chili-fr** 可以在虚拟机（QEMU）中模拟在用户的真实计算机上安装 VoidBR：旧笔记本、办公台式机、具有传统 BIOS 或 UEFI 的机器。这样问题会在到达你之前就出现。

---

## 📦 关于

- **作者：** Vilmar Catafesta
- **许可证:** MIT
- **涉及的工具：**
  - `chili-machine-hwreport`：生成并发送配置文件。是用户运行的程序。
  - `chili-fr`：使用配置文件在 QEMU 中模拟机器 (`-M`)。
  - `tools/chili-machine-import`：验证并导入所发送的配置文件。这是维护工具，不会包含在包中。
- **兼容性：** 任何带 `/sys/class/dmi/id` 的 Linux，包括 live USB。只需要 `bash`。

---

## 🔄 从开始到结束的过程

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

**1. 在您的机器上：`chili-machine-hwreport`**
该命令读取计算机的识别信息，与 Linux 在 `/sys/class/dmi/id` 中显示的信息相同：制造商、型号、BIOS、主板以及机箱类型（笔记本、台式机…）。它还读取处理器、核心数量、内存、磁盘类型（SATA 或 NVMe）以及启动模式（UEFI 或传统 BIOS）。通过这些信息，它构建了**计算机配置档案**（`.conf`）。

**2. 提交：GitHub 问题**
该命令会在仓库 `chililinux/chili-utils` 中打开（或显示链接和二维码的）已填写好的 `[perfil-maquina]` 问题。只需点击 **提交新问题**。

**3. 会议与进口*
维护者会审查配置文件，该文件会经过自动验证：真实的制造商和型号，数值在预期范围内，没有个人数据，也没有重复的设备。之后它会被加入到 `usr/share/chili-fr/machines/` 中，并命名为 `lenovo-ideapad-s145-15iil`。此时，该问题会收到一条评论并被关闭。

**4. 使用方法: `chili-fr -M`**
虚拟机开始呈现 **像您的机器一样**：相同的制造商、型号、BIOS和机箱类型，相同世代的处理器，以及相同类型的硬盘和启动方式。

---

## 🔒 隐私

✅ **不需要 root 权限。** 该命令从不读取 DMI 的受保护字段。
✅ **序列号、UUID 和 MAC 从不** 被读取或发送。
✅ **资产标签** 只有在出厂文本（“无资产标签”…）时才会出现。一些笔记本电脑会在那里保存主人姓名。
✅ **在发送之前**，显示将要发送的所有内容并请求确认。
✅ **导入会再次丢弃**在问题中出现的任何个人序列号、UUID 或资产标签。

---

## 🚀 发送简历的人

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| 选项 | 描述 |
|-------|-----------|
| `-n`, `--name <nome>` | 配置文件名称（默认：`fabricante-modelo`） |
| `-s`, `--save-only` | 只生成本地文件，不发送 |
| `-y`, `--yes` | 不问任何问题（确认一切） |
| `--nocolor` | 无颜色输出 |
| `-V`, `--version` | 显示版本 |
| `-h`, `--help` | 显示帮助 |

**个人资料所在位置：**
- `~/.config/chili-fr/machines/<nome>.conf`，可与 `chili-fr -M <nome>` 一起使用。运行在 `sudo` 或 `doas` 上时，它会进入调用命令的用户的主目录。
- 在**剪贴板**中，当存在 `wl-copy`（Wayland）或 `xclip`/`xsel`（X11）时。

**配送如何运作：**
- **安装并登录 `gh` 后：** 问题会直接通过终端创建。
- **没有 `gh`:** 该命令显示一个已填写好的 issue 链接，并且在安装了 `qrencode` 后，会显示一个可以通过手机发送的二维码。需要登录 GitHub，因为它不接受匿名 issue。
- **没有 GitHub 账户？** 将已复制到剪贴板的个人资料粘贴到与维护者在 Telegram 的对话中或通过电子邮件发送。如果愿意，也可以发送 `.conf` 文件。

---

## 🧰 给维护者：`tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

在导入时，它会在每一步之前询问：

1. 下载问题，提取 `conf` 块并**清理**配置文件：去掉多余的空格，移除未知的键，并丢弃个人数据。
2. **有效**，遵循与 chili-fr 相同的规则：真实的制造商和型号、底盘类型、CPU 型号、核心数、内存、磁盘总线、UEFI、BIOS 日期和视频设备。还会拒绝控制字符和过长的文本。
3. 通知是否该机器**已注册**（相同制造商、型号和 BIOS 版本）。
4. 保存到 `usr/share/chili-fr/machines/<nome>.conf`，标题中带有来源（问题编号和发送者）。
5. 在 `main` 上 **提交并推送**。
6. **评论并关闭**该问题。

需要登录 `gh` 和 `jq`。

**GitHub Actions:** `.github/workflows/import-machine-profile.yml` 工作流与 `-y` 做同样的过程。目前它只能手动运行（Actions → *导入机器配置文件* → *运行工作流*）。如果配置文件无效，它会在问题中评论错误内容并且不导入。要在 `aprovado` 标签被放在某个问题上时自动导入，请取消注释工作流中的 `issues:` 模块。

---

## 🖥️ 在 chili-fr 使用个人资料

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr` 会在 `~/.config/chili-fr/machines/`（用户的）和 `/usr/share/chili-fr/machines/`（随包提供的）中查找配置文件。bash 的补全会使用 `chili-fr -M <Tab>` 完成名称。

虚拟机有什么变化：
- **身份信息 (SMBIOS/DMI)：** 客户机看到的是实际机器的制造商、型号、BIOS、主板和 **机箱类型**。机箱类型存储在一个二进制 SMBIOS 表中，因为 QEMU 不允许以其他方式设置该字段。
- **处理器:** 使用与 QEMU 相同代的型号 (`Penryn`, `Nehalem`, `IvyBridge`…) ，不包含真实 CPU 所没有的指令。例如，老款 Core i3 不支持 AES，因此需要较新指令的程序将在虚拟机中失败，就像在真实机器上一样。
- **磁盘与启动：** 磁盘被作为 SATA 或 NVMe 附加，因此安装程序会看到 `/dev/sda` 或 `/dev/nvme0n1`，就像在真实机器上一样。启动为 UEFI 或传统 BIOS。

---

## 📄 个人资料格式

一个文本文件，每个字段有一行 `chave="valor"`。以 `#` 开头的行是注释。

| 键 | 示例 | 描述 |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | 在 `--list-machines` 中显示的描述 |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | 系统识别（SMBIOS 类型 1） |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | 主板 (SMBIOS 类型 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS（SMBIOS 类型 0） |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` 或数字 (1–36) | 底盘类型 |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | 底盘 (SMBIOS 类型 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU的CPU型号 |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | 客户机看到的 CPU 名称 |
| `smp` | `4` | 核心 |
| `mem` | `4G` | 内存 |
| `video` | `VGA`, `virtio-vga-gl` | 视频设备 |
| `net` | `e1000e` | 网卡 |
| `disk_bus` | `virtio`, `sata`, `nvme` | 磁盘总线 |
| `uefi` | `true`, `false` | UEFI 或传统 BIOS |

示例 (`lg-a410.conf`)：

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

## ⚠️ 限制

- **硬件仍然是虚拟的：** 虚拟机呈现为一台机器，但设备来自 QEMU。电池、充电器和后盖没有被模拟。
- **空字段:** 配置文件未填写的字段将使用 QEMU 的默认值，例如 `Standard PC (Q35…)`。
- **非常新的 AMD CPU** 使用 `cpu=host`，因为 QEMU 的 AMD 模型要求运行虚拟机的计算机必须有 AMD 处理器。

---

## 🤝 贡献

有一台不同的电脑，是旧笔记本、办公台式机，还是带有传统 BIOS 的机器？运行 `chili-machine-hwreport` 并发送配置文件。每一台新机器都有助于在真实硬件上测试 VoidBR。
