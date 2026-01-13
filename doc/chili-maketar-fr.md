# 🌶️ chili-maketar

**chili-maketar** est un outil Bash conçu pour créer des fichiers `.tar` (et dérivés) avec prise en charge de divers compresseurs, cryptage et détection automatique des dépendances.

Simple, rapide et efficace — le tout dans le style *classique de type Unix*, sans dépendances inutiles.

---

## 📦 À propos

- **Auteur :** Vilmar Catafesta
- **Version :** 3.3.3 — _13/11/2025_
- **Licence :** Clause BSD 2
- **Description :** Crée des fichiers `.tar` compressés ou cryptés à l'aide de différentes méthodes.
- **Compatibilité :** Linux (testé sur Arch/Manjaro)

---

## ⚙️ Caractéristiques

✅ Compression avec prise en charge de plusieurs compresseurs
✅ Cryptage optionnel via `gpg`
✅ Journal détaillé avec compteur progressif
✅ Détection et installation automatiques des dépendances
✅ Prise en charge des couleurs et mode silencieux
✅ Sauvegarde même avec uniquement des fichiers cachés
✅ Sorties propres et standardisées

---

## 🧩 Compresseurs disponibles

| Options | Compresseur | Extension générée | Vitesse | Niveau de compression | Remarque |
|-------|-------------|--------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Rapide | 🟢 Fort | Standard (multithread Zstandard) |
| `-z` | **pigz** `.tar.gz` | ⚡⚡ | 🟡 Médias | gzip parallèle |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Moyen | gzip traditionnel |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Fort | Norme de paquet Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Basse | Ultrarapide |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Basse | Simple et léger |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Fort | Idéal pour le web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Fort | Excellent sur les gros fichiers |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extrême | Compression maximale, post-traitement |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Fort | Zstandard + cryptage |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Fort | Cryptage avec `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Fort | Compression globale élevée |
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

Licenciado sob BSD 2-Clause

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
