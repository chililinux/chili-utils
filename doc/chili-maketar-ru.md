# 🌶️ чили-макетар

**chili-maketar** — это инструмент на Bash, созданный для создания файлов `.tar` (и производных) с поддержкой различных компрессоров, шифрования и автоматического обнаружения зависимостей.

Просто, быстро и эффективно — всё в стиле *классического Unix-like*, без лишних зависимостей.

---

## 📦 О

- **Автор:** Вилмар Катафеста  
- **Версия:** 3.3.3 — _13/11/2025_  
- **Лицензия:** MIT  
- **Описание:** Создает сжатые или зашифрованные файлы `.tar` с использованием различных методов.  
- **Совместимость:** Linux (тестировалось на Arch/Manjaro)

---

## ⚙️ Ресурсы

✅ Сжатие с поддержкой нескольких компрессоров  
✅ Необязательное шифрование через `gpg`  
✅ Подробный журнал с прогрессирующим счётчиком  
✅ Автоматическое обнаружение и установка зависимостей  
✅ Поддержка цветов и тихий режим  
✅ Резервное копирование даже с только скрытыми файлами  
✅ Чистые и стандартизированные выходы  

---

## 🧩 Доступные компрессоры

| Опция | Компрессор | Создаваемое расширение | Скорость | Уровень сжатия | Примечание |
|-------|-------------|------------------|-------------|----------------------|-------------|
| `-s` | **pzstd** | `.tar.zst` | ⚡ Быстро | 🟢 Высокий | Стандарт (многопоточный Zstandard) |
| `-z` | **pigz** | `.tar.gz` | ⚡⚡ | 🟡 Средний | параллельный gzip |
| `-g` | **gzip** | `.tar.gz` | ⚡ | 🟡 Средний | традиционный gzip |
| `-x` | **xz** | `.tar.xz` | 🐢 | 🟢 Высокий | Стандарт пакетов Linux |
| `-l` | **lz4** | `.tar.lz4` | ⚡⚡⚡ | 🔴 Низкий | Сверхбыстрый |
| `-o` | **lzop** | `.tar.lzo` | ⚡⚡ | 🔴 Низкий | Простой и лёгкий |
| `-b` | **brotli** | `.tar.br` | 🐢 | 🟢 Высокий | Идеально для веба (HTML, JS, CSS) |
| `-r` | **lrzip** | `.tar.lrz` | ⚡ | 🟢 Высокий | Отлично подходит для больших файлов |
| `-q` | **zpaq** | `.zpaq` | 🐌 | 🟣 Экстремальный | Максимальное сжатие, постобработка |
| `-e` | **zstdgpg** | `.tar.zst.gpg` | ⚡ | 🟢 Высокий | Zstandard + шифрование |
| `-p` | **tarzstgpg2** | `.tar.zst.gpg` | ⚡ | 🟢 Высокий | Шифрование с `gpg2` |
| `-7` | **7z** | `.7z` | 🐢 | 🟢 Высокий | Общая высокая компрессия |
| `-Z` | **молния** | `.zip` | ⚡ | 🟡 Средний | Универсальный формат |

---

## 💻 Пример использования

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
