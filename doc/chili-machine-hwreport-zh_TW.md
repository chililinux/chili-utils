# 🌶️ 辣椒機硬體報告

**chili-machine-hwreport** 生成 **你的機器配置檔**：一個包含製造商、型號、BIOS、機殼和硬體的小型文字檔。之後，它會通過 GitHub 的 issue 將配置檔發送給 VoidBR 維護者。

透過這些配置檔，**chili-fr** 能夠在虛擬機（QEMU）中模擬在使用者的實體電腦上安裝 VoidBR：舊筆記型電腦、辦公室桌上型電腦、使用傳統 BIOS 或 UEFI 的機器。這樣問題就會在到達你之前出現。

---

## 📦 關於

- **作者:** Vilmar Catafesta
- **許可證:** MIT
- **涉及的工具:**
  - `chili-machine-hwreport`：生成並發送配置文件。它是用戶運行的。
  - `chili-fr`：使用該配置檔在 QEMU 中模擬機器 (`-M`)。
  - `tools/chili-machine-import`：驗證並導入已發送的配置檔。這是維護者的工具，不會包含在套件中。
- **相容性:** 任何帶有 `/sys/class/dmi/id` 的 Linux，包括 live USB。只需要 `bash`。

---

## 🔄 從開始到結束的過程

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

**1. 在您的設備上：`chili-machine-hwreport`**
該命令會讀取電腦的識別資訊，這些資訊與 Linux 在 `/sys/class/dmi/id` 中顯示的相同：製造商、型號、BIOS、主機板及機殼類型（筆電、桌電…）。它還會讀取處理器、核心數量、記憶體、磁碟類型（SATA 或 NVMe）及啟動模式（UEFI 或傳統 BIOS）。藉此，它會建立**機器配置檔**（`.conf`）。

**2. 發送：GitHub 上的問題**
該指令會打開（或顯示鏈接和 QR 碼）一個已在儲存庫 `chililinux/chili-utils` 中完成填寫的 `[perfil-maquina]` 問題。只需點擊 **Submit new issue**。

**3. 會議與進口*
維護者會審查配置檔，該檔案會經過自動驗證：製造商和型號真實、數值在預期範圍內、沒有個人資料，且沒有重複的機器。之後它會被加入 `usr/share/chili-fr/machines/`，並命名為 `lenovo-ideapad-s145-15iil`。此時該議題會收到一則評論，並被關閉。

**4. 使用方式：`chili-fr -M`**
虛擬機開始呈現 **如同您的機器**：相同的製造商、型號、BIOS 和機箱類型、同一代的處理器以及相同類型的硬碟和啟動方式。

---

## 🔒 隱私

✅ **不需要 root。** 這個指令從不讀取 DMI 的受保護欄位。
✅ **序列號、UUID 和 MAC 從不** 被讀取或發送。
✅ **資產標籤** 只有當它是廠商文字時才會出現（"No Asset Tag"…）。一些筆記型電腦會在那裡保存擁有者的名字。
✅ **在發送之前**，顯示所有即將發出的內容並請求確認。
✅ **匯入會再次丟棄**在問題中出現的任何序號、UUID 或個人資產標籤。

---

## 🚀 給發送個人資料的人

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| 選項 | 描述 |
|-------|-----------|
| `-n`, `--name <nome>` | 配置檔名稱 (預設: `fabricante-modelo`) |
| `-s`, `--save-only` | 只生成本地檔案，不發送 |
| `-y`, `--yes` | 不問任何事情（確認一切） |
| `--nocolor` | 無色輸出 |
| `-V`, `--version` | 顯示版本 |
| `-h`, `--help` | 顯示幫助 |

**個人資料的位置:**
- `~/.config/chili-fr/machines/<nome>.conf`，準備好與 `chili-fr -M <nome>` 一起使用。使用 `sudo` 或 `doas` 運行時，它會移至呼叫命令者的主目錄。
- 在**剪貼簿**中，當有 `wl-copy`（Wayland）或 `xclip`/`xsel`（X11）時。

**運送方式如何運作：**
- **安裝並登入 `gh` 後：** 該問題會直接從終端機建立。
- **無 `gh`:** 該指令會顯示一個已填寫好的 issue 連結，並且如果安裝了 `qrencode`，還會顯示可用手機掃描的 QR 碼。需要登入 GitHub，因為它不接受匿名 issue。
- **沒有 GitHub 帳號？** 將已複製到剪貼簿的個人檔案貼到與維護者在 Telegram 的對話或電子郵件中。如果願意，也可以發送 `.conf` 檔案。

