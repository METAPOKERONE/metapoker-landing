#!/bin/bash
echo "í´§ Arreglando emojis y favicon..."

# Backup
cp index.html index-backup-$(date +%s).html

# 1) Limpia caracteres rotos y pone Font Awesome
sed -i 's/ï¿½ï¿½ï¿½/<i class="fas fa-gem" style="font-size:3.5rem;color:#a5cffc;"><\/i>/g' index.html
sed -i 's/í¾¯/<i class="fas fa-bullseye" style="font-size:3.5rem;color:#a5cffc;"><\/i>/g' index.html
sed -i 's/âš¡/<i class="fas fa-bolt" style="font-size:3.5rem;color:#a5cffc;"><\/i>/g' index.html

sed -i 's/í´/<i class="fas fa-search" style="font-size:5rem;color:#58a6ff;"><\/i>/g' index.html
sed -i 's/í´/<i class="fas fa-users" style="font-size:5rem;color:#58a6ff;"><\/i>/g' index.html

sed -i 's/âœ…/<i class="fas fa-check-circle" style="color:#10b981;margin-right:0.5rem;"><\/i>/g' index.html
sed -i 's/ï¿½ï¿½ï¿½/<i class="fas fa-check-circle" style="color:#10b981;margin-right:0.5rem;"><\/i>/g' index.html

# 2) Favicon verdadero: engranaje + trÃ©bol (SVG inline)
sed -i '/<link rel="icon"/d' index.html
sed -i '\|<head>|a\
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='\''http://www.w3.org/2000/svg'\'' viewBox='\''0 0 100 100'\''%3E%3Ctext y='\''.9em'\'' font-size='\''90'\''%3Eâš™ï¸â™£ï¸%3C/text%3E%3C/svg%3E" />' index.html

# 3) TÃ­tulo limpio (quita la X que aparece arriba)
sed -i 's/|Redefine tu Jueg.*/|Redefine tu Juego<\/title>/' index.html

echo "âœ… Emojis y favicon listos"
