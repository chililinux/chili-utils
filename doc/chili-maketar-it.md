# 🌶️ produttore di chili

**chili-maketar** è uno strumento in Bash creato per generare file `.tar` (e derivati) con supporto a diversi compressori, crittografia e rilevamento automatico delle dipendenze.

Semplice, veloce ed efficiente — tutto nello stile *Unix-like classico*, senza dipendenze inutili.

---

## 📦 Informazioni

- **Autore:** Vilmar Catafesta  
- **Versione:** 3.3.3 — _13/11/2025_  
- **Licenza:** MIT  
- **Descrizione:** Crea file `.tar` compressi o crittografati utilizzando diversi metodi.  
- **Compatibilità:** Linux (testato su Arch/Manjaro)

---

## ⚙️ Risorse

✅ Compressione con supporto a più compressori  
✅ Crittografia opzionale tramite `gpg`  
✅ Log dettagliato con contatore progressivo  
✅ Rilevamento e installazione automatica delle dipendenze  
✅ Supporto per colori e modalità silenziosa  
✅ Backup anche con solo file nascosti  
✅ Uscite pulite e standardizzate  

---

## 🧩 Compressori disponibili

| Opzione | Compressore | Estensione generata | Velocità | Livello di compressione | Osservazione |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Veloce | 🟢 Alto | Standard (Zstandard multithread) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Medio | gzip parallelo |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Medio | gzip tradizionale |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Alto | Standard dei pacchetti Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Basso | Ultrarapido |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Basso | Semplice e leggero |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Alto | Ideale per il web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Alto | Eccellente per file grandi |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Estremo | Compressione massima, post-elaborazione |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Zstandard + crittografia |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Crittografia con `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Alta | Alta compressione generale |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Medio | Formato universale |

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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
