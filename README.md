# CuasiPacman
Trabajo de algoritmia y proyecto integrado

<p align="center">
  <img  src="https://drive.google.com/drive/folders/1YbbLtNTC-FgNA4VO0qviQd6VogOcUClQ">
</p>

## Descripcion
CuasiPacman es una versión del mítico juego Pacman implementado en lenguaje Pascal.

El juego consta de una pantalla inicial donde se presenta el juego y se le pide al usuario una serie de parámetros de configuración por medio del teclado. Dichas opciones son las siguientes:

Las vidas con las que desea el uuario jugar, entre 1 y 5.
La velocicdad o retardo con el que se mueven los enemigos, entre 100 y 1000.
El color del personaje, a excepción del que viene marcado por la pica. El color seleccionado por la pica varía de forma aleatoria en cada ejecución que se realice.

Una vez configurados los parámetros se muestran las instrucciones del juego durante un período de tiempo suficiente para que el jugador pueda leerlas adecuadamente.

A continucación se muestra la pantalla inicial del juego. El personaje del jugador se mueve con las flechas del cursor mientras que los malos se mueven aleatoriamente en su búsqueda. Existe un contador de puntos que se va incrementando con cada movimiento del jugador, y un contador de tiempo que monitoriza la duración de la partida.

Cada 200 segundos aparace un trébol en una posición aleatoria del tablero. Dicho trébol es un bonus de puntuación de 100 puntos que puede ayudar a conseguir mejores resultados.

El juego finaliza cuando los villanos atrapan al jugador tantas veces como vidas tiene el jugador o cuando presiones la tecla ESC. Sin embargo, el jugador puede perder vidas voluntariamente pulsando la tecla FIN. Cada vez que el jugador y uno de los malos chocan el jugador aparece en una nueva posición del tablero totalmente aleatoria. Una vez finalizada la partida se pregunta al usuario si desea volver a jugar.