---

## 🧰 給維護者：`tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

在匯入時，他會在每一步之前詢問：

1. 下載該問題，提取 `conf` 區塊並**清理**配置文件：去除多餘空格，移除未知鍵值，丟棄個人資料。
2. **有效** 遵循 chili-fr 相同的規則：真實的製造商和型號、底盤類型、CPU 型號、核心數、記憶體、磁碟匯流排、UEFI、BIOS 日期及視訊裝置。也拒絕控制字元和過長的文字。
3. 如果機器**已經註冊**（相同製造商、型號和 BIOS 版本）則提醒。
4. 儲存到 `usr/share/chili-fr/machines/<nome>.conf`，並在標題中標明來源（問題編號及發送者）。
5. 在 `main` 上做 **提交和推送**。
6. **評論並關閉** 該議題。

需要已登入的 `gh` 和 `jq`。

**GitHub Actions：** 工作流程 `.github/workflows/import-machine-profile.yml` 對 `-y` 執行相同的過程。目前它只能手動運行（Actions → *匯入機器設定檔* → *運行工作流程*）。如果設定檔無效，它會在 issue 中註明錯誤，不會進行匯入。要在 issue 被加上標籤 `aprovado` 時自動匯入，請取消註解工作流程中的 `issues:` 區塊。

---

## 🖥️ 在 chili-fr 使用檔案

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

O `chili-fr` 會查找 `~/.config/chili-fr/machines/`（使用者）的配置檔，以及 `/usr/share/chili-fr/machines/`（隨套件提供的配置檔）。Bash 的自動完成會用 `chili-fr -M <Tab>` 補全名稱。

在虛擬機中的變化:
- **身份識別 (SMBIOS/DMI):** 客體系統看到的是實際機器的製造商、型號、BIOS、主機板及**機箱類型**。機箱類型會放在 SMBIOS 二進位表中，因為 QEMU 不允許以其他方式設置此欄位。
- **處理器:** 使用與 QEMU 同一世代的模型 (`Penryn`, `Nehalem`, `IvyBridge`…), 不包含真實 CPU 所沒有的指令。例如，舊版 Core i3 沒有 AES，因此需要較新指令的程式在虛擬機中會像在實體電腦上一樣失敗。
- **磁碟與啟動：** 磁碟是以 SATA 或 NVMe 附加，因此安裝程式會看到 `/dev/sda` 或 `/dev/nvme0n1`，就像在實體機器上。啟動是 UEFI 或傳統 BIOS。

---

## 📄 個人資料格式

一個文字檔，每個欄位有一行 `chave="valor"`。以 `#` 開頭的行是註解。

| 鍵 | 範例 | 描述 |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | 在 `--list-machines` 中顯示的描述 |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | 系統識別 (SMBIOS 類型 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | 主機板 (SMBIOS 類型 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS 類型 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` 或數字 (1–36) | 底盤類型 |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | 底盤 (SMBIOS 類型 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU 的 CPU 型號 |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | 來賓看到的 CPU 名稱 |
| `smp` | `4` | 核心 |
| `mem` | `4G` | 記憶 |
| `video` | `VGA`, `virtio-vga-gl` | 視頻設備 |
| `net` | `e1000e` | 網路卡 |
| `disk_bus` | `virtio`, `sata`, `nvme` | 磁碟匯流排 |
| `uefi` | `true`, `false` | UEFI 或傳統 BIOS |

範例 (`lg-a410.conf`):

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

- **硬體仍是虛擬的：** 虛擬機呈現為實體機，但設備是 QEMU 的。電池、充電器和蓋子未被模擬。
- **空白欄位:** 檔案未填寫的欄位將獲得 QEMU 的預設值，例如 `Standard PC (Q35…)`。
- **CPU AMD 和非常新的** 使用 `cpu=host`，因為 QEMU 的 AMD 型號需要運行虛擬機的電腦有 AMD 處理器。

---

## 🤝 貢獻

有不同的電腦，無論是舊筆記型電腦、辦公室桌上型電腦還是帶有傳統 BIOS 的機器？運行 `chili-machine-hwreport` 並發送配置檔。每台新機器都能幫助在實際硬體上測試 VoidBR。
