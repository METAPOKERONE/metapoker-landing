#!/bin/bash
echo "��� Quitando foto y dejando solo ícono profesor..."

# 1) Borra el <div class="facilitator-round"> completo
sed -i '/<div class="facilitator-round">/,/<\/div>/d' index.html

# 2) Inserta **solo** el ícono grande (5×5) justo antes del título
sed -i '/<h3 class="facilitator-name">Miguel Sáenz<\/h3>/i\
        <div class="facilitator-icon-only" style="text-align:center;margin-bottom:1.5rem;">\
          <i class="fas fa-user-graduate" style="font-size:5rem;color:#58a6ff;filter:drop-shadow(0 0 10px #58a6ff);"></i>\
        </div>' index.html

echo "✅ Espacio de foto eliminado; solo queda el ícono."
