#!/bin/bash
echo "✨ Pulido visual premium..."

# 1) Hero: restaura aurora, logo flotante y brillo
sed -i '/<body>/a\
<div class="aurora-background" aria-hidden="true">\
  <div class="aurora-shape aurora-shape1"></div>\
  <div class="aurora-shape aurora-shape2"></div>\
</div>' index.html

# 2) Glass real + hover en cards
sed -i '/\.value-card {/,/^}/c\
.value-card {background:rgba(13,17,23,0.7);border-radius:2rem;border:1px solid rgba(255,255,255,0.05);backdrop-filter:blur(10px);transition:all 0.4s ease;will-change:transform;}\
.value-card:hover {transform:translateY(-10px) scale(1.02);border-color:#58a6ff;box-shadow:0 30px 60px rgba(0,0,0,0.4),0 0 20px rgba(88,166,255,0.5);}' index.html

# 3) Brillos exactos en íconos
sed -i 's/drop-shadow(0 0 8px/drop-shadow(0 0 12px/g' index.html
sed -i 's/font-size:3\.5rem/font-size:3.8rem/g' index.html

# 4) Títulos con sombra y kerning
sed -i '/\.section-title {/,/^}/c\
.section-title {font-family:'\''Playfair Display'\'',serif;font-size:clamp(2.5rem,5vw,4rem);font-weight:700;text-align:center;background:linear-gradient(135deg,#a5cffc 0%,#58a6ff 50%,#7c3aed 100%);-webkit-background-clip:text;background-clip:text;color:transparent;letter-spacing:-0.02em;text-shadow:0 0 40px rgba(88,166,255,0.5);margin-bottom:1.5rem;}' index.html

# 5) Botón gradiente animado + hover
sed -i '/\.btn-primary {/,/^}/c\
.btn-primary{display:inline-flex;align-items:center;gap:0.75rem;background:linear-gradient(135deg,#58a6ff,#7c3aed);color:white;padding:1.5rem 3rem;border:none;border-radius:9999px;font-weight:600;text-decoration:none;cursor:pointer;box-shadow:0 20px 50px rgba(88,166,255,0.5);font-size:1.3rem;transition:all 0.4s ease;position:relative;overflow:hidden;}' index.html
sed -i '/\.btn-primary:hover {/,/^}/c\
.btn-primary:hover{transform:translateY(-5px) scale(1.05);box-shadow:0 25px 60px rgba(88,166,255,0.7);}' index.html

# 6) Favicon siempre visible
sed -i 's|type="image/svg+xml"|type="image/svg+xml" /|' index.html

# 7) Animación suave al hacer scroll
sed -i '/<\/head>/i\<style>html{scroll-behavior:smooth;}</style>' index.html

echo "✅ Pulido premium aplicado"
