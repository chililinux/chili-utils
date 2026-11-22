# 🌶️ rapporto-hardware-della-macchina-peperoncino

**chili-machine-hwreport** genera il **profilo della tua macchina**: un piccolo file di testo con produttore, modello, BIOS, chassis e hardware. Poi invia il profilo al manutentore di VoidBR tramite una issue su GitHub.

Con questi profili, il **chili-fr** riesce a simulare, in una macchina virtuale (QEMU), l'installazione di VoidBR sui computer reali degli utenti: portatili vecchi, desktop da ufficio, macchine con BIOS legacy o UEFI. In questo modo i problemi appaiono prima di arrivare a te.

---

## 📦 Informazioni

- **Autore:** Vilmar Catafesta
- **Licenza:** MIT
- **Strumenti coinvolti:**
  - `chili-machine-hwreport`: genera e invia il profilo. È chi lo esegue l'utente.
  - `chili-fr`: usa il profilo per simulare la macchina su QEMU (`-M`).
  - `tools/chili-machine-import`: convalida e importa il profilo inviato. È uno strumento del manutentore e non va nel pacchetto.
- **Compatibilità:** qualsiasi Linux con `/sys/class/dmi/id`, incluso un live USB. Serve solo `bash`.

---

## 🔄 Il processo, dall'inizio alla fine

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

**1. Sul suo computer: `chili-machine-hwreport`**
Il comando legge le informazioni di identificazione del computer, le stesse che Linux mostra in `/sys/class/dmi/id`: produttore, modello, BIOS, scheda madre e tipo di chassis (notebook, desktop…). Legge anche il processore, il numero di core, la memoria, il tipo di disco (SATA o NVMe) e la modalità di avvio (UEFI o BIOS legacy). Con questo costruisce il **profilo della macchina** (`.conf`).

**2. L'invio: issue su GitHub**
Il comando apre (o mostra il link e il codice QR di) un issue `[perfil-maquina]` già compilata nel repository `chililinux/chili-utils`. Basta cliccare su **Submit new issue**.

**3. La conferenza e l'importazione**
Il manutentore controlla il profilo, che passa attraverso una convalida automatica: produttore e modello reali, valori entro l'atteso, nessun dato personale e nessuna macchina ripetuta. Poi viene incluso in `usr/share/chili-fr/machines/`, con un nome come `lenovo-ideapad-s145-15iil`. In quel momento l'issue riceve un commento ed è chiusa.

**4. L'uso: `chili-fr -M`**
La VM inizia a presentarsi **come la tua macchina**: stesso produttore, modello, BIOS e tipo di chassis, processore della stessa generazione e stesso tipo di disco e di avvio.

---

## 🔒 Privacy

✅ **Non serve il root.** Il comando non legge mai i campi protetti del DMI.
✅ **Serial, UUID e MAC non** vengono mai letti né inviati.
✅ **Asset tag** entra solo quando è testo di fabbrica ("No Asset Tag"…). Alcuni notebook conservano lì il nome del proprietario.
✅ **Prima di inviare**, mostra tutto ciò che uscirà e chiedi conferma.
✅ **L'importazione scarta** di nuovo qualsiasi seriale, UUID o tag di asset personale che appare nella issue.

---

## 🚀 Per chi invia il profilo

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Opzione | Descrizione |
|-------|-----------|
| `-n`, `--name <nome>` | nome del profilo (predefinito: `fabricante-modelo`) |
| `-s`, `--save-only` | genera solo il file locale, non invia |
| `-y`, `--yes` | non fare domande (conferma tutto) |
| `--nocolor` | uscita senza colori |
| `-V`, `--version` | mostra la versione |
| `-h`, `--help` | mostra l'aiuto |

**Dove si trova il profilo:**
- `~/.config/chili-fr/machines/<nome>.conf`, pronto all'uso con `chili-fr -M <nome>`. Funzionando con `sudo` o `doas`, va alla home di chi ha chiamato il comando.
- Nell'**area degli appunti**, quando c'è `wl-copy` (Wayland) o `xclip`/`xsel` (X11).

**Come funziona la spedizione:**
- **Con `gh` installato e connesso:** il problema viene creato direttamente dal terminale.
- **Senza `gh`:** il comando mostra un link di issue già compilato e, con `qrencode` installato, un QR code da inviare tramite cellulare. È necessario essere loggati su GitHub, perché non accetta issue anonime.
- **Non hai un account GitHub?** Incolla il profilo, già negli appunti, in una conversazione con il manutentore su Telegram o in una e-mail. Se preferisci, invia il file `.conf`.

