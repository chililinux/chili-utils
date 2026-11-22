# 🌶️ machine-à-piment-rapport-matériel

**chili-machine-hwreport** génère le **profil de votre machine** : un petit fichier texte avec le fabricant, le modèle, le BIOS, le châssis et le matériel. Ensuite, il envoie le profil au mainteneur de VoidBR via une issue sur GitHub.

Avec ces profils, le **chili-fr** peut simuler, sur une machine virtuelle (QEMU), l'installation de VoidBR sur les ordinateurs réels des utilisateurs : anciens ordinateurs portables, ordinateurs de bureau, machines avec BIOS hérité ou UEFI. Ainsi, les problèmes apparaissent avant d'arriver jusqu'à vous.

---

## 📦 À propos

- **Auteur :** Vilmar Catafesta
- **Licence :** MIT
- **Outils impliqués :**
  - `chili-machine-hwreport` : génère et envoie le profil. C'est celui que l'utilisateur exécute.
  - `chili-fr` : utilise le profil pour simuler la machine dans QEMU (`-M`).
  - `tools/chili-machine-import` : valide et importe le profil envoyé. C'est un outil du mainteneur et il ne fait pas partie du paquet.
- **Compatibilité :** tout Linux avec `/sys/class/dmi/id`, y compris un live USB. Il suffit de `bash`.

---

## 🔄 Le processus, du début à la fin

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

**1. Sur votre machine : `chili-machine-hwreport`**
La commande lit les informations d'identification de l'ordinateur, les mêmes que Linux affiche dans `/sys/class/dmi/id` : fabricant, modèle, BIOS, carte mère et type de châssis (ordinateur portable, bureau…). Elle lit également le processeur, le nombre de cœurs, la mémoire, le type de disque (SATA ou NVMe) et le mode de démarrage (UEFI ou BIOS hérité). Avec cela, elle constitue le **profil de la machine** (`.conf`).

**2. L'envoi : problème sur GitHub*
La commande ouvre (ou affiche le lien et le code QR de) un problème `[perfil-maquina]` déjà rempli dans le dépôt `chililinux/chili-utils`. Il suffit de cliquer sur **Submit new issue**.

**3. La conférence et l'importation*
Le mainteneur révise le profil, qui passe par une validation automatique : fabricant et modèle réels, valeurs dans la norme, aucune donnée personnelle et aucune machine répétée. Ensuite, il est inclus dans `usr/share/chili-fr/machines/`, avec un nom comme `lenovo-ideapad-s145-15iil`. À ce moment, l'incident reçoit un commentaire et est fermé.

**4. L'utilisation : `chili-fr -M`**
La VM commence à se présenter **comme votre machine** : même fabricant, modèle, BIOS et type de châssis, processeur de la même génération et même type de disque et de démarrage.

---

## 🔒 Confidentialité

✅ **Aucun besoin de root.** La commande ne lit jamais les champs protégés du DMI.
✅ **Le numéro de série, l'UUID et l'adresse MAC ne** sont jamais lus ni envoyés.
✅ **Étiquette d'actif** n'apparaît que lorsque c'est du texte d'usine ("No Asset Tag"…). Certains ordinateurs portables y conservent le nom du propriétaire.
✅ **Avant d'envoyer**, montre tout ce qui va être envoyé et demande confirmation.
✅ **L'importation écarte** à nouveau tout numéro de série, UUID ou étiquette d'actif personnel apparaissant dans le problème.

---

## 🚀 Pour ceux qui envoient le profil

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Option | Description |
|-------|-----------|
| `-n`, `--name <nome>` | nom du profil (par défaut : `fabricante-modelo`) |
| `-s`, `--save-only` | ne génère que le fichier local, n'envoie pas |
| `-y`, `--yes` | ne pose aucune question (confirme tout) |
| `--nocolor` | sortie sans couleurs |
| `-V`, `--version` | affiche la version |
| `-h`, `--help` | affiche l'aide |

**Où se trouve le profil :**
- `~/.config/chili-fr/machines/<nome>.conf`, prêt à être utilisé avec `chili-fr -M <nome>`. Fonctionnant avec `sudo` ou `doas`, il va au home de celui qui a appelé la commande.
- Dans le **presse-papiers**, lorsqu'il y a `wl-copy` (Wayland) ou `xclip`/`xsel` (X11).

**Comment fonctionne l'expédition :**
- **Avec `gh` installé et connecté :** le problème est créé directement depuis le terminal.
- **Sans `gh` :** la commande affiche un lien vers un problème déjà rempli et, avec `qrencode` installé, un code QR à envoyer par téléphone. Il est nécessaire d'être connecté à GitHub, car il n'accepte pas les problèmes anonymes.
- **Pas de compte GitHub ?** Collez le profil, qui est déjà dans le presse-papiers, dans une conversation avec le mainteneur sur Telegram ou dans un e-mail. Si vous préférez, envoyez le fichier `.conf`.

