#!/bin/bash
echo "♣️  Favicon → solo trébol"
# borra cualquier favicon previo
sed -i '/<link rel="icon"/d' index.html
# inserta línea nueva justo después de <head>
sed -i '\|<head>|a\
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='\''http://www.w3.org/2000/svg'\'' viewBox='\''0 0 100 100'\''%3E%3Ctext y='\''.9em'\'' font-size='\''90'\''%3E♣️%3C/text%3E%3C/svg%3E" />' index.html
