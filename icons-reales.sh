#!/bin/bash
echo "♣️ Íconos que existen en FA 6.4.0..."

# 1) Porqué → fa-heart (SÍ existe)
sed -i 's|<div class="value-icon"><i. class="fas fa-bullseye-arrow".*</div>|<div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"></i></div>|' index.html

# 2) Qué → fa-bullseye (SÍ existe)
sed -i 's|<div class="value-icon"><</div>|<div class="value-icon"><i class="fas fa-bullseye" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"></i></div>|' index.html

# 3) Cómo → fa-bolt (SÍ existe)
sed -i 's|<div class="value-icon"><i class="fas fa-bolt-lightning".*</div>|<div class="value-icon"><i class="fas fa-bolt" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 8px #22d3ee);"></i></div>|' index.html

echo "✅ Íconos reales aplicados"
