# =========================================================
# chili-utils — Makefile de instalação
# Vilmar Catafesta <vcatafesta@gmail.com>
# =========================================================

# Diretórios de destino
PREFIX        ?= /usr/local
BINDIR        := $(PREFIX)/bin
SRCDIR        := usr/bin
INSTALL       := install
INSTALL_MODE  := 0755

# Lista de binários
BINARIES      := $(notdir $(wildcard $(SRCDIR)/chili-*))

# =========================================================
# Alvos principais
# =========================================================

.PHONY: all install uninstall list help

all:
	@echo "Use 'make install' para instalar os utilitários."
	@echo "Use 'make uninstall' para remover."
	@echo "Use 'make list' para listar todos os binários."
	@echo "Use 'make help' para ver as opções."

# ---------------------------------------------------------
install:
	@echo "🔧 Instalando chili-utils em: $(BINDIR)"
	@for f in $(BINARIES); do \
		echo " → Instalando $$f..."; \
		$(INSTALL) -Dm$(INSTALL_MODE) "$(SRCDIR)/$$f" "$(BINDIR)/$$f"; \
	done
	@echo "✅ Instalação concluída com sucesso!"

# ---------------------------------------------------------
uninstall:
	@echo "🧹 Removendo chili-utils de: $(BINDIR)"
	@for f in $(BINARIES); do \
		if [ -f "$(BINDIR)/$$f" ]; then \
			echo " → Removendo $$f"; \
			rm -f "$(BINDIR)/$$f"; \
		else \
			echo " ⚠️  $$f não encontrado em $(BINDIR)"; \
		fi; \
	done
	@echo "✅ Remoção concluída."

# ---------------------------------------------------------
list:
	@echo "📦 Binários detectados em $(SRCDIR):"
	@for f in $(BINARIES); do echo "  - $$f"; done
	@echo "Total: $$(echo $(BINARIES) | wc -w) arquivos"

# ---------------------------------------------------------
help:
	@echo "📘 Comandos disponíveis:"
	@echo "  make install     → Instala todos os utilitários em $(BINDIR)"
	@echo "  make uninstall   → Remove todos os utilitários do sistema"
	@echo "  make list        → Lista os binários disponíveis"
	@echo "  make help        → Mostra esta ajuda"
	@echo
	@echo "⚙️  Variáveis:"
	@echo "  PREFIX=/usr      → Define o diretório base (padrão: /usr/local)"
	@echo "  BINDIR=$(BINDIR)"

# =========================================================
# Fim do Makefile
# =========================================================
