#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import subprocess
import argparse
from PIL import Image

# Cores ANSI rápidas
GREEN = "\033[32m"
RED = "\033[31m"
YELLOW = "\033[33m"
CYAN = "\033[36m"
RESET = "\033[0m"

def print_error(msg):
    print(f"{RED}[ERRO]{RESET} {msg}")

def print_info(msg):
    print(f"{GREEN}[INFO]{RESET} {msg}")

def print_warning(msg):
    print(f"{YELLOW}[AVISO]{RESET} {msg}")

# Classe customizada para ajuda colorida no argparse
class ColorHelpFormatter(argparse.HelpFormatter):
    def start_section(self, heading):
        heading = f"{CYAN}{heading}{RESET}"
        super().start_section(heading)
    
    def _format_action(self, action):
        parts = super()._format_action(action)
        # Colorir os nomes dos argumentos
        if action.option_strings:
            for opt in action.option_strings:
                parts = parts.replace(opt, f"{YELLOW}{opt}{RESET}")
        else:
            # Argumentos posicionais
            parts = parts.replace(action.metavar or action.dest, f"{YELLOW}{action.metavar or action.dest}{RESET}")
        return parts

def png_to_svg(png_path, svg_path):
    if not os.path.isfile(png_path):
        print_error(f"Arquivo '{png_path}' não encontrado!")
        return False

    print_info(f"Lendo imagem '{png_path}'...")
    im = Image.open(png_path).convert('L')
    print_info("Convertendo para preto e branco (binarização)...")
    im = im.point(lambda x: 0 if x < 128 else 255, '1')

    pbm_path = 'temp.pbm'
    im.save(pbm_path)
    print_info(f"Arquivo intermediário salvo: {pbm_path}")

    print_info(f"Executando potrace para gerar SVG '{svg_path}'...")
    result = subprocess.run(['potrace', pbm_path, '--svg', '-o', svg_path])
    if result.returncode != 0:
        print_error("Erro ao executar potrace!")
        return False

    os.remove(pbm_path)
    print_info(f"SVG gerado com sucesso em '{svg_path}'!")
    return True

def main():
    parser = argparse.ArgumentParser(
        description=f"{CYAN}Converte PNG para SVG usando potrace.{RESET}",
        formatter_class=ColorHelpFormatter
    )
    parser.add_argument("input", help="Caminho do arquivo PNG de entrada")
    parser.add_argument("output", help="Caminho do arquivo SVG de saída")
    args = parser.parse_args()

    success = png_to_svg(args.input, args.output)
    if not success:
        print_error("Conversão falhou.")
        exit(1)

if __name__ == "__main__":
    main()

