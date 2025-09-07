#!/bin/bash
echo "Reparando íconos rotos..."

# 1) Porqué → ❤️ (corazón brillante)
sed -i 's|<div class="value-icon"><i. class="fas fa-bullseye-arrow".*</div>|<div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"></i></div>|' index.html

# 2) Qué → ��� (diana + flecha)
sed -i 's|<div class="value-icon"><</div>|<div class="value-icon"><i class="fas fa-bullseye-arrow" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"></i></div>|' index.html

echo "✅ Íconos reparados"
