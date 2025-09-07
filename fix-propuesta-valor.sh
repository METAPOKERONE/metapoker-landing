#!/bin/bash
echo "í´¥ Upgrading Propuesta de Valor icons..."

# 1) El PORQUÃ‰ â†’ â¤ï¸â€í´¥ corazÃ³n de diamante (pasiÃ³n + poker)
sed -i 's/<div class="value-icon"><i class="fas fa-gem".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-heart" style="font-size:3.5rem;color:#e11d48;filter:drop-shadow(0 0 10px #e11d48);"><\/i><\/div>/' index.html

# 2) El QUÃ‰ â†’ í¾¯ flecha clavada en diana (precisiÃ³n, estrategia)
sed -i 's/<div class="value-icon"><i class="fas fa-bullseye".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-bullseye-arrow" style="font-size:3.5rem;color:#f59e0b;filter:drop-shadow(0 0 10px #f59e0b);"><\/i><\/div>/' index.html

# 3) El CÃ“MO â†’ âš¡ rayo elÃ©ctrico (ya te gusta; solo reforzamos brillo)
sed -i 's/<div class="value-icon"><i class="fas fa-bolt".*<\/i><\/div>/\
        <div class="value-icon"><i class="fas fa-bolt-lightning" style="font-size:3.5rem;color:#22d3ee;filter:drop-shadow(0 0 10px #22d3ee);"><\/i><\/div>/' index.html

echo "âœ… Propuesta de Valor Â¡alucinante!"
