#!/bin/bash
echo "� Actualizando METAPOKER..."
git add .
git commit -m "Update: $(date '+%F %T')"
git push origin main
echo "✅ ¡Subido con éxito!"
