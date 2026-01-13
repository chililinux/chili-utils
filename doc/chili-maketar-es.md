# 🌶️ chili-maketar

**chili-maketar** es una herramienta Bash diseñada para crear archivos `.tar` (y derivados) con soporte para varios compresores, cifrado y detección automática de dependencias.

Simple, rápido y eficiente, todo en el estilo *clásico tipo Unix*, sin dependencias innecesarias.

---

## 📦 Acerca de

- **Autor:** Vilmar Catafesta
- **Versión:** 3.3.3 — _13/11/2025_
- **Licencia:** BSD 2-Cláusula
- **Descripción:** Crea archivos `.tar` comprimidos o cifrados utilizando diferentes métodos.
- **Compatibilidad:** Linux (probado en Arch/Manjaro)

---

## ⚙️ Características

✅ Compresión con soporte para múltiples compresores
✅ Cifrado opcional mediante `gpg`
✅ Registro detallado con contador progresivo
✅ Detección e instalación automática de dependencias
✅ Soporte de color y modo silencioso
✅ Copia de seguridad incluso solo con archivos ocultos
✅ Salidas limpias y estandarizadas

---

## 🧩 Compresores disponibles

| Opción | Compresor | Extensión generada | Velocidad | Nivel de compresión | Nota |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Rápido | 🟢 Fuerte | Estándar (multiproceso Zestándar) |
| `-z` | **cerdo** `.tar.gz` | ⚡⚡ | 🟡 Medios | gzip paralelo |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Medio | zip tradicional |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Fuerte | Estándar del paquete Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Bajo | Ultrarrápido |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Bajo | Sencillo y ligero |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Fuerte | Ideal para web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Fuerte | Excelente en archivos grandes |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extremo | Máxima compresión, posproceso |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Fuerte | Zestándar + cifrado |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Fuerte | Cifrado con `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Fuerte | Alta compresión general |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Medio | Formato universal |

---

## 💻 Ejemplo de uso

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
