#!/bin/bash
echo "��� Favicon → trébol + engranaje..."
# borra línea rota
sed -i '/<link rel="icon".*⚙️.*<\/text>/d' index.html
# inserta trébol limpio
sed -i '/<head>/a\
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 100 100\'%3E%3Ctext y=\'.9em\' font-size=\'90\'%3E♣️%3C/text%3E%3C/svg%3E" />' index.html
echo "✅ Trébol como favicon"
