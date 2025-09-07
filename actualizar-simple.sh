#!/bin/bash
echo "í´„ Actualizando METAPOKER..."
git add .
git commit -m "Update: $(date '+%F %T')"
git push origin main
echo "âœ… Â¡Subido con Ã©xito!"
