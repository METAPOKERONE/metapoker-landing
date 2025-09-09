#!/bin/bash

echo "� INICIANDO ACTUALIZACIÓN AUTOMÁTICA DE METAPOKER"
echo "=================================================="

# Backup de seguridad
echo "� Creando backup de seguridad..."
cp index.html "index-backup-$(date +%Y%m%d-%H%M%S).html"
cp assets/css/styles.css "assets/css/styles-backup-$(date +%Y%m%d-%H%M%S).css"
echo "✅ Backup creado exitosamente"

# Actualizar archivos
echo "� Actualizando archivos principales..."
cp nuevo-index.html index.html
cp nuevo-styles.css assets/css/styles.css

# Verificar si hay errores
if [ $? -eq 0 ]; then
    echo "✅ Archivos actualizados correctamente"
else
    echo "❌ Error al actualizar archivos"
    exit 1
fi

# Git operations
echo "� Preparando actualización en GitHub..."
git add .
git commit -m "Actualización automática: nuevos planes sin precios fijos + mejoras SEO"

echo "� Subiendo cambios a GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ ¡Actualización completada con éxito!"
    echo "� Tu sitio se actualizará en: https://metapokerone.github.io/metapoker-landing/"
    echo ""
    echo "� RESUMEN DE CAMBIOS:"
    echo "• Nueva sección de planes sin precios fijos"
    echo "• Mejoras de SEO y meta tags"
    echo "• Diseño más profesional y adaptable"
    echo "• Estructura lista para conversaciones personalizadas"
else
    echo "❌ Error al subir a GitHub"
    exit 1
fi

echo ""
echo "� ¡PROCESO COMPLETADO!"
echo "=================================================="
