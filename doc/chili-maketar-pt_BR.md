# 🌶️ vendedor de pimenta

**chili-maketar** é uma ferramenta em Bash feita para criar arquivos `.tar` (e derivados) com suporte a diversos compressores, criptografia e detecção automática de dependências.

Simples, rápida e eficiente — tudo no estilo *Unix-like clássico*, sem dependências desnecessárias.

---

## 📦 Sobre

- **Autor:** Vilmar Catafesta  
- **Versão:** 3.3.3 — _13/11/2025_  
- **Licença:** MIT  
- **Descrição:** Cria arquivos `.tar` compactados ou criptografados usando diferentes métodos.  
- **Compatibilidade:** Linux (testado no Arch/Manjaro)

---

## ⚙️ Recursos

✅ Compactação com suporte a múltiplos compressores  
✅ Criptografia opcional via `gpg`  
✅ Log detalhado com contador progressivo  
✅ Detecção e instalação automática de dependências  
✅ Suporte a cores e modo silencioso  
✅ Backup mesmo com apenas arquivos ocultos  
✅ Saídas limpas e padronizadas  

---

## 🧩 Compressores disponíveis

| Opção | Compressor | Extensão gerada | Velocidade | Nível de compressão | Observação |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Rápido | 🟢 Alto | Padrão (Zstandard multithread) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Médio | gzip paralelo |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Médio | gzip tradicional |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Alto | Padrão dos pacotes Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Baixo | Ultrarrápido |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Baixo | Simples e leve |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Alto | Ideal para web (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Alto | Excelente em arquivos grandes |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Extremo | Compressão máxima, pós-processo |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Zstandard + criptografia |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Alto | Criptografia com `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Alto | Alta compressão geral |
| `-Z` | **zip** | `.zip` | ⚡ | 🟡 Médio | Formato universal |

---

## 💻 Exemplo de uso

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
