# 🌶️ チリマシンハードウェアレポート

**chili-machine-hwreport** は **あなたのマシンのプロファイル** を生成します：メーカー、モデル、BIOS、シャーシ、ハードウェアを含む小さなテキストファイルです。その後、プロファイルは GitHub の issue を通じて VoidBR のメンテナ担当者に送信されます。

これらのプロファイルを使うことで、**chili-fr** は仮想マシン（QEMU）上で、ユーザーの実際のコンピュータ（古いノートパソコン、オフィスデスクトップ、レガシーBIOSまたはUEFI搭載のマシン）に VoidBR をインストールする動作をシミュレートできます。こうして問題はあなたの元に届く前に現れます。

---

## 📦 について

- **著者:** ヴィルマール・カタフェスタ
- **ライセンス:** MIT
- **関与するツール:**
  - `chili-machine-hwreport`: プロフィールを生成して送信します。それはユーザーが実行するものです。
  - `chili-fr`: QEMUでマシンをシミュレートするためにプロファイルを使用します (`-M`)。
  - `tools/chili-machine-import`: 送信されたプロファイルを検証してインポートします。これは管理者用ツールであり、パッケージには含まれません。
- **互換性:** `/sys/class/dmi/id`を搭載した任意のLinux、ライブUSBも含む。`bash`だけが必要です。

---

## 🔄 プロセス、最初から最後まで

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

**1. あなたのマシンで: `chili-machine-hwreport`**
このコマンドはコンピュータの識別情報を読み取ります。Linux が `/sys/class/dmi/id` で表示するものと同じで、製造元、モデル、BIOS、マザーボード、筐体の種類（ノートパソコン、デスクトップなど）を確認します。また、プロセッサ、コア数、メモリ、ディスクの種類（SATA または NVMe）、ブートモード（UEFI またはレガシ BIOS）も読み取ります。これにより、**マシンのプロファイル** を構築します（`.conf`）。

**2. 送信: GitHubのissue*
このコマンドは、リポジトリ`chililinux/chili-utils`ですでに記入されている`[perfil-maquina]`のイシューを開く（またはリンクとQRコードを表示する）ものです。**Submit new issue**をクリックするだけです。

**3. 会議と輸入**
メンテナーはプロフィールを確認し、次の自動検証を行います：実際のメーカーとモデル、予想範囲内の値、個人情報がないこと、重複するマシンがないこと。その後、プロフィールは `usr/share/chili-fr/machines/` に、`lenovo-ideapad-s145-15iil` のような名前で登録されます。その時点で、イシューにはコメントが追加され、閉じられます。

**4. 使用方法: `chili-fr -M`**
VMは**自分のマシン**として表示されるようになります: 同じメーカー、モデル、BIOSとシャーシタイプ、同世代のプロセッサ、同じタイプのディスクとブート。

---

## 🔒 プライバシー

✅ **ルート権限は不要です。** このコマンドはDMIの保護されたフィールドを読むことは決してありません。
✅ **シリアル、UUID、MAC は決して** 読まれたり送信されたりすることはありません。
✅ **アセットタグ** は、工場出荷時のテキスト（「No Asset Tag」…）の場合にのみ入力されます。一部のノートパソコンではそこに所有者の名前が保存されます。
✅ **送信する前に**、送信されるすべてを表示し、確認を求めます。
✅ **インポートは** またしても、issue に現れた任意のシリアル、UUID、または資産タグを破棄します。

---

## 🚀 プロフィールを送る人へ

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| オプション | 説明 |
|-------|-----------|
| `-n`、`--name <nome>` | プロフィール名（デフォルト：`fabricante-modelo`） |
| `-s`, `--save-only` | ローカルファイルのみ生成し、送信しません |
| `-y`, `--yes` | 何も質問しない（すべて確認する） |
| `--nocolor` | 色なしの出力 |
| `-V`、`--version` | バージョンを表示 |
| `-h`, `--help` | ヘルプを表示 |

**プロフィールはどこにありますか:**
- `~/.config/chili-fr/machines/<nome>.conf`、`chili-fr -M <nome>`と一緒に使用する準備ができています。`sudo`または`doas`で実行すると、コマンドを呼び出した人のホームに移動します。
- クリップボードでは、`wl-copy`（Wayland）または`xclip`/`xsel`（X11）がある場合。

**発送の仕組み:**
- **`gh` がインストールされてログインされた状態で:** 問題はターミナルから直接作成されます。
- **`gh`なし:** コマンドはすでに入力されたissueのリンクを表示し、`qrencode`がインストールされている場合は、携帯電話で送信するためのQRコードを表示します。匿名のissueは受け付けないため、GitHubにログインしている必要があります。
- **GitHubアカウントはお持ちですか？** コピーしたプロフィール（すでにクリップボードにあります）を、Telegramでメンテナーとの会話やメールに貼り付けてください。希望する場合は、`.conf`ファイルを送信してください。

