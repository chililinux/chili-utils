# 🌶️ chili-machine-hwreport

**chili-machine-hwreport** gera o **perfil da sua máquina**: um pequeno arquivo de texto com fabricante, modelo, BIOS, chassi e hardware. Depois ele envia o perfil ao mantenedor do VoidBR por uma issue no GitHub.

Com esses perfis, o **chili-fr** consegue simular, numa máquina virtual (QEMU), a instalação do VoidBR em computadores reais dos usuários: notebooks antigos, desktops de escritório, máquinas com BIOS legado ou UEFI. Assim os problemas aparecem antes de chegar até você.

---

## 📦 Sobre

- **Autor:** Vilmar Catafesta
- **Licença:** MIT
- **Ferramentas envolvidas:**
  - `chili-machine-hwreport`: gera e envia o perfil. É quem o usuário roda.
  - `chili-fr`: usa o perfil para simular a máquina no QEMU (`-M`).
  - `tools/chili-machine-import`: valida e importa o perfil enviado. É ferramenta do mantenedor e não vai no pacote.
- **Compatibilidade:** qualquer Linux com `/sys/class/dmi/id`, inclusive um live USB. Só precisa de `bash`.

---

## 🔄 O processo, do começo ao fim

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

**1. Na sua máquina: `chili-machine-hwreport`**
O comando lê as informações de identificação do computador, as mesmas que o Linux mostra em `/sys/class/dmi/id`: fabricante, modelo, BIOS, placa-mãe e tipo de chassi (notebook, desktop…). Lê também o processador, a quantidade de núcleos, a memória, o tipo de disco (SATA ou NVMe) e o modo de boot (UEFI ou BIOS legado). Com isso ele monta o **perfil da máquina** (`.conf`).

**2. O envio: issue no GitHub**
O comando abre (ou mostra o link e o QR code de) uma issue `[perfil-maquina]` já preenchida no repositório `chililinux/chili-utils`. É só clicar em **Submit new issue**.

**3. A conferência e a importação**
O mantenedor revisa o perfil, que passa por uma validação automática: fabricante e modelo reais, valores dentro do esperado, nenhum dado pessoal e nenhuma máquina repetida. Depois ele é incluído em `usr/share/chili-fr/machines/`, com um nome como `lenovo-ideapad-s145-15iil`. Nesse momento a issue recebe um comentário e é fechada.

**4. O uso: `chili-fr -M`**
A VM passa a se apresentar **como a sua máquina**: mesmo fabricante, modelo, BIOS e tipo de chassi, processador da mesma geração e o mesmo tipo de disco e de boot.

---

## 🔒 Privacidade

✅ **Não precisa de root.** O comando nunca lê os campos protegidos do DMI.
✅ **Serial, UUID e MAC nunca** são lidos nem enviados.
✅ **Asset tag** só entra quando é texto de fábrica ("No Asset Tag"…). Alguns notebooks guardam ali o nome do dono.
✅ **Antes de enviar**, mostra tudo o que vai sair e pede confirmação.
✅ **A importação descarta** de novo qualquer serial, UUID ou asset tag pessoal que apareça na issue.

---

## 🚀 Para quem envia o perfil

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| Opção | Descrição |
|-------|-----------|
| `-n`, `--name <nome>` | nome do perfil (padrão: `fabricante-modelo`) |
| `-s`, `--save-only` | só gera o arquivo local, não envia |
| `-y`, `--yes` | não pergunta nada (confirma tudo) |
| `--nocolor` | saída sem cores |
| `-V`, `--version` | exibe a versão |
| `-h`, `--help` | exibe a ajuda |

**Onde o perfil fica:**
- `~/.config/chili-fr/machines/<nome>.conf`, pronto para usar com `chili-fr -M <nome>`. Rodando com `sudo` ou `doas`, ele vai para o home de quem chamou o comando.
- Na **área de transferência**, quando há `wl-copy` (Wayland) ou `xclip`/`xsel` (X11).

**Como o envio funciona:**
- **Com `gh` instalado e logado:** a issue é criada direto pelo terminal.
- **Sem `gh`:** o comando mostra um link de issue já preenchido e, com `qrencode` instalado, um QR code para enviar pelo celular. É preciso estar logado no GitHub, porque ele não aceita issues anônimas.
- **Sem conta no GitHub?** Cole o perfil, que já está na área de transferência, numa conversa com o mantenedor no Telegram ou num e-mail. Se preferir, envie o arquivo `.conf`.

