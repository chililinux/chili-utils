# 🌶️ mercado de chili

**chili-maketar** es una herramienta en Bash hecha para crear archivos `.tar` (y derivados) con soporte para diversos compresores, cifrado y detección automática de dependencias.

Simple, rápida y eficiente — todo al estilo *Unix-like clásico*, sin dependencias innecesarias.

---

## 📦 Sobre

- **Autor:** Vilmar Catafesta  
- **Versión:** 3.3.3 — _13/11/2025_  
- **Licencia:** MIT  
- **Descripción:** Crea archivos `.tar` comprimidos o encriptados usando diferentes métodos.  
- **Compatibilidad:** Linux (probado en Arch/Manjaro)

---

## ⚙️ Recursos

✅ Compresión con soporte para múltiples compresores  
✅ Cifrado opcional vía `gpg`  
✅ Registro detallado con contador progresivo  
✅ Detección e instalación automática de dependencias  
✅ Soporte de colores y modo silencioso  
✅ Copia de seguridad incluso con solo archivos ocultos  
✅ Salidas limpias y estandarizadas  

---

## 🧩 Compresores disponibles

| Opción | Compresor | Extensión generada | Velocidad | Nivel de compresión | Observación |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Rápido | 🟢 Alto | Estándar (Zstandard multihilo) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Medio | gzip paralelo |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Medio | gzip tradicional |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Alto | Estándar de los paquetes Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Bajo | Ultrarrápido |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Bajo | Simple y ligero |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Alto | Ideal para web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Alto | Excelente en archivos grandes |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extremo | Compresión máxima, posproceso |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Zstandard + cifrado |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Cifrado con `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Alta | Alta compresión general |
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

Licenciado sob a [Licença MIT](LICENSE)

Copyright (c) 2023-2025, Vilmar Catafesta
All rights reserved.

🧩 Créditos

Feito com 💻 + ☕ + 🌶️
Por Vilmar Catafesta (vcatafesta@gmail.com

)


---