---

## 🧰 メンテナのために: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

インポートする際、各ステップの前に確認を求めます：

1. イシューをダウンロードし、`conf` ブロックを抽出して、**プロフィールをクリーン**にします：余分なスペースを削除し、不明なキーを取り除き、個人データを破棄します。
2. **有効**: chili-fr と同じルールに従います: 実際の製造元とモデル、シャーシのタイプ、CPU モデル、コア数、メモリ、ディスクバス、UEFI、BIOS の日付、ビデオデバイス。また、制御文字や長すぎるテキストも拒否します。
3. 機械が**すでに登録されているか**どうかを知らせてください（同じメーカー、モデル、BIOSバージョンの場合）。
4. `usr/share/chili-fr/machines/<nome>.conf` に保存し、ヘッダーにフォント（イシュー番号と送信者）を記載します。
5. `main` に **コミットとプッシュ** してください。
6. **コメントしてクローズ**してください。

`gh`にログインして、`jq`が必要です。

**GitHub Actions:** ワークフロー `.github/workflows/import-machine-profile.yml` は `-y` と同じプロセスを実行します。現時点では手動でのみ実行されます（Actions → *マシンプロファイルをインポート* → *Run workflow*）。プロファイルが無効な場合、問題に何が間違っているかコメントし、インポートはされません。issue に `aprovado` のラベルが付いたときに自動的にインポートするには、ワークフローの `issues:` ブロックのコメントアウトを解除してください。

---

## 🖥️ chili-frでプロファイルを使用する

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr` は `~/.config/chili-fr/machines/`（ユーザーの）および `/usr/share/chili-fr/machines/`（パッケージに付属するもの）のプロファイルを検索します。bash の補完は名前を `chili-fr -M <Tab>` で補完します。

VMで変更されること:
- **ID（SMBIOS/DMI）:** ゲストシステムは、実際のマシンのメーカー、モデル、BIOS、マザーボード、および**シャーシタイプ**を認識します。シャーシタイプはSMBIOSのバイナリテーブルに入ります。なぜなら、QEMUではこのフィールドを他の方法で設定できないからです。
- **プロセッサ:** 同世代のQEMUモデル（`Penryn`、`Nehalem`、`IvyBridge`…）を使用し、実際のCPUに存在しない命令は含まれていません。例えば、古いCore i3にはAESが搭載されていないため、新しい命令を必要とするプログラムは、実際のマシンで失敗するのと同様にVM上でも失敗します。
- **ディスクとブート:** ディスクはSATAまたはNVMeとして接続されるため、インストーラーは実際のマシンと同様に`/dev/sda`または`/dev/nvme0n1`を認識します。ブートはUEFIまたはレガシーBIOSです。

---

## 📄 プロフィール形式

各フィールドについて1行の `chave="valor"` を含むテキストファイル。`#` で始まる行はコメントです。

| キー | 例 | 説明 |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | `--list-machines` に表示される説明 |
| `vendor`、`product`、`version`、`family`、`sku` | `LG Electronics`、`A410-G.BC44P1` | システム識別 (SMBIOS タイプ 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | マザーボード（SMBIOSタイプ2） |
| `bios_vendor`、`bios_version`、`bios_date` | `INSYDE`、`QL7L3F92`、`03/14/2011` | BIOS（SMBIOS タイプ 0） |
| `chassis_type` | `notebook`、`laptop`、`desktop`、`convertible`、`minipc`、`other` または番号（1–36） | シャーシの種類 |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | シャーシ (SMBIOS タイプ3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU の CPU モデル |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | ゲストから見たCPUの名前 |
| `smp` | `4` | 核 |
| `mem` | `4G` | メモリ |
| `video` | `VGA`、`virtio-vga-gl` | ビデオデバイス |
| `net` | `e1000e` | ネットワークカード |
| `disk_bus` | `virtio`, `sata`, `nvme` | ディスクバス |
| `uefi` | `true`, `false` | UEFI またはレガシー BIOS |

例 (`lg-a410.conf`):

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

## ⚠️ 制限

- **ハードウェアは仮想のまま:** 仮想マシンは実際のマシンのように表示されますが、デバイスは QEMU のものです。バッテリー、充電器、カバーはエミュレートされていません。
- **空欄フィールド:** プロファイルが入力しない項目には QEMU のデフォルト値が適用されます。例えば `Standard PC (Q35…)` です。
- **非常に新しいAMD CPU**は`cpu=host`を使用します。なぜなら、QEMUのAMDモデルはVMを実行するコンピュータにAMDプロセッサを要求するからです。

---

## 🤝 貢献する

異なるコンピュータ、古いノートパソコン、オフィス用デスクトップ、またはレガシーBIOS搭載のマシンがありますか？`chili-machine-hwreport`を実行してプロファイルを送信してください。新しいマシンはそれぞれ、実際のハードウェアでVoidBRのテストに役立ちます。
