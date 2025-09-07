#!/bin/bash
echo "��� Upgrading Propuesta de Valor icons..."

# 1) El PORQUÉ → corazón de diamante (poker + pasión)
sed -i 's/<div class="value-icon"><i class="fas fa-gem".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 8px #e11d48);"><\/i><\/div>/' index.html

# 2) El QUÉ → diana con flecha (precisión, estrategia)
sed -i 's/<div class="value-icon"><i class="fas fa-bullseye".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-bullseye-arrow" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 8px #f59e0b);"><\/i><\/div>/' index.html

# 3) El CÓMO → rayo en círculo (ejecución, energía)
sed -i 's/<div class="value-icon"><i class="fas fa-bolt".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-bolt-lightning" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 8px #22d3ee);"><\/i><\/div>/' index.html

echo "✅ Iconos alucinosos aplicados"
