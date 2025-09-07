#!/bin/bash
echo "Ì¥ß Corrigiendo √≠conos..."

# Hacer backup por si acaso
cp index.html index-backup-$(date +%s).html

# Reemplazar emojis en "Nuestra Propuesta de Valor"
sed -i 's/<div class="value-icon">Ì≤é<\/div>/<div class="value-icon"><i class="fas fa-gem" style="font-size: 3.5rem; color: #a5cffc;"><\/i><\/div>/g' index.html
sed -i 's/<div class="value-icon">ÌæØ<\/div>/<div class="value-icon"><i class="fas fa-bullseye" style="font-size: 3.5rem; color: #a5cffc;"><\/i><\/div>/g' index.html
sed -i 's/<div class="value-icon">‚ö°<\/div>/<div class="value-icon"><i class="fas fa-bolt" style="font-size: 3.5rem; color: #a5cffc;"><\/i><\/div>/g' index.html

# Reemplazar emojis en "Nuestro Sistema"
sed -i 's/<div class="step-icon">Ì¥ç<\/div>/<div class="step-icon"><i class="fas fa-search" style="font-size: 5rem; color: #58a6ff;"><\/i><\/div>/g' index.html
sed -i 's/<div class="step-icon">‚ö°<\/div>/<div class="step-icon"><i class="fas fa-bolt" style="font-size: 5rem; color: #58a6ff;"><\/i><\/div>/g' index.html
sed -i 's/<div class="step-icon">Ì¥ù<\/div>/<div class="step-icon"><i class="fas fa-users" style="font-size: 5rem; color: #58a6ff;"><\/i><\/div>/g' index.html

# Reemplazar checkboxes ‚úÖ
sed -i 's/‚úÖ C√≥mo/<i class="fas fa-check-circle" style="color: #10b981; margin-right: 0.5rem;"><\/i> C√≥mo/g' index.html
sed -i 's/‚úÖ Las/<i class="fas fa-check-circle" style="color: #10b981; margin-right: 0.5rem;"><\/i> Las/g' index.html
sed -i 's/‚úÖ La/<i class="fas fa-check-circle" style="color: #10b981; margin-right: 0.5rem;"><\/i> La/g' index.html

# Favicon roto ‚Üí √≠cono de p√≥ker
sed -i 's/‚öôÔ∏è/‚ô†Ô∏è/g' index.html

# Foto de Miguel (placeholder temporal)
sed -i 's/<img id="miguel-photo" src="assets\/images\/miguel-placeholder.svg" alt="Facilitador certificado METAPOKER" class="facilitator-photo">/<div class="facilitator-photo" style="background: linear-gradient(135deg, #58a6ff, #7c3aed); display: flex; align-items: center; justify-content: center;"><i class="fas fa-user" style="font-size: 8rem; color: white;"><\/i><\/div>/g' index.html

echo "‚úÖ √çconos corregidos"
