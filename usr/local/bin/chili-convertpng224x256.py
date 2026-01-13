#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PIL import Image

# Caminho da imagem original
input_path = "Chili_Store_Icon_128x128.png"
output_path = "Chili_Store_Icon_224x256.png"

# Abre e redimensiona a imagem
img = Image.open(input_path)
resized_img = img.resize((224, 256), Image.LANCZOS)
resized_img.save(output_path)

output_path

