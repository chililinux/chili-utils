# 🌶️ Chili-Maschine-HW-Bericht

**chili-machine-hwreport** erstellt das **Profil Ihres Geräts**: eine kleine Textdatei mit Hersteller, Modell, BIOS, Gehäuse und Hardware. Anschließend sendet es das Profil an den Maintainer von VoidBR über ein GitHub-Issue.

Mit diesen Profilen kann **chili-fr** die Installation von VoidBR auf realen Computern der Benutzer simulieren, in einer virtuellen Maschine (QEMU): alte Notebooks, Büro-Desktops, Maschinen mit Legacy-BIOS oder UEFI. So treten die Probleme auf, bevor sie Sie erreichen.

---

## 📦 Über

- **Autor:** Vilmar Catafesta
- **Lizenz:** MIT
- **Beteiligte Werkzeuge:**
  - `chili-machine-hwreport`: erzeugt und sendet das Profil. Es ist, wer vom Benutzer ausgeführt wird.
  - `chili-fr`: Verwenden Sie das Profil, um die Maschine im QEMU (`-M`) zu simulieren.
  - `tools/chili-machine-import`: validiert und importiert das gesendete Profil. Es ist ein Werkzeug des Wartungsprogramms und wird nicht in das Paket aufgenommen.
- **Kompatibilität:** jedes Linux mit `/sys/class/dmi/id`, einschließlich eines Live-USBs. Es wird nur `bash` benötigt.

---

## 🔄 Der Prozess, von Anfang bis Ende

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

**1. Auf Ihrem Gerät: `chili-machine-hwreport`**
Der Befehl liest die Identifikationsinformationen des Computers, dieselben, die Linux unter `/sys/class/dmi/id` anzeigt: Hersteller, Modell, BIOS, Hauptplatine und Gehäusetyp (Notebook, Desktop…). Er liest auch den Prozessor, die Anzahl der Kerne, den Speicher, den Festplattentyp (SATA oder NVMe) und den Bootmodus (UEFI oder Legacy-BIOS). Damit erstellt er das **Maschinenprofil** (`.conf`).

**2. Der Versand: Issue auf GitHub**
Der Befehl öffnet (oder zeigt den Link und den QR-Code von) einem bereits ausgefüllten Issue `[perfil-maquina]` im Repository `chililinux/chili-utils`. Einfach auf **Submit new issue** klicken.

**3. Die Konferenz und der Import*
Der Maintainer überprüft das Profil, das einer automatischen Validierung unterzogen wird: tatsächlicher Hersteller und Modell, Werte im erwarteten Bereich, keine persönlichen Daten und keine duplizierten Geräte. Danach wird es in `usr/share/chili-fr/machines/` aufgenommen, mit einem Namen wie `lenovo-ideapad-s145-15iil`. In diesem Moment erhält das Issue einen Kommentar und wird geschlossen.

**4. Die Verwendung: `chili-fr -M`**
Die VM präsentiert sich **wie Ihr eigener Computer**: derselbe Hersteller, dasselbe Modell, dasselbe BIOS und Gehäusetyp, Prozessor derselben Generation und derselbe Festplattentyp und Boottyp.

---

## 🔒 Privatsphäre

✅ **Kein Root erforderlich.** Der Befehl liest niemals die geschützten DMI-Felder.
✅ **Seriennummer, UUID und MAC werden niemals** gelesen oder gesendet.
✅ **Asset-Tag** erscheint nur, wenn es sich um Fabriktext handelt ("No Asset Tag"…). Einige Notebooks speichern dort den Namen des Besitzers.
✅ **Bevor du es abschickst**, zeige alles, was rausgeht, und bitte um Bestätigung.
✅ **Der Import verwirft** erneut jede Seriennummer, UUID oder persönliche Asset-Tag, die im Issue erscheint.

---

## 🚀 Für diejenigen, die das Profil senden

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Option | Beschreibung |
|-------|-----------|
| `-n`, `--name <nome>` | Profilname (Standard: `fabricante-modelo`) |
| `-s`, `--save-only` | erzeugt nur die lokale Datei, sendet sie nicht |
| `-y`, `--yes` | fragt nichts (bestätigt alles) |
| `--nocolor` | Ausgabe ohne Farben |
| `-V`, `--version` | zeigt die Version |
| `-h`, `--help` | zeigt die Hilfe |

**Wo sich das Profil befindet:**
- `~/.config/chili-fr/machines/<nome>.conf`, einsatzbereit mit `chili-fr -M <nome>`. Läuft mit `sudo` oder `doas`, es geht zum Home des Aufrufers des Befehls.
- In der **Zwischenablage**, wenn es `wl-copy` (Wayland) oder `xclip`/`xsel` (X11) gibt.

**Wie der Versand funktioniert:**
- **Mit `gh` installiert und angemeldet:** wird das Issue direkt über das Terminal erstellt.
- **Ohne `gh`:** der Befehl zeigt einen bereits ausgefüllten Issue-Link an und, mit installiertem `qrencode`, einen QR-Code zum Versenden über das Handy. Man muss bei GitHub angemeldet sein, da anonyme Issues nicht akzeptiert werden.
- **Kein GitHub-Konto?** Fügen Sie das Profil, das bereits in der Zwischenablage ist, in ein Gespräch mit dem Maintainer auf Telegram oder in eine E-Mail ein. Wenn Sie möchten, senden Sie die Datei `.conf`.