---

## 🧰 Para o mantenedor: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

Ao importar, ele pergunta antes de cada passo:

1. Baixa a issue, extrai o bloco `conf` e **limpa** o perfil: tira espaços sobrando, remove chaves desconhecidas e descarta dados pessoais.
2. **Valida** com as mesmas regras do chili-fr: fabricante e modelo reais, tipo de chassi, modelo de CPU, núcleos, memória, barramento de disco, UEFI, data do BIOS e dispositivo de vídeo. Também recusa caracteres de controle e textos longos demais.
3. Avisa se a máquina **já está cadastrada** (mesmo fabricante, modelo e versão de BIOS).
4. Salva em `usr/share/chili-fr/machines/<nome>.conf`, com a fonte no cabeçalho (número da issue e quem enviou).
5. Faz **commit e push** no `main`.
6. **Comenta e fecha** a issue.

Precisa do `gh` logado e do `jq`.

**GitHub Actions:** o workflow `.github/workflows/import-machine-profile.yml` faz o mesmo processo com `-y`. Por enquanto ele só roda manualmente (Actions → *Importar perfil de máquina* → *Run workflow*). Se o perfil for inválido, ele comenta na issue o que está errado e não importa. Para importar automaticamente quando o rótulo `aprovado` for posto numa issue, descomente o bloco `issues:` do workflow.

---

## 🖥️ Usando os perfis no chili-fr

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

O `chili-fr` procura os perfis em `~/.config/chili-fr/machines/` (do usuário) e em `/usr/share/chili-fr/machines/` (os que vêm com o pacote). O completion do bash completa os nomes com `chili-fr -M <Tab>`.

O que muda na VM:
- **Identidade (SMBIOS/DMI):** o sistema convidado vê o fabricante, o modelo, o BIOS, a placa e o **tipo de chassi** da máquina real. O tipo de chassi vai numa tabela SMBIOS binária, porque o QEMU não permite definir esse campo de outro jeito.
- **Processador:** usa o modelo do QEMU da mesma geração (`Penryn`, `Nehalem`, `IvyBridge`…), sem instruções que a CPU real não tinha. Por exemplo, os Core i3 antigos vêm sem AES, então um programa que exija instruções mais novas falha na VM como falharia na máquina.
- **Disco e boot:** o disco é anexado como SATA ou NVMe, então o instalador vê `/dev/sda` ou `/dev/nvme0n1`, como na máquina real. O boot é UEFI ou BIOS legado.

---

## 📄 Formato do perfil

Um arquivo de texto com uma linha `chave="valor"` para cada campo. Linhas começando com `#` são comentários.

| Chave | Exemplo | Descrição |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | descrição exibida em `--list-machines` |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | identificação do sistema (SMBIOS tipo 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | placa-mãe (SMBIOS tipo 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS tipo 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` ou o número (1–36) | tipo de chassi |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | chassi (SMBIOS tipo 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | modelo de CPU do QEMU |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | nome da CPU visto pelo convidado |
| `smp` | `4` | núcleos |
| `mem` | `4G` | memória |
| `video` | `VGA`, `virtio-vga-gl` | dispositivo de vídeo |
| `net` | `e1000e` | placa de rede |
| `disk_bus` | `virtio`, `sata`, `nvme` | barramento do disco |
| `uefi` | `true`, `false` | UEFI ou BIOS legado |

Exemplo (`lg-a410.conf`):

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

## ⚠️ Limitações

- **Hardware continua virtual:** a VM se apresenta como a máquina, mas os dispositivos são os do QEMU. Bateria, carregador e tampa não são emulados.
- **Campos vazios:** o que o perfil não preenche recebe o valor padrão do QEMU, por exemplo `Standard PC (Q35…)`.
- **CPUs AMD e muito novas** usam `cpu=host`, porque os modelos AMD do QEMU exigem um processador AMD no computador que roda a VM.

---

## 🤝 Contribua

Tem um computador diferente, seja um notebook antigo, um desktop de escritório ou uma máquina com BIOS legado? Rode `chili-machine-hwreport` e envie o perfil. Cada máquina nova ajuda a testar o VoidBR em hardware real.
