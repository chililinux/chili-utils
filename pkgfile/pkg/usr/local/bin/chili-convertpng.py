#!/usr/bin/env python
# -*- coding: utf-8 -*-
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from PIL import Image

def main():
  if len(sys.argv) != 5:
    print("Uso: python resize.py <input_path> <output_path> <width> <height>")
    sys.exit(1)

  input_path = sys.argv[1]
  output_path = sys.argv[2]
  width = int(sys.argv[3])
  height = int(sys.argv[4])

  try:
    img = Image.open(input_path)
    resized_img = img.resize((width, height), Image.LANCZOS)
    resized_img.save(output_path)
    print(f"Imagem salva em: {output_path}")
  except Exception as e:
    print(f"Erro: {e}")
    sys.exit(2)

if __name__ == "__main__":
  main()
