# 🌶️칠리마케타르

**chili-maketar**는 다양한 압축기, 암호화 및 자동 종속성 감지를 지원하여 '.tar' 파일(및 파생물)을 생성하도록 설계된 Bash 도구입니다.

간단하고 빠르며 효율적입니다. 모두 불필요한 종속성 없이 *클래식 Unix와 같은* 스타일로 제공됩니다.

---

## 📦 소개

- **저자:** 빌마르 카타페스타
- **버전:** 3.3.3 — _2025/11/13_
- **라이센스:** BSD 2절
- **설명:** 다양한 방법을 사용하여 압축되거나 암호화된 `.tar` 파일을 생성합니다.
- **호환성:** Linux(Arch/Manjaro에서 테스트됨)

---

## ⚙️ 특징

✅ 여러 압축기를 지원하는 압축
✅`gpg`를 통한 선택적 암호화
✅ 프로그레시브 카운터가 포함된 자세한 로그
✅ 자동 종속성 감지 및 설치
✅ 색상 지원 및 무음 모드
✅ 숨겨진 파일만 있어도 백업 가능
✅ 깔끔하고 표준화된 출력

---

## 🧩 압축기 사용 가능

| 옵션 | 압축기 | 생성된 확장 | 속도 | 압축 수준 | 참고 |
|-------|-------------|------|-------------|---------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 빠른 | 🟢 시끄러운 | 표준(Zstandard 멀티스레드) |
| `-z` | **돼지** `.tar.gz` | ⚡⚡ | 🟡 미디어 | 병렬 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 중형 | 기존 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 시끄러운 | Linux 패키지 표준 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 베이스 | 초고속 |
| `-오` | **이솝** | `.tar.lzo` | ⚡⚡ | 🔴 베이스 | 간단하고 가벼운 |
| `-b` | **브로틀리** | `.tar.br` | 🐢 | 🟢 시끄러운 | 웹(HTML, JS, CSS)에 적합 |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 시끄러운 | 대용량 파일에 탁월함 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 익스트림 | 최대 압축, 후처리 |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 시끄러운 | Zstandard + 암호화 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 시끄러운 | `gpg2`를 사용한 암호화 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 시끄러운 | 높은 전체 압축 |
| `-Z` | **우편번호** | `.zip` | ⚡ | 🟡 중형 | 범용 형식 |

---

## 💻 사용 예

```bash
# Compacta diretório atual com zstd (padrão)
chili-maketar

# Usa compressão pigz (gzip paralelo)
chili-maketar -z

# Usa lrzip (ótimo pra arquivos grandes)
chili-maketar -r /var/log

# Cria um .tar.zst.gpg criptografado com senha
chili-maketar -p backup

# Compacta usando zpaq (máxima compressão)
chili-maketar -q ~/Documentos

🔒 Compactação + Criptografia (modo -p)

O modo -p cria um arquivo .tar.zst.gpg criptografado via gpg, pedindo senha de proteção:

chili-maketar -p documentos/

Saída esperada:

[➡] Compactando com zstd e criptografando com gpg (modo seguro)
[✓✓✓] Successfully created: documentos-13112025-020320.tar.zst.gpg (28K)

⚙️ Instalação
🔧 Manual

sudo install -m755 chili-maketar /usr/local/bin/

Ou clone o repositório:

git clone https://github.com/vcatafesta/chili-maketar.git
cd chili-maketar
sudo make install

🧱 Pacote (Arch/Manjaro)

Um PKGBUILD pode ser gerado com:

makepkg -si

🧠 Dicas

    Modo silencioso (padrão): saída limpa.

    Use -v para modo verbose.

    Mesmo diretórios com apenas arquivos ocultos são compactados corretamente.

    Todos os logs ficam em /tmp/chili-maketar_<data>_<user>.log.

📜 Licença

Licenciado sob BSD 2-Clause

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
