# 🌶️ чили-утилиты

**chili-utils** — это коллекция **инструментов Linux, созданных Вилмаром Катафестой** — набор быстрых, прямых и без излишеств утилит, написанных на **Bash**, **C**, **Go**, **Harbour** и **Python**.

Всё с классической философией Unix:  
> _«Каждый инструмент делает одно дело и делает это хорошо.»_

---

## 🧩 Обзор

| Категория | Описание | Примеры |
|------------|------------|----------|
| 🧰 **Система и ядро** | Настройка и диагностика системы | `chili-cpuinfo`, `chili-memuse`, `chili-glibc-version`, `chili-systemd-services` |
| 💾 **Диски и Разделы** | Управление, тестирование и восстановление дисков | `chili-disk-test-bench`, `chili-parted`, `chili-power-disk`, `chili-e2fsck-wrapper`, `chili-writesector` |
| 🔒 **Boot и EFI** | Обслуживание загрузчиков и разделов EFI | `chili-manager-efi`, `chili-criar-entrada-efi`, `chili-grub-fix`, `chili-update-grub-btrfs`, `chili-update-uuid` |
| 🌐 **Сеть и Интернет** | Подключение, Wi-Fi и синхронизация времени | `chili-wifi-config`, `chili-wifi-config-wpa`, `chili-syncdatetime`, `chili-testmirror` |
| 📦 **Сжатие и Упаковка** | Создание и конвертация пакетов и файлов | `chili-maketar`, `chili-deb2zst`, `chili-recompress-btrfs`, `chili-make-pacman-conf` |
| 🧠 **Перевод и Автоматизация** | Автоматический перевод и параллельные скрипты | `chili-tradutor.sh`, `chili-tradutor-go`, `chili-tradutor-parallel` |
| ⚙️ **Среды Chroot и Jail** | Монтаж и безопасное выполнение chroot | `chili-chroot`, `chili-jailchroot`, `chili-break_chroot`, `chili-runiso` |
| 🧹 **Обслуживание и уборка** | Очистка, обновление и инициализация пакетов | `chili-cleaner`, `chili-init-keys`, `chili-update`, `chili-testmirror` |
| 💡 **Конвертация и Графики** | Конвертеры изображений и форматов | `chili-convert-png-to-avif`, `chili-convert-png-to-svg.py`, `chili-convertpng.py`, `chili-convertpng40x40.py` |
| 🪄 **Рабочий стол и интерфейс** | Настройки тем, шрифтов и мониторов | `chili-setfont`, `chili-dialog-theme-selector`, `chili-sysmontask-root`, `chili-xrandr`, `chili-util-selector` |
| 🧱 **Старые системы (ретро-режим)** | Скрипты для MS-DOS, FreeDOS и Windows 3.11 | `chili-setup-freedos`, `chili-setup-msdos`, `chili-setup-windows311` |
| 🧨 **Администрирование и безопасность** | Процессы, разрешения и пользователи | `chili-sudo-wayland`, `chili-rename-user`, `chili-killer`, `chili-locale-config` |
| 🧪 **Сравнители и Синхронизация** | Синхронизация и сравнение каталогов | `chili-compare-dirs`, `chili-compare-dirs-comm`, `chili-compare-dirs-rsync`, `chili-compare-dirs-simple` |

---

## ⚙️ Основное

### 🖥️ **chili-machine-hwreport** + **chili-fr -M**
Создает профиль вашей машины (производитель, модель, BIOS, корпус и оборудование), без серийного номера, UUID или MAC, и отправляет через issue. С этими профилями `chili-fr` имитирует в QEMU установку VoidBR на реальных машинах.

```bash
chili-machine-hwreport                         # gera e envia o perfil desta máquina
chili-fr --list-machines                       # lista os perfis disponíveis
chili-fr -M lg-a410 voidbr.iso disco.qcow2     # simula a instalação num LG A410
```

📖 Полная документация: [chili-machine-hwreport.md](chili-machine-hwreport.md)

### 🔥 **чили-макетар**
Универсальный архиватор с поддержкой нескольких алгоритмов и шифрованием через GPG.

```bash
chili-maketar -s           # Compacta com zstd (padrão)
chili-maketar -r /var/log  # Usa lrzip
chili-maketar -p backup    # Compacta + criptografa
```

### 🧠 **chili-переводчик-go**
Переводчик, написанный на Go с параллельными потоками и поддержкой JSON.

```bash
chili-tradutor-go texto_entrada.json
```

### 🔒 **chili-manager-efi**
Управляет разделами и записями EFI, переустанавливает GRUB и обнаруживает несколько операционных систем.

### 🧪 **chili-compare-dirs**
Сравнивает и синхронизирует каталоги с разными режимами (rsync, comm, простой).

```bash
chili-compare-dirs /mnt/diskA /mnt/diskB
```

---

## 🧠 Философия

> _«Автоматизация — это уменьшение скуки, а не внимания.»_  
> — Вилмар Катафеста

Утилиты chili следуют четырем заповедям:

1. Простота превыше всего.
2. Никаких внешних зависимостей, когда это возможно.
3. Самообъясняющиеся скрипты с понятными сообщениями.
4. Полная совместимость с POSIX-окружениями.

---

## 🧱 Установка

### 🧩 Вариант 1 — через PKGBUILD (Arch / Manjaro)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils/pkgbuild
makepkg -si
```

### 🧩 Вариант 2 — через Makefile (ручная установка)

```bash
git clone https://github.com/vcatafesta/chili-utils.git
cd chili-utils
sudo make install
```

Чтобы удалить:

```bash
sudo make uninstall
```

### 🧩 Вариант 3 — Установить напрямую из репозитория Chili Linux

> **Предварительно скомпилированный пакет (Arch, Manjaro и производные)**  
>  
> `sudo pacman -U https://chililinux.com/repo/chili-stable/x86_64/chili-utils-20251112-0052-any.pkg.tar.zst`  
>  
> Если ссылка выше не работает, перейдите в каталог пакетов и получите последнюю версию вручную:  
> 👉 [https://chililinux.com/repo/chili-stable/x86_64/](https://chililinux.com/repo/chili-stable/x86_64/)

---

## 📜 Лицензия

Лицензировано по [Licença MIT](LICENSE).

Авторские права (c) 2019-2025  
Вилмар Катафеста <vcatafesta@gmail.com>

---

## 🧩 Автор

**Вилмар Катафеста*  
💻 Программист и системный администратор  
✉️ vcatafesta@gmail.com

---

## 🌶️ Заключение

**chili-utils** — это идеальный швейцарский нож для тех, кто живет в терминале —  
арсенал чистых Unix-инструментов, созданных для решения задач, а не для украшения.

> _«Магии не существует. Есть только хорошо написанный shell.»_ 🧙‍♂️  
> — вкатафеста