---

## 🧰 Pour le mainteneur : `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

Lors de l'importation, il demande avant chaque étape :

1. Télécharge le ticket, extrait le bloc `conf` et **nettoie** le profil : supprime les espaces superflus, retire les clés inconnues et élimine les données personnelles.
2. **Valide** avec les mêmes règles que chili-fr : fabricant et modèle réels, type de châssis, modèle de CPU, cœurs, mémoire, bus de disque, UEFI, date du BIOS et périphérique vidéo. Rejette également les caractères de contrôle et les textes trop longs.
3. Avertit si la machine **est déjà enregistrée** (même fabricant, modèle et version du BIOS).
4. Enregistre dans `usr/share/chili-fr/machines/<nome>.conf`, avec la police dans l'en-tête (numéro du problème et qui l'a envoyé).
5. Fais un **commit et push** sur le `main`.
6. **Commente et ferme** le problème.

Vous avez besoin que `gh` soit connecté et de `jq`.

**GitHub Actions:** le workflow `.github/workflows/import-machine-profile.yml` effectue le même processus avec `-y`. Pour l'instant, il ne s'exécute que manuellement (Actions → *Importer le profil de la machine* → *Exécuter le workflow*). Si le profil est invalide, il commente dans l'issue ce qui est incorrect et n'importe pas. Pour importer automatiquement lorsque l'étiquette `aprovado` est placée sur une issue, décommentez le bloc `issues:` du workflow.

---

## 🖥️ Utilisation des profils sur chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

Le `chili-fr` recherche les profils dans `~/.config/chili-fr/machines/` (de l'utilisateur) et dans `/usr/share/chili-fr/machines/` (ceux fournis avec le paquet). Le complétion du bash complète les noms avec `chili-fr -M <Tab>`.

Ce qui change dans la VM :
- **Identité (SMBIOS/DMI) :** le système invité voit le fabricant, le modèle, le BIOS, la carte et le **type de châssis** de la machine réelle. Le type de châssis est dans un tableau SMBIOS binaire, car QEMU ne permet pas de définir ce champ autrement.
- **Processeur :** utilise le modèle QEMU de la même génération (`Penryn`, `Nehalem`, `IvyBridge`…), sans instructions que le CPU réel n’avait pas. Par exemple, les anciens Core i3 sont dépourvus d’AES, donc un programme nécessitant des instructions plus récentes échoue dans la VM comme il échouerait sur la machine.
- **Disque et démarrage :** le disque est attaché en SATA ou NVMe, donc l'installateur voit `/dev/sda` ou `/dev/nvme0n1`, comme sur la machine réelle. Le démarrage est UEFI ou BIOS hérité.

---

## 📄 Format du profil

Un fichier texte avec une ligne `chave="valor"` pour chaque champ. Les lignes commençant par `#` sont des commentaires.

| Clé | Exemple | Description |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | description affichée dans `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | identification du système (SMBIOS type 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | carte mère (SMBIOS type 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS type 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` ou le numéro (1–36) | type de châssis |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | châssis (SMBIOS type 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | modèle de CPU de QEMU |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | nom du CPU vu par l'invité |
| `smp` | `4` | noyaux |
| `mem` | `4G` | mémoire |
| `video` | `VGA`, `virtio-vga-gl` | appareil vidéo |
| `net` | `e1000e` | carte réseau |
| `disk_bus` | `virtio`, `sata`, `nvme` | bus du disque |
| `uefi` | `true`, `false` | UEFI ou BIOS hérité |

Exemple (`lg-a410.conf` ):

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

- **Matériel toujours virtuel :** une VM se présente comme la machine, mais les périphériques sont ceux de QEMU. La batterie, le chargeur et le capot ne sont pas émulés.
- **Champs vides :** ce que le profil ne remplit pas reçoit la valeur par défaut de QEMU, par exemple `Standard PC (Q35…)`.
- **Les CPU AMD et très récents** utilisent `cpu=host`, car les modèles AMD de QEMU nécessitent un processeur AMD dans l'ordinateur qui exécute la VM.

---

## 🤝 Contribuez

Vous avez un ordinateur différent, qu'il s'agisse d'un ancien notebook, d'un bureau de bureau ou d'une machine avec un BIOS hérité ? Exécutez `chili-machine-hwreport` et envoyez le profil. Chaque nouvelle machine aide à tester VoidBR sur du matériel réel.