---

## 🧰 Für den Betreuer: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

Beim Importieren fragt er vor jedem Schritt:

1. Lade das Issue herunter, extrahiere den Block `conf` und **säubere** das Profil: entferne überflüssige Leerzeichen, lösche unbekannte Schlüssel und verwirf persönliche Daten.
2. **Gültig** nach denselben Regeln wie chili-fr: echter Hersteller und Modell, Chassis-Typ, CPU-Modell, Kerne, Speicher, Festplattenbus, UEFI, BIOS-Datum und Videogerät. Akzeptiert auch keine Steuerzeichen und zu langen Texte.
3. Gib Bescheid, ob die Maschine **bereits registriert** ist (gleiches Herstellermodell, Modell und BIOS-Version).
4. Speichere in `usr/share/chili-fr/machines/<nome>.conf`, mit der Schrift im Kopfbereich (Ausgabenummer und wer gesendet hat).
5. Mache **Commit und Push** in `main`.
6. **Kommentiere und schließe** das Issue.

Es wird benötigt, dass `gh` eingeloggt ist und `jq`.

**GitHub Actions:** Der Workflow `.github/workflows/import-machine-profile.yml` führt denselben Prozess mit `-y` durch. Vorerst wird er nur manuell ausgeführt (Actions → *Maschinenprofil importieren* → *Workflow ausführen*). Wenn das Profil ungültig ist, kommentiert er in der Issue, was falsch ist, und importiert nicht. Um automatisch zu importieren, wenn das Label `aprovado` in einer Issue gesetzt wird, heben Sie den Kommentarblock `issues:` im Workflow auf.

---

## 🖥️ Verwendung der Profile auf chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr` sucht die Profile in `~/.config/chili-fr/machines/` (vom Benutzer) und in `/usr/share/chili-fr/machines/` (die mit dem Paket kommen). Die Bash-Vervollständigung ergänzt die Namen mit `chili-fr -M <Tab>`.

Was sich in der VM ändert:
- **Identität (SMBIOS/DMI):** Das Gastsystem sieht den Hersteller, das Modell, das BIOS, das Mainboard und den **Chassistyp** der realen Maschine. Der Chassistyp wird in einer binären SMBIOS-Tabelle angegeben, da QEMU dieses Feld auf keine andere Weise festlegen lässt.
- **Prozessor:** verwendet das QEMU-Modell derselben Generation (`Penryn`, `Nehalem`, `IvyBridge`…), ohne Anweisungen, die die echte CPU nicht hatte. Zum Beispiel kommen die alten Core i3 ohne AES, sodass ein Programm, das neuere Anweisungen erfordert, in der VM genauso fehlschlägt wie auf dem echten Rechner.
- **Festplatte und Boot:** Die Festplatte wird als SATA oder NVMe angehängt, dann sieht der Installer `/dev/sda` oder `/dev/nvme0n1`, wie bei der echten Maschine. Der Boot ist UEFI oder Legacy-BIOS.

---

## 📄 Profilformat

Eine Textdatei mit einer Zeile `chave="valor"` für jedes Feld. Zeilen, die mit `#` beginnen, sind Kommentare.

| Schlüssel | Beispiel | Beschreibung |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | Beschreibung angezeigt in `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | Systemidentifikation (SMBIOS Typ 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | Hauptplatine (SMBIOS Typ 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS Typ 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` oder die Nummer (1–36) | Fahrgestelltyp |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | Gehäuse (SMBIOS Typ 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU-CPU-Modell |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | vom Gast gesehener CPU-Name |
| `smp` | `4` | Kerne |
| `mem` | `4G` | Speicher |
| `video` | `VGA`, `virtio-vga-gl` | Videogerät |
| `net` | `e1000e` | Netzwerkkarte |
| `disk_bus` | `virtio`, `sata`, `nvme` | Plattenbus |
| `uefi` | `true`, `false` | UEFI oder Legacy-BIOS |

Beispiel (`lg-a410.conf`):

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

## ⚠️ Einschränkungen

- **Virtuelle Hardware fortgesetzt:** Die VM tritt als Maschine auf, aber die Geräte stammen von QEMU. Batterie, Ladegerät und Abdeckung werden nicht emuliert.
- **Leere Felder:** Was das Profil nicht ausfüllt, erhält den Standardwert von QEMU, zum Beispiel `Standard PC (Q35…)`.
- **Sehr neue AMD-CPUs** verwenden `cpu=host`, weil die AMD-Modelle von QEMU einen AMD-Prozessor im Computer erfordern, auf dem die VM läuft.

---

## 🤝 Beitrag leisten

Haben Sie einen anderen Computer, sei es ein altes Notebook, ein Büro-Desktop oder eine Maschine mit Legacy-BIOS? Führen Sie `chili-machine-hwreport` aus und senden Sie das Profil. Jeder neue Rechner hilft, VoidBR auf realer Hardware zu testen.
