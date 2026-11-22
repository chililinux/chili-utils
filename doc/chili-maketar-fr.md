# 🌶️ marché au chili

**chili-maketar** est un outil en Bash conçu pour créer des fichiers `.tar` (et dérivés) avec prise en charge de divers compresseurs, cryptage et détection automatique des dépendances.

Simple, rapide et efficace — tout dans le style *Unix-like classique*, sans dépendances inutiles.

---

## 📦 À propos

- **Auteur :** Vilmar Catafesta  
- **Version :** 3.3.3 — _13/11/2025_  
- **Licence :** MIT  
- **Description :** Crée des fichiers `.tar` compressés ou cryptés en utilisant différentes méthodes.  
- **Compatibilité :** Linux (testé sur Arch/Manjaro)

---

## ⚙️ Ressources

✅ Compression avec support pour plusieurs compresseurs  
✅ Cryptographie optionnelle via `gpg`  
✅ Journal détaillé avec compteur progressif  
✅ Détection et installation automatique des dépendances  
✅ Prise en charge des couleurs et mode silencieux  
✅ Sauvegarde même avec seulement des fichiers cachés  
✅ Sorties propres et standardisées  

---

## 🧩 Compresseurs disponibles

| Option | Compresseur | Extension générée | Vitesse | Niveau de compression | Remarque |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Rapide | 🟢 Élevé | Standard (Zstandard multithread) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Moyen | gzip parallèle |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Moyen | gzip traditionnel |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Élevé | Standard des paquets Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Faible | Ultra-rapide |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Faible | Simple et léger |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Élevé | Idéal pour le web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Élevé | Excellent pour les grands fichiers |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extrême | Compression maximale, post-traitement |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Élevé | Zstandard + cryptage |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Élevé | Cryptage avec `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Élevé | Haute compression générale |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Moyen | Format universel |

---

## 💻 Exemple d'utilisation

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
