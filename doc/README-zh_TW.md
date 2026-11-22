# 🌶️ 辣椒工具

**chili-utils** 是一系列 **由 Vilmar Catafesta 創建的 Linux 工具** — 一套快速、直接且不繁瑣的實用程序，使用 **Bash**、**C**、**Go**、**Harbour** 和 **Python** 製作。

一切遵循 Unix 的經典哲學：  
> _“每個工具都有其用途，而且做得很好。”_

---

## 🧩 概覽

| 類別 | 描述 | 範例 |
|------------|------------|----------|
| 🧰 **系統與核心** | 系統設定與診斷 | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **磁碟與分割區** | 磁碟管理、測試與恢復 | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **啟動與 EFI** | 啟動加載器和 EFI 分割區的維護 | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **網路與互聯網** | 連線、Wi-Fi 與時間同步 | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **壓縮與打包** | 套件與檔案的創建與轉換 | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **翻譯與自動化** | 自動翻譯與平行腳本 | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Chroot 和 Jail 環境** | Chroot 的安全掛載和執行 | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **維護與清理** | 套件的清理、更新和初始化 | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **轉換與圖表** | 圖像與格式轉換器 | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **桌面與介面** | 主題、字型和顯示器設置 | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **舊系統（復古模式）** | 適用於 MS-DOS、FreeDOS 及 Windows 3.11 的腳本 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **管理與安全** | 流程、權限與使用者 | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **比較器與同步** | 目錄的同步與比較 | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ 精選

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
生成您的機器配置檔（製造商、型號、BIOS、機殼和硬體），不包含序號、UUID 或 MAC，並通過 issue 發送。有了這些配置檔，`chili-fr` 可以在 QEMU 中模擬在實際機器上安裝 VoidBR。

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 完整文件：[chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **辣椒-市場人**
通用壓縮器，支援多種演算法及通過 GPG 的加密。

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-翻譯器-go**
用 Go 編寫的翻譯器，具有平行線程和 JSON 支援。

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
管理分割區和 EFI 項目，重新安裝 GRUB 並檢測多個操作系統。

### 🧪 **辣椒-比較-目錄**
以不同模式（rsync、comm、簡單）比較並同步目錄。

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 哲學

> _“自動化是減少無聊，而不是減少注意力。”_  
> — 維爾馬爾·卡塔費斯塔

chili-utils 遵循四條戒律：

1. 簡單勝於一切。
2. 盡可能不依賴外部資源。
3. 自我說明且訊息清晰的腳本。
4. 與 POSIX 環境完全相容。

---

## 🧱 安裝

### 🧩 選項 1 — 透過 PKGBUILD（Arch / Manjaro）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 選項 2 — 透過 Makefile（手動安裝）

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

要移除：

```bash
sudo make uninstall
```

### 🧩 選項 3 — 直接從 Chili Linux 儲存庫安裝

> **預編譯套件（Arch、Manjaro 及衍生版本）**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> 如果上面的連結失效，請前往套件目錄並手動取得最新版本：  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 執照

根據 [Licença MIT](LICENSE) 許可。

版權所有 (c) 2019-2025  
Vilmar Catafesta <vcatafesta@gmail.com>

---

## 🧩 作者

**維爾馬爾·卡塔費斯塔*  
💻 程式設計師 & 系統管理員  
✉️ vcatafesta@gmail.com

---

## 🌶️ 結論

**chili-utils** 是終端使用者的終極瑞士軍刀 —  
一整套純粹的 Unix 工具，為了解決問題而不是裝飾而製作。

> _“沒有魔法。只有寫得好的 shell。”_ 🧙‍♂️  
> — vcatafesta
