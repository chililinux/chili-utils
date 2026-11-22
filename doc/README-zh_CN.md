# 🌶️ 辣椒工具

**chili-utils** 是 **Vilmar Catafesta 创建的 Linux 工具集合** — 一套快速、直接、无花哨的实用工具，使用 **Bash**、**C**、**Go**、**Harbour** 和 **Python** 制作。

一切都遵循 Unix 的经典哲学：  
> _“每种工具都有其用途，且都做得很好。”_

---

## 🧩 概览

| 类别 | 描述 | 示例 |
|------------|------------|----------|
| 🧰 **系统与内核** | 系统配置与诊断 | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **磁盘和分区** | 磁盘管理、测试和恢复 | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **启动和EFI** | 启动加载程序和EFI分区的维护 | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **网络与互联网** | 连接性、Wi-Fi 和时间同步 | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **压缩与打包** | 创建和转换包及文件 | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **翻译与自动化** | 自动翻译与并行脚本 | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Chroot 和 Jail 环境** | Chroot 的安全挂载和执行 | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **维护与清理** | 清理、更新和初始化软件包 | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **转换与图表** | 图像和格式转换器 | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **桌面与界面** | 主题、字体和显示器设置 | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **旧系统（复古模式）** | MS-DOS、FreeDOS 和 Windows 3.11 的脚本 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **管理与安全** | 流程、权限和用户 | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **比较器与同步** | 目录的同步与比较 | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ 亮点

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
生成您的机器配置文件（制造商、型号、BIOS、机箱和硬件），不包含序列号、UUID 或 MAC，并通过问题发送。有了这些配置文件，`chili-fr` 可以在 QEMU 中模拟 VoidBR 在真实机器上的安装。

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 完整文档：[chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **辣椒-马凯塔尔**
通用压缩器，支持多种算法并通过 GPG 进行加密。

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-翻译器-go**
用 Go 编写的翻译器，具有并行线程和 JSON 支持。

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
管理分区和EFI条目，重新安装GRUB并检测多个操作系统。

### 🧪 **辣椒-比较-目录**
比较并同步目录，具有不同模式（rsync、comm、简单）。

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 哲学

> _“自动化是减少无聊，而不是减少注意力。”_  
> — 维尔马尔·卡塔费斯塔

chili-utils 遵循四条戒律：

1. 简约至上。
2. 尽可能零外部依赖。
3. 自解释且信息清晰的脚本。
4. 与POSIX环境完全兼容。

---

## 🧱 安装

### 🧩 选项 1 — 通过 PKGBUILD（Arch / Manjaro）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 选项 2 — 通过 Makefile（手动安装）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

要删除：

```bash
sudo make uninstall
```

### 🧩 选项3 — 直接从Chili Linux仓库安装

> **预编译包（Arch、Manjaro及其衍生版）**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> 如果上述链接无法打开，请访问软件包目录并手动获取最新版本：  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 许可证

根据 [Licença MIT](LICENSE) 授权许可。

版权所有 (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 作者

**维尔马尔·卡塔费斯塔*  
💻 程序员 & 系统管理员  
✉️ vcatafesta@gmail.com

---

## 🌶️ 结论

**chili-utils** 是终端用户的终极瑞士军刀 —  
一套纯粹的 Unix 工具，旨在解决问题，而不是为了美化。

> _“没有魔法。只有写得很好的 shell。”_ 🧙‍♂️  
> — vcatafesta
