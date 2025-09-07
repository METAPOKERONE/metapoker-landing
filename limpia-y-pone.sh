#!/bin/bash
echo "��� Borrando íconos rotos y poniendo sólo Font-Awesome válidos..."

# Backup
cp index.html index-bak-$(date +%s).html

# 1) ELIMINA cualquier línea que tenga <div class="value-icon">...</div>
sed -i '/<div class="value-icon">/,/<\/div>/d' index.html

# 2) INSERTA íconos buenos JUSTO ANTES de cada <h3>
sed -i '/<h3>El Porqué<\/h3>/i\
        <div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"></i></div>' index.html

sed -i '/<h3>El Qué<\/h3>/i\
        <div class="value-icon"><i class="fas fa-bullseye" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"></i></div>' index.html

sed -i '/<h3>El Cómo<\/h3>/i\
        <div class="value-icon"><i class="fas fa-bolt" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 8px #22d3ee);"></i></div>' index.html

echo "✅ Íconos nuevos insertados"
