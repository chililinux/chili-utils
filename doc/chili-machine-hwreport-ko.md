# 🌶️ 칠리-머신-hw리포트

**chili-machine-hwreport**는 **귀하의 기계 프로필**을 생성합니다: 제조사, 모델, BIOS, 섀시 및 하드웨어가 포함된 작은 텍스트 파일입니다. 그 후 이 프로필을 GitHub의 이슈를 통해 VoidBR 유지 관리자에게 전송합니다.

이 프로필들을 사용하면, **chili-fr**는 가상 머신(QEMU)에서 사용자의 실제 컴퓨터에 VoidBR 설치를 시뮬레이션할 수 있습니다: 오래된 노트북, 사무용 데스크톱, 레거시 BIOS 또는 UEFI를 가진 기기들. 이렇게 하면 문제가 사용자에게 도달하기 전에 나타납니다.

---

## 📦 소개

- **저자:** Vilmar Catafesta
- **라이선스:** MIT
- **사용된 도구:**
  - `chili-machine-hwreport`: 프로필을 생성하고 전송합니다. 사용자가 실행하는 것입니다.
  - `chili-fr`: QEMU에서 기계를 시뮬레이션하기 위해 프로필을 사용합니다 (`-M`).
  - `tools/chili-machine-import`: 전송된 프로필을 검증하고 가져옵니다. 이는 유지보수자의 도구이며 패키지에는 포함되지 않습니다.
- **호환성:** `/sys/class/dmi/id`가 있는 모든 Linux, 라이브 USB 포함. `bash`만 필요합니다.

---

## 🔄 처음부터 끝까지의 과정

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

**1. 당신의 컴퓨터에서: `chili-machine-hwreport`**
이 명령은 컴퓨터의 식별 정보를 읽습니다. 이는 Linux가 `/sys/class/dmi/id`에 표시하는 정보와 동일하며, 제조사, 모델, BIOS, 메인보드, 섀시 유형(노트북, 데스크탑 등)을 포함합니다. 또한 프로세서, 코어 수, 메모리, 디스크 유형(SATA 또는 NVMe) 및 부팅 모드(UEFI 또는 레거시 BIOS)도 읽습니다. 이를 통해 **컴퓨터 프로필**(`.conf`)을 구성합니다.

**2. 발송: GitHub에 이슈**
명령은 `chililinux/chili-utils` 저장소에 이미 작성된 `[perfil-maquina]` 이슈를 열거나(또는 링크와 QR 코드를 보여줍니다). **Submit new issue**를 클릭하기만 하면 됩니다.

**3. 컨퍼런스 및 수입*
관리자는 프로필을 검토하며, 이는 자동 검증을 거칩니다: 실제 제조사와 모델, 예상 범위 내 값, 개인 정보 없음, 중복된 기기 없음. 그 후 프로필은 `usr/share/chili-fr/machines/`에 `lenovo-ideapad-s145-15iil`와 같은 이름으로 포함됩니다. 이때 이슈에는 댓글이 달리고 종료됩니다.

**4. 사용: `chili-fr -M`**
VM는 **자신의 머신**처럼 나타나기 시작합니다: 동일한 제조사, 모델, BIOS 및 섀시 유형, 동일 세대의 프로세서, 동일한 유형의 디스크와 부트입니다.

---

## 🔒 개인 정보

✅ **루트 권한이 필요 없습니다.** 이 명령은 DMI의 보호된 필드를 절대 읽지 않습니다.
✅ **시리얼, UUID 및 MAC은 절대** 읽히거나 전송되지 않습니다.
✅ **자산 태그**는 공장 텍스트("No Asset Tag"…)일 때만 들어갑니다. 일부 노트북은 거기에 소유자 이름을 저장합니다.
✅ **전송하기 전에**, 나갈 모든 것을 보여주고 확인을 요청하세요.
✅ **수입은** 문제에 나타나는 모든 개인 시리얼, UUID 또는 자산 태그를 다시 무시합니다.

---

## 🚀 프로필을 보내는 사람을 위해

```bash
chili-machine-hwreport          # gera, salva, copia e pergunta se envia
chili-machine-hwreport -s       # só gera e salva (não envia)
```

