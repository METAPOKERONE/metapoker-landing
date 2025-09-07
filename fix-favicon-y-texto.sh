#!/bin/bash
echo "��� Favicon nítido + texto legible..."

# 1) Favicon: SVG limpio, trébol centrado y escalable
sed -i '/<link rel="icon"/d' index.html
sed -i '\|<head>|a\
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='\''http://www.w3.org/2000/svg'\'' viewBox='\''0 0 64 64'\''%3E%3Ctext x='\''50%25'\'' y='\''50%25'\'' dominant-baseline='\''middle'\'' text-anchor='\''middle'\'' font-size='\''48'\''%3E♣️%3C/text%3E%3C/svg%3E" type="image/svg+xml" />' index.html

# 2) Título completo y limpio
sed -i 's/|Redefine tu Jueg.*/|Redefine tu Juego<\/title>/' index.html

# 3) Asegura charset UTF-8 para que los emojis se lean
sed -i 's/<meta charset="UTF-8"\/>/<meta charset="UTF-8"\/>\n<meta http-equiv="X-UA-Compatible" content="IE=edge"\/>/' index.html

echo "✅ Favicon y texto listos"
