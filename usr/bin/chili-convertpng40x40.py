#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PIL import Image

# Caminho da imagem original
input_path = "logo-chili-trans-branco-original.png"
output_path = "logo-chili-trans-branco.png"

# Abre e redimensiona a imagem
img = Image.open(input_path)
resized_img = img.resize((40, 40), Image.LANCZOS)
resized_img.save(output_path)

output_path

