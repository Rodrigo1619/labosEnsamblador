# Ensamblar con comando
nasm -f bin <nombre>.asm -o <nombre>.com

# abrir el dosbox
dosbox .

# En dosbox
Ejecutar debug.exe <nombre>.com

# Ver resultado del modo texto en dosbox
para poder ver si lo que escribimos se muestra de forma correcta en el modo texto, en el dosbox solamente ponemos 
nombreArchivo.com, ya no es necesario ponerle el debug.exe antes
