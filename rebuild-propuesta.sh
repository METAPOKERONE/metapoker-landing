#!/bin/bash
echo "���️ Reconstruyendo Nuestra Propuesta de Valor..."

# Backup
cp index.html index-bak-$(date +%s).html

# 1) Borra solo el bloque que quedó vacío
sed -i '/Nuestra Propuesta de Valor/,/<!-- End Propuesta -->/d' index.html

# 2) Inserta la sección completa con íconos buenos
sed -i '/Nuestra Observación Profesional/i\
<section class="section glass">\
  <div class="container">\
    <h2 class="section-title">Nuestra Propuesta de Valor</h2>\
    <div class="value-cards">\
      <div class="value-card glass-card">\
        <div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"></i></div>\
        <h3>El Porqué</h3>\
        <p>Un propósito más allá del dinero que te motive a ser un profesional.</p>\
      </div>\
      <div class="value-card glass-card">\
        <div class="value-icon"><i class="fas fa-bullseye" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"></i></div>\
        <h3>El Qué</h3>\
        <p>La estrategia correcta, sustentada por tecnologías de vanguardia.</p>\
      </div>\
      <div class="value-card glass-card">\
        <div class="value-icon"><i class="fas fa-bolt" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 8px #22d3ee);"></i></div>\
        <h3>El Cómo</h3>\
        <p>La ejecución consistente y la aplicación de esa estrategia en el juego real.</p>\
      </div>\
    </div>\
  </div>\
</section><!-- End Propuesta -->' index.html

echo "✅ Sección reconstruida con íconos alucinantes"
