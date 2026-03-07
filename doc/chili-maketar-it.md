# 🌶️ chili-maketar

**chili-maketar** è uno strumento Bash progettato per creare file `.tar` (e derivati) con supporto per vari compressori, crittografia e rilevamento automatico delle dipendenze.

Semplice, veloce ed efficiente: il tutto nel *classico stile Unix*, senza dipendenze non necessarie.

---

## 📦 A proposito

- **Autore:** Vilmar Catafesta
- **Versione:** 3.3.3 — _13/11/2025_
- **Licenza:** Clausola BSD 2
- **Descrizione:** Crea file `.tar` compressi o crittografati utilizzando metodi diversi.
- **Compatibilità:** Linux (testato su Arch/Manjaro)

---

## ⚙️Caratteristiche

✅ Compressione con supporto per più compressori
✅ Crittografia opzionale tramite `gpg`
✅ Registro dettagliato con contatore progressivo
✅ Rilevamento e installazione automatici delle dipendenze
✅ Supporto colore e modalità silenziosa
✅ Backup anche solo con file nascosti
✅ Risultati puliti e standardizzati

---

## 🧩 Compressori disponibili

| Opzione | Compressore | Estensione generata | Velocità | Livello di compressione | Nota |
|-------|-------------|------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Veloce | 🟢 Forte | Standard (multithread Zstandard) |
| `-z` | **pigz** `.tar.gz` | ⚡⚡| 🟡Media | gzip parallelo |
| `-g` | **gzip** | `.tar.gz` | ⚡| 🟡 Medio | gzip tradizionale |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Forte | Pacchetto Linux standard |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴Basso | Ultraveloce |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡| 🔴Basso | Semplice e leggero |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Forte | Ideale per il web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡| 🟢 Forte | Eccellente su file di grandi dimensioni |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Estremo | Massima compressione, post-elaborazione |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡| 🟢 Forte | Zstandard + crittografia |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡| 🟢 Forte | Crittografia con `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Forte | Compressione complessiva elevata |
| `-Z` | **zip** | `.zip` | ⚡| 🟡 Medio | Formato universale |

---

## 💻 Esempio di utilizzo

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
