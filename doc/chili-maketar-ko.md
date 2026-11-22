# 🌶️ 칠리 마케타르

**chili-maketar**는 다양한 압축기, 암호화 및 의존성 자동 감지를 지원하는 `.tar`(및 파생 파일)를 생성하기 위해 만들어진 Bash 도구입니다.

간단하고 빠르며 효율적 — 모든 것이 불필요한 의존성 없이 *클래식 Unix 스타일*입니다.

---

## 📦 소개

- **저자:** Vilmar Catafesta  
- **버전:** 3.3.3 — _2025/11/13_  
- **라이선스:** MIT  
- **설명:** 다양한 방법을 사용하여 압축되거나 암호화된 `.tar` 파일을 생성합니다.  
- **호환성:** 리눅스 (Arch/Manjaro에서 테스트됨)

---

## ⚙️ 기능

✅ 여러 압축기를 지원하는 압축  
✅ 선택적 암호화 via `gpg`  
✅ 진행 카운터가 있는 자세한 로그  
✅ 의존성 자동 감지 및 설치  
✅ 색상 지원 및 무음 모드  
✅ 숨김 파일만 있어도 백업  
✅ 깨끗하고 표준화된 출력  

---

## 🧩 사용 가능한 압축기

| 옵션 | 압축기 | 생성된 확장자 | 속도 | 압축 수준 | 참고 |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ 빠름 | 🟢 높음 | 표준 (다중 스레드 Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 중간 | 병렬 gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 중간 | 전통적인 gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 높음 | 리눅스 패키지 표준 |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 낮음 | 초고속 |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 낮음 | 간단하고 가벼움 |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 높음 | 웹용 이상적 (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 높음 | 큰 파일에 탁월함 |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 극한 | 최대 압축, 후처리 |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 높음 | Zstandard + 암호화 |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 높음 | `gpg2`로 암호화 |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 높음 | 전체적인 높은 압축 |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 중간 | 범용 형식 |

---

## 💻 사용 예제

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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