| 옵션 | 설명 |
|-------|-----------|
| `-n`, `--name <nome>` | 프로필 이름 (기본값: `fabricante-modelo`) |
| `-s`, `--save-only` | 단지 로컬 파일만 생성하며, 전송하지 않음 |
| `-y`, `--yes` | 아무 것도 묻지 않음 (모든 것을 확인함) |
| `--nocolor` | 무색 출력 |
| `-V`, `--version` | 버전을 표시합니다 |
| `-h`, `--help` | 도움말을 표시합니다 |

**프로필 위치:**
- `~/.config/chili-fr/machines/<nome>.conf`, `chili-fr -M <nome>`와 함께 사용할 준비가 되어 있습니다. `sudo` 또는 `doas`에서 실행하면 명령을 호출한 사람의 홈으로 이동합니다.
- 클립보드에서 `wl-copy` (Wayland) 또는 `xclip`/`xsel` (X11)가 있을 때.

**배송은 어떻게 작동하나요:**
- **`gh`가 설치되고 로그인된 상태에서:** 이 이슈는 터미널에서 바로 생성됩니다.
- **`gh` 없이:** 명령어는 이미 작성된 이슈 링크를 보여주고, `qrencode`가 설치되어 있으면 휴대폰으로 보낼 수 있는 QR 코드를 표시합니다. GitHub에 로그인되어 있어야 하는데, 익명 이슈는 허용되지 않기 때문입니다.
- **GitHub 계정이 없으신가요?** 프로필이 이미 클립보드에 있으니, 텔레그램에서 관리자와의 대화나 이메일에 붙여넣으세요. 원하신다면 `.conf` 파일을 보내셔도 됩니다.

---

## 🧰 유지보수 담당자용: `tools/chili-machine-import`

```bash
tools/chili-machine-import            # lista as issues [perfil-maquina] em aberto
tools/chili-machine-import -l -a      # lista todas, inclusive as fechadas
tools/chili-machine-import 2          # importa a issue #2
tools/chili-machine-import -s 2       # só gera o .conf da issue #2, para conferir
tools/chili-machine-import -n nome 2  # importa com outro nome de arquivo
```

가져올 때, 그는 각 단계마다 묻습니다:

1. 이슈를 내려받고, `conf` 블록을 추출한 후 프로필을 **정리**합니다: 남는 공백을 제거하고, 알 수 없는 키를 삭제하며, 개인 데이터를 버립니다.
2. **유효**: chili-fr와 동일한 규칙 적용: 실제 제조업체와 모델, 섀시 유형, CPU 모델, 코어 수, 메모리, 디스크 버스, UEFI, BIOS 날짜 및 비디오 장치. 또한 제어 문자와 너무 긴 텍스트도 거부합니다.
3. 기계가 **이미 등록되어 있는지**(같은 제조사, 모델 및 BIOS 버전) 알려줍니다.
4. `usr/share/chili-fr/machines/<nome>.conf`에 저장하며, 헤더에 소스(이슈 번호와 발신자)를 포함합니다.
5. `main`에 **커밋하고 푸시**하세요.
6. **댓글을 달고 닫으세요** 이 이슈를.

`gh`에 로그인되어 있고 `jq`가 필요합니다.

**GitHub Actions:** `.github/workflows/import-machine-profile.yml` 워크플로우는 `-y`와 동일한 과정을 수행합니다. 현재로서는 수동으로만 실행됩니다 (Actions → *Importar perfil de máquina* → *Run workflow*). 프로필이 유효하지 않으면 이슈에 무엇이 잘못되었는지 댓글을 달고 가져오지 않습니다. `aprovado` 라벨이 이슈에 붙었을 때 자동으로 가져오려면 워크플로우에서 `issues:` 블록의 주석을 제거하십시오.

---

## 🖥️ chili-fr에서 프로필 사용하기

```bash
chili-fr --list-machines                              # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2            # simula a instalação num LG A410
chili-fr -M asus-x200ma -m 4G voidbr.iso disco.qcow2  # as opções da linha de comando valem mais que o perfil
sudo chili-fr --machine-from-host=minha-maquina       # cria um perfil desta máquina (com sudo: inclui serial/uuid)
```

