#!/bin/bash
echo "��� SOLUCIÓN DEFINITIVA - Reconstrucción completa..."

# Backup ultra-seguro
cp index.html index-backup-$(date +%Y%m%d-%H%M%S).html

# Crear archivo temporal con la sección completa
cat > seccion-propuesta.tmp <<'SECTION'
<section class="section glass">
  <div class="container">
    <h2 class="section-title">Nuestra Propuesta de Valor</h2>
    <div class="value-cards">
      <div class="value-card glass-card">
        <div class="value-icon">
          <i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"></i>
        </div>
        <h3>El Porqué</h3>
        <p>Un propósito más allá del dinero que te motive a ser un profesional.</p>
      </div>
      <div class="value-card glass-card">
        <div class="value-icon">
          <i class="fas fa-bullseye" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"></i>
        </div>
        <h3>El Qué</h3>
        <p>La estrategia correcta, sustentada por tecnologías de vanguardia.</p>
      </div>
      <div class="value-card glass-card">
        <div class="value-icon">
          <i class="fas fa-bolt" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 8px #22d3ee);"></i>
        </div>
        <h3>El Cómo</h3>
        <p>La ejecución consistente y la aplicación de esa estrategia en el juego real.</p>
      </div>
    </div>
  </div>
</section>
SECTION

# Encontrar la línea exacta donde empieza "Nuestra Propuesta de Valor" y reemplazar todo el bloque
linea_inicio=$(grep -n "Nuestra Propuesta de Valor" index.html | cut -d: -f1)
linea_fin=$(grep -n -A 50 "Nuestra Propuesta de Valor" index.html | grep -E "(</section>|<!--.*Propuesta)" | head -1 | cut -d: -f1)

if [ -n "$linea_inicio" ] && [ -n "$linea_fin" ]; then
    # Reemplazar el bloque completo
    sed -i "${linea_inicio},${linea_fin}c\\" index.html
    # Insertar la nueva sección
    sed -i "${linea_inicio}r seccion-propuesta.tmp" index.html
    echo "✅ Sección reconstruida completamente"
else
    # Si no encuentra límites, añadir después de <head>
    sed -i '/<head>/r seccion-propuesta.tmp' index.html
    echo "✅ Sección añadida después de <head>"
fi

# Limpiar temporal
rm seccion-propuesta.tmp

echo "��� ¡SOLUCIÓN DEFINITIVA APLICADA!"
echo "Verifica tu página: https://metapokerone.github.io/metapoker-landing/"
