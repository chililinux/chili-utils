# 🌶️ 칠리-유틸

**chili-utils**는 **Vilmar Catafesta가 만든 Linux 도구 모음**으로—빠르고 직관적이며 불필요한 장식이 없는 유틸리티 모음으로, **Bash**, **C**, **Go**, **Harbour**, **Python**으로 만들어졌습니다.

모든 것은 유닉스의 고전 철학과 함께:  
> _“각 도구는 한 가지를 하고, 그것을 잘 한다.”_

---

## 🧩 개요

| 카테고리 | 설명 | 예시 |
|------------|------------|----------|
| 🧰 **시스템 및 커널** | 시스템 구성 및 진단 | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **디스크 및 파티션** | 디스크 관리, 테스트 및 복구 | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **부트 및 EFI** | 부트로더 및 EFI 파티션 유지 관리 | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **네트워크 및 인터넷** | 연결성, Wi-Fi 및 시간 동기화 | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **압축 및 패키징** | 패키지 및 파일 생성과 변환 | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **번역 및 자동화** | 자동 번역 및 병렬 스크립트 | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Chroot 및 Jail 환경** | Chroot의 안전한 마운트 및 실행 | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **유지보수 및 청소** | 패키지 청소, 업데이트 및 초기화 | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **변환 및 그래픽** | 이미지 및 형식 변환기 | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **데스크톱 및 인터페이스** | 테마, 글꼴 및 모니터 설정 | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **구형 시스템 (레트로 모드)** | MS-DOS, FreeDOS 및 Windows 3.11용 스크립트 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **관리 및 보안** | 프로세스, 권한 및 사용자 | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **비교기 및 동기화** | 디렉토리 동기화 및 비교 | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ 하이라이트

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
귀하의 기기 프로필(제조사, 모델, BIOS, 섀시 및 하드웨어)을 생성하되 시리얼, UUID 또는 MAC은 포함하지 않고 이슈로 전송합니다. 이 프로필을 사용하여 `chili-fr`는 실제 기기에서 VoidBR 설치를 QEMU에서 시뮬레이션합니다.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 완전한 문서: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **칠리-마케타르**
여러 알고리즘을 지원하고 GPG를 통해 암호화가 가능한 범용 압축기.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **칠리-번역기-go**
Go로 작성된 번역기, 병렬 스레드 및 JSON 지원 포함.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **칠리-매니저-EFI**
파티션과 EFI 항목을 관리하고, GRUB를 재설치하며, 여러 운영 체제를 감지합니다.

### 🧪 **치리-디렉토리-비교**
다양한 모드(rsync, comm, 간단한)로 디렉토리를 비교하고 동기화합니다.

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 철학

> _“자동화는 지루함을 줄이는 것이지, 주의를 줄이는 것이 아니다.”_  
> — 빌마르 카타페스타

칠리 유틸리티는 네 가지 계명을 따른다:

1. 무엇보다 단순함.
2. 가능한 한 외부 의존성을 제로로 유지합니다.
3. 자기 설명이 가능한 스크립트와 명확한 메시지.
4. POSIX 환경과의 완전한 호환성.

---

## 🧱 설치

### 🧩 옵션 1 — PKGBUILD 통해서 (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 옵션 2 — 메이크파일을 통한 설치 (수동 설치)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

제거하려면:

```bash
sudo make uninstall
```

### 🧩 옵션 3 — Chili Linux 저장소에서 직접 설치

> **사전 컴파일된 패키지 (Arch, Manjaro 및 파생 배포판)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> 위 링크가 작동하지 않으면, 패키지 디렉토리에 접속하여 최신 버전을 수동으로 가져오세요:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 라이선스

[Licença MIT](LICENSE)에 따라 허가됨.

저작권 (c) 2019-2025  
빌마르 카타페스타 <vcatafesta@gmail.com>

---

## 🧩 저자

**빌마르 카타페스타*  
💻 프로그래머 & 시스템 관리자  
✉️ vcatafesta@gmail.com

---

## 🌶️ 결론

**chili-utils**는 터미널에서 생활하는 사람들을 위한 궁극의 만능 도구입니다 —  
장식이 아니라 해결을 위해 만들어진 순수한 Unix 도구들의 무기고.

> _“마법은 없어. 잘 작성된 쉘만 있을 뿐.”_ 🧙‍♂️  
> — vcatafesta
