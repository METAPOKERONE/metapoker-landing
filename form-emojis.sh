#!/bin/bash
echo "� Emojis alucivos en el formulario..."

# Tu Nombre → �
sed -i 's/Tu Nombre \*/� Tu Nombre \*/g' index.html

# País → �
sed -i 's/Pais \*/� País \*/g' index.html

# Fecha y Hora → �⏰
sed -i 's/Fecha y Hora Preferida \*/�⏰ Fecha y Hora Preferida \*/g' index.html

# Cuéntanos → �
sed -i 's/Cuentanos brevemente sobre tu situacion actual \*/� Cuéntanos brevemente sobre tu situación actual \*/g' index.html

# Crear Mi Plan → �
sed -i 's/CrearMi Plan Personalizado/� Crear Mi Plan Personalizado/g' index.html

# En tu sesión descubrirás → ✨
sed -i 's/Entu sesion descubriras:/✨ En tu sesión descubrirás:/g' index.html

# Puntos clave → ✅ con brillo
sed -i 's/Como crearun plandedesarrollo personalizado/✅ Cómo crear un plan de desarrollo personalizado/g' index.html
sed -i 's/Las areasclaveque necesitasfortalecer/✅ Las áreas clave que necesitas fortalecer/g' index.html
sed -i 's/La metodologia que utilizamospara acompanarte/✅ La metodología que utilizamos para acompañarte/g' index.html

# Espacios limitados → �
sed -i 's/Espacios limitadoscadasemana/� Espacios limitados cada semana/g' index.html

echo "✅ Formulario con emojis alucinados"
