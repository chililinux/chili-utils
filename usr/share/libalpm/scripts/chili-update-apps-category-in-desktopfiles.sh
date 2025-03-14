#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# shellcheck shell=bash disable=SC1091,SC2039,SC2166
#
# /usr/share/libalpm/scripts/chili-update-apps-category-in-desktopfiles.sh
# Created: 2024/11/12 - 20:46
# Altered: 2024/11/12 - 20:46
#
# Copyright (c) 2024-2024, Vilmar Catafesta <vcatafesta@gmail.com>
# All rights reserved.

: <<'REMARK'
Esse comando percorre todos os arquivos .desktop no diretório /usr/share/applications/
que começam com big, e realiza a seguinte ação:
Substitui todas as ocorrências de Biglinux por Big Apps.
Adiciona Big Apps ao final da linha, caso ainda não esteja presente.

Exemplo: Se a linha original for: Categories=Utility;Biglinux;Graphics;
Ela será transformada em:         Categories=Utility;Big Apps;Graphics;

Se a linha original for:  Categories=Utility;Graphics;
Ela será transformada em: Categories=Utility;Graphics;Big Apps;
REMARK

for i in /usr/share/applications/chili*.desktop /usr/share/applications/iso2usb*.desktop; do
  # Verifica se o arquivo existe antes de modificá-lo
  [ -f "$i" ] || continue

  # Substitui 'Biglinux' por 'Chili Apps'
  sed -i 's/\bBiglinux\b/Chili Apps/g' "$i"

  # Adiciona 'Chili Apps' se não existir na linha 'Categories='
  sed -i '/^Categories=/{
    /Chili Apps/! s/$/;Chili Apps/
  }' "$i"

  # Remove duplicados de ';'
  sed -i '/^Categories=/ s/;;*/;/g' "$i"

  # Garante que termina com ';'
  sed -i '/^Categories=/!b; s/[^;]$/&;/' "$i"
done


