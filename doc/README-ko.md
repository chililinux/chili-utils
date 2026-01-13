# 🌶️ 칠리 유틸리티

**chili-utils**는 Vilmar Catafesta가 만든 **Linux 도구 모음입니다. 이는 **Bash**, **C**, **Go**, **Harbour** 및 **Python**으로 만든 빠르고 간단하며 단순한 유틸리티 세트입니다.

모두 고전적인 Unix 철학을 따릅니다.
> _“각 도구는 한 가지 일을 하며 잘 수행합니다.”_

---

## 🧩 개요

| 카테고리 | 설명 | 예 |
|------------|------------|------------|
| 🧰 **시스템 및 커널** | 시스템 구성 및 진단 | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **디스크 및 파티션** | 디스크 관리, 테스트 및 복구 | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **부팅 및 EFI** | 부트로더 및 EFI 파티션 유지 관리 | `chili-manager-efi`, `chili-create-efi-entry`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **네트워크 및 인터넷** | 연결, Wi-Fi 및 시간 동기화 | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **압축 및 포장** | 패키지 및 파일 생성 및 변환 | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **번역 및 자동화** | 기계 번역 및 병렬 스크립트 | `chili-translator.sh`, `chili-translator-go`, `chili-translator-parallel` |
| ⚙️ **Ambientes Chroot e Jail** | 몽타주와 chroots 실행 단계 | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **유지관리 및 청소** | 패키지 정리, 업데이트 및 초기화 | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **변환 및 그래픽** | 이미지 및 형식 변환기 | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **데스크톱 및 인터페이스** | 테마, 글꼴 및 모니터 조정 | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **기존 시스템(레트로 모드)** | MS-DOS, FreeDOS 및 Windows 3.11용 스크립트 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **관리 및 보안** | 프로세스, 권한 및 사용자 | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **비교기 및 동기화** | 디렉터리 동기화 및 비교 | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ 하이라이트

### 🔥 **칠리마케타르**
GPG를 통한 다중 알고리즘 및 암호화를 지원하는 범용 압축기입니다.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa

🧠 chili-tradutor-go

Tradutor escrito em Go com threads paralelos e suporte a JSON.

chili-tradutor-go texto_entrada.json

🔒 chili-manager-efi

Gerencia partições e entradas EFI, reinstala GRUB e detecta múltiplos sistemas operacionais.
🧪 chili-compare-dirs

Compara e sincroniza diretórios com diferentes modos (rsync, comm, simples).

chili-compare-dirs /mnt/diskA /mnt/diskB

🧠 Filosofia

    “Automatizar é reduzir o tédio, não a atenção.”
    — Vilmar Catafesta

Os chili-utils seguem quatro mandamentos:

    Simplicidade acima de tudo.

    Zero dependências externas sempre que possível.

    Scripts autoexplicativos e com mensagens claras.

    Compatibilidade total com ambientes POSIX.

🧱 Instalação
🧩 Opção 1 — via PKGBUILD (Arch / Manjaro)

git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si

🧩 Opção 2 — via Makefile (instalação manual)

git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install

Para remover:

sudo make uninstall

### 🧩 Opção 3 — Instalar diretamente do repositório Chili Linux

> **Pacote pré-compilado (Arch, Manjaro e derivados)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Se o link acima falhar, acesse o diretório de pacotes e pegue a versão mais recente manualmente:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

📜 Licença

Licenciado sob BSD 2-Clause License

Copyright (c) 2019-2025
Vilmar Catafesta <vcatafesta@gmail.com>
All rights reserved.

🧩 Autor

Vilmar Catafesta
💻 Programador & SysAdmin
✉️ vcatafesta@gmail.com
🌶️ Conclusão

chili-utils é o canivete suíço definitivo pra quem vive no terminal —
um arsenal de ferramentas Unix puras, feitas pra resolver, não pra enfeitar.

    “Não existe mágica. Só shell bem escrito.” 🧙‍♂️
    — vcatafesta


---
