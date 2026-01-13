# 🌶️ Chili-Maketar

**chili-maketar** ist ein Bash-Tool zum Erstellen von „.tar“-Dateien (und Derivaten) mit Unterstützung für verschiedene Kompressoren, Verschlüsselung und automatische Abhängigkeitserkennung.

Einfach, schnell und effizient – alles im *klassischen Unix-ähnlichen* Stil, ohne unnötige Abhängigkeiten.

---

## 📦 Ungefähr

- **Autor:** Vilmar Catafesta
- **Version:** 3.3.3 – _13.11.2025_
- **Lizenz:** BSD 2-Klausel
- **Beschreibung:** Erstellt komprimierte oder verschlüsselte „.tar“-Dateien mit verschiedenen Methoden.
- **Kompatibilität:** Linux (getestet auf Arch/Manjaro)

---

## ⚙️ Funktionen

✅ Komprimierung mit Unterstützung für mehrere Kompressoren
✅ Optionale Verschlüsselung per „gpg“.
✅ Detailliertes Protokoll mit progressivem Zähler
✅ Automatische Erkennung und Installation von Abhängigkeiten
✅ Farbunterstützung und lautloser Modus
✅ Sichern Sie auch nur versteckte Dateien
✅ Saubere und standardisierte Ausgaben

---

## 🧩 Kompressoren verfügbar

| Option | Kompressor | Generierte Erweiterung | Geschwindigkeit | Komprimierungsstufe | Hinweis |
|-------|-------------|----|-------------|--------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Schnell | 🟢 Laut | Standard (Zstandard-Multithread) |
| `-z` | **pigz** `.tar.gz` | ⚡⚡ | 🟡 Medien | parallel gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Mittel | traditionelles gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Laut | Linux-Paketstandard |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Bass | Ultraschnell |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Bass | Einfach und leicht |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Laut | Ideal für Web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Laut | Hervorragend geeignet für große Dateien |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extrem | Maximale Komprimierung, Nachbearbeitung |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Laut | Zstandard + Verschlüsselung |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Laut | Verschlüsselung mit „gpg2“ |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Laut | Hohe Gesamtkomprimierung |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Mittel | Universelles Format |

---

## 💻 Anwendungsbeispiel

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