---

## 🧰 Per il manutentore: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

Quando importa, chiede prima di ogni passaggio:

1. Scarica l'issue, estrai il blocco `conf` e **pulisci** il profilo: rimuovi spazi superflui, elimina chiavi sconosciute e scarta dati personali.
2. **Valida** con le stesse regole del chili-fr: produttore e modello reali, tipo di chassis, modello di CPU, core, memoria, bus del disco, UEFI, data del BIOS e dispositivo video. Rifiuta anche caratteri di controllo e testi troppo lunghi.
3. Avvisa se la macchina **è già registrata** (stesso produttore, modello e versione del BIOS).
4. Salva in `usr/share/chili-fr/machines/<nome>.conf`, con la fonte nell'intestazione (numero della issue e chi l'ha inviata).
5. Esegui **commit e push** su `main`.
6. **Commenta e chiudi** la issue.

È necessario essere loggati in `gh` e in `jq`.

**GitHub Actions:** il workflow `.github/workflows/import-machine-profile.yml` esegue lo stesso processo con `-y`. Per ora viene eseguito solo manualmente (Actions → *Importa profilo macchina* → *Esegui workflow*). Se il profilo non è valido, commenta sull'issue cosa c'è di sbagliato e non importa. Per importare automaticamente quando l'etichetta `aprovado` viene applicata a un'issue, decommentare il blocco `issues:` del workflow.

---

## 🖥️ Usando i profili su chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

Il `chili-fr` cerca i profili in `~/.config/chili-fr/machines/` (dell'utente) e in `/usr/share/chili-fr/machines/` (quelli forniti con il pacchetto). Il completamento del bash completa i nomi con `chili-fr -M <Tab>`.

Cosa cambia nella VM:
- **Identità (SMBIOS/DMI):** il sistema guest vede il produttore, il modello, il BIOS, la scheda e il **tipo di chassis** della macchina reale. Il tipo di chassis va in una tabella SMBIOS binaria, perché QEMU non permette di definire questo campo in altro modo.
- **Processore:** usa il modello del QEMU della stessa generazione (`Penryn`, `Nehalem`, `IvyBridge`…), senza istruzioni che la CPU reale non aveva. Ad esempio, i vecchi Core i3 non hanno AES, quindi un programma che richiede istruzioni più recenti fallisce nella VM come fallirebbe sulla macchina.
- **Disco e avvio:** il disco è collegato come SATA o NVMe, quindi l'installatore vede `/dev/sda` o `/dev/nvme0n1`, come nella macchina reale. L'avvio è UEFI o BIOS legacy.

---

## 📄 Formato del profilo

Un file di testo con una linea `chave="valor"` per ogni campo. Le linee che iniziano con `#` sono commenti.

| Chiave | Esempio | Descrizione |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | descrizione visualizzata in `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | identificazione del sistema (SMBIOS tipo 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | scheda madre (SMBIOS tipo 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS tipo 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` o il numero (1–36) | tipo di telaio |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | telaio (SMBIOS tipo 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | modello di CPU di QEMU |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | nome della CPU visto dall'ospite |
| `smp` | `4` | nuclei |
| `mem` | `4G` | memoria |
| `video` | `VGA`, `virtio-vga-gl` | dispositivo video |
| `net` | `e1000e` | scheda di rete |
| `disk_bus` | `virtio`, `sata`, `nvme` | bus del disco |
| `uefi` | `true`, `false` | UEFI o BIOS legacy |

Esempio (`lg-a410.conf`):

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

## ⚠️ Limitazioni

- **Hardware continua virtuale:** una VM si presenta come la macchina, ma i dispositivi sono quelli del QEMU. Batteria, caricatore e coperchio non sono emulati.
- **Campi vuoti:** ciò che il profilo non compila riceve il valore predefinito di QEMU, ad esempio `Standard PC (Q35…)`.
- **CPU AMD e molto nuove** usano `cpu=host`, perché i modelli AMD di QEMU richiedono un processore AMD nel computer che esegue la VM.

---

## 🤝 Contribuisci

Hai un computer diverso, sia un notebook vecchio, un desktop da ufficio o una macchina con BIOS legacy? Esegui `chili-machine-hwreport` e invia il profilo. Ogni nuova macchina aiuta a testare VoidBR su hardware reale.