`chili-fr`는 `~/.config/chili-fr/machines/`(사용자의)와 `/usr/share/chili-fr/machines/`(패키지에 포함된 것)의 프로필을 찾습니다. bash의 자동 완성은 `chili-fr -M <Tab>`로 이름을 완성합니다.

VM에서 변경되는 사항:
- **정체성 (SMBIOS/DMI):** 게스트 시스템은 실제 머신의 제조업체, 모델, BIOS, 보드 및 **섀시 유형**을 봅니다. 섀시 유형은 SMBIOS 이진 테이블에 들어가는데, 이는 QEMU가 다른 방식으로 이 필드를 설정하는 것을 허용하지 않기 때문입니다.
- **프로세서:** 같은 세대 QEMU 모델(`Penryn`, `Nehalem`, `IvyBridge`…)을 사용하며, 실제 CPU에 없던 명령어는 포함되지 않습니다. 예를 들어, 구형 Core i3는 AES가 없으므로, 최신 명령어를 요구하는 프로그램은 가상 머신에서 실제 기계에서처럼 실패합니다.
- **디스크 및 부트:** 디스크는 SATA 또는 NVMe로 연결되며, 설치 프로그램은 실제 머신에서처럼 `/dev/sda` 또는 `/dev/nvme0n1`를 확인합니다. 부트는 UEFI 또는 레거시 BIOS입니다.

---

## 📄 프로필 형식

각 필드마다 `chave="valor"` 한 줄이 있는 텍스트 파일입니다. `#`로 시작하는 줄은 주석입니다.

| 키 | 예제 | 설명 |
|-------|---------|-----------|
| `desc` | `LG Electronics A410-G.BC44P1` | `--list-machines`에 표시된 설명 |
| `vendor`, `product`, `version`, `family`, `sku` | `LG Electronics`, `A410-G.BC44P1` | 시스템 식별(SMBIOS 유형 1) |
| `board_vendor`, `board_product`, `board_version`, `board_asset` | `Intel Corp.` | 메인보드 (SMBIOS 타입 2) |
| `bios_vendor`, `bios_version`, `bios_date` | `INSYDE`, `QL7L3F92`, `03/14/2011` | BIOS (SMBIOS 유형 0) |
| `chassis_type` | `notebook`, `laptop`, `desktop`, `convertible`, `minipc`, `other` 또는 숫자 (1–36) | 섀시 유형 |
| `chassis_vendor`, `chassis_version`, `chassis_asset`, `chassis_sku` | `LENOVO` | 섀시(SMBIOS 유형 3) |
| `cpu` | `Nehalem`, `IvyBridge,-aes`, `host` | QEMU의 CPU 모델 |
| `cpu_name` | `Intel(R) Core(TM) i3 CPU M 390 @ 2.67GHz` | 게스트가 보는 CPU 이름 |
| `smp` | `4` | 핵심 |
| `mem` | `4G` | 메모리 |
| `video` | `VGA`, `virtio-vga-gl` | 비디오 장치 |
| `net` | `e1000e` | 네트워크 카드 |
| `disk_bus` | `virtio`, `sata`, `nvme` | 디스크 버스 |
| `uefi` | `true`, `false` | UEFI 또는 레거시 BIOS |

예제 (`lg-a410.conf`):

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

## ⚠️ 제한 사항

- **하드웨어 계속 가상:** VM은 기계처럼 나타나지만, 장치는 QEMU의 것입니다. 배터리, 충전기 및 커버는 에뮬레이션되지 않습니다.
- **빈 칸:** 프로필이 입력하지 않은 항목은 QEMU의 기본값을 받으며, 예를 들어 `Standard PC (Q35…)`입니다.
- **아주 최신 AMD CPU**는 `cpu=host`를 사용합니다. QEMU의 AMD 모델은 VM을 실행하는 컴퓨터에 AMD 프로세서가 필요하기 때문입니다.

---

## 🤝 참여하세요

다른 컴퓨터가 있나요? 오래된 노트북이든, 사무용 데스크탑이든, 레거시 BIOS를 가진 기계든 상관없습니다. `chili-machine-hwreport`를 실행하고 프로필을 보내주세요. 새로운 각 머신이 VoidBR을 실제 하드웨어에서 테스트하는 데 도움이 됩니다.
