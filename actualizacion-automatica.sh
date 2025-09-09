#!/bin/bash

echo "Ì∫Ä INICIANDO ACTUALIZACI√ìN AUTOM√ÅTICA DE METAPOKER"
echo "=================================================="

# Backup de seguridad
echo "Ì≥¶ Creando backup de seguridad..."
cp index.html "index-backup-$(date +%Y%m%d-%H%M%S).html"
cp assets/css/styles.css "assets/css/styles-backup-$(date +%Y%m%d-%H%M%S).css"
echo "‚úÖ Backup creado exitosamente"

# Actualizar archivos
echo "Ì¥Ñ Actualizando archivos principales..."
cp nuevo-index.html index.html
cp nuevo-styles.css assets/css/styles.css

# Verificar si hay errores
if [ $? -eq 0 ]; then
    echo "‚úÖ Archivos actualizados correctamente"
else
    echo "‚ùå Error al actualizar archivos"
    exit 1
fi

# Git operations
echo "Ì≥§ Preparando actualizaci√≥n en GitHub..."
git add .
git commit -m "Actualizaci√≥n autom√°tica: nuevos planes sin precios fijos + mejoras SEO"

echo "Ìºê Subiendo cambios a GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "‚úÖ ¬°Actualizaci√≥n completada con √©xito!"
    echo "Ìºê Tu sitio se actualizar√° en: https://metapokerone.github.io/metapoker-landing/"
    echo ""
    echo "Ì≥ã RESUMEN DE CAMBIOS:"
    echo "‚Ä¢ Nueva secci√≥n de planes sin precios fijos"
    echo "‚Ä¢ Mejoras de SEO y meta tags"
    echo "‚Ä¢ Dise√±o m√°s profesional y adaptable"
    echo "‚Ä¢ Estructura lista para conversaciones personalizadas"
else
    echo "‚ùå Error al subir a GitHub"
    exit 1
fi

echo ""
echo "Ìæâ ¬°PROCESO COMPLETADO!"
echo "=================================================="
