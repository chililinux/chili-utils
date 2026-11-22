# 🌶️ Chili-Vermarkter

**chili-maketar** ist ein Bash-Tool, das dazu dient, `.tar`-Dateien (und abgeleitete Dateien) mit Unterstützung für verschiedene Kompressoren, Verschlüsselung und automatische Abhängigkeitsprüfung zu erstellen.

Einfach, schnell und effizient — alles im klassischen *Unix-ähnlichen* Stil, ohne unnötige Abhängigkeiten.

---

## 📦 Über

- **Autor:** Vilmar Catafesta  
- **Version:** 3.3.3 — _13/11/2025_  
- **Lizenz:** MIT  
- **Beschreibung:** Erstellt `.tar`-Dateien, die komprimiert oder verschlüsselt sind, unter Verwendung verschiedener Methoden.  
- **Kompatibilität:** Linux (getestet auf Arch/Manjaro)

---

## ⚙️ Funktionen

✅ Komprimierung mit Unterstützung für mehrere Kompressoren  
✅ Optionale Verschlüsselung über `gpg`  
✅ Detailliertes Protokoll mit fortschreitendem Zähler  
✅ Automatische Erkennung und Installation von Abhängigkeiten  
✅ Farbunterstützung und Ruhemodus  
✅ Backup auch mit nur versteckten Dateien  
✅ Saubere und standardisierte Ausgänge  

---

## 🧩 Verfügbare Kompressoren

| Option | Kompressor | Generierte Erweiterung | Geschwindigkeit | Kompressionsstufe | Anmerkung |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Schnell | 🟢 Hoch | Standard (Multithread-Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Mittel | paralleles gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Mittel | traditionelles gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Hoch | Standard der Linux-Pakete |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Niedrig | Ultrahochgeschwindigkeit |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Niedrig | Einfach und leicht |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Hoch | Ideal für Web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Hoch | Ausgezeichnet bei großen Dateien |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extrem | Maximale Kompression, Nachbearbeitung |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Hoch | Zstandard + Verschlüsselung |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Hoch | Verschlüsselung mit `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Hoch | Hohe Gesamtkodierung |
| `-Z` | **Reißverschluss** | `.zip` | ⚡ | 🟡 Mittel | Universelles Format |

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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
