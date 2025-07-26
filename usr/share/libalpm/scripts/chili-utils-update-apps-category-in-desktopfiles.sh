#!/usr/bin/env bash
# vim: ft=sh ts=2 sts=2 sw=2 et numbe
# -*- coding: utf-8 -*-
# shellcheck shell=bash disable=SC1091,SC2039,SC2166
#
#  chili-utils-update-apps-category-in-desktopfiles.sh
#  Created: 2025/07/26
#  Altered: 2025/07/26
#
#  Copyright (c) 2019-#2025, Vilmar Catafesta <vcatafesta@gmail.com>
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
#  THIS SOFTWARE IS PROVIDED BY Vilmar Catafesta ''AS IS'' AND ANY EXPRESS OR
#  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
#  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
#  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
#  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
#  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##############################################################################
#export LANGUAGE=pt_BR
export TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAIN=chili-utils-update-apps-category-in-desktopfiles.sh

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


