# CuasiPacman
Trabajo de algoritmia y proyecto integrado

![alt text](https://i.ibb.co/GRffY3s/Pacman-Mod.png)

## Descripción
CuasiPacman es una versión del mítico juego Pacman implementado en lenguaje Pascal.

El juego consta de una pantalla inicial donde se presenta el juego y se le pide al usuario una serie de parámetros de configuración por medio del teclado. Dichas opciones son las siguientes:

Las vidas con las que desea el uuario jugar, entre 1 y 5.
La velocicdad o retardo con el que se mueven los enemigos, entre 100 y 1000.
El color del personaje, a excepción del que viene marcado por la pica. El color seleccionado por la pica varía de forma aleatoria en cada ejecución que se realice.

![alt text](https://i.ibb.co/hByP4DS/2.jpg)

Una vez configurados los parámetros se muestran las instrucciones del juego durante un período de tiempo suficiente para que el jugador pueda leerlas adecuadamente.

![alt text](https://i.ibb.co/HgNz6zX/5.jpg)

A continucación se muestra la pantalla inicial del juego. El personaje del jugador se mueve con las flechas del cursor mientras que los malos se mueven aleatoriamente en su búsqueda. Existe un contador de puntos que se va incrementando con cada movimiento del jugador, y un contador de tiempo que monitoriza la duración de la partida.

![alt text](https://i.ibb.co/Fgs83J3/6.jpg)

![alt text](https://i.ibb.co/CtHRW26/3.jpg)

Cada 200 segundos aparace un trébol en una posición aleatoria del tablero. Dicho trébol es un bonus de puntuación de 100 puntos que puede ayudar a conseguir mejores resultados.

![alt text](https://i.ibb.co/26MFPYV/7.jpg)

El juego finaliza cuando los villanos atrapan al jugador tantas veces como vidas tiene o cuando presiones la tecla ESC. Sin embargo, el jugador puede perder vidas voluntariamente pulsando la tecla FIN. Cada vez que el jugador y uno de los malos chocan el jugador aparece en una nueva posición del tablero totalmente aleatoria. Una vez finalizada la partida se pregunta al usuario si desea volver a jugar.

![alt text](https://i.ibb.co/JRVFvkP/4.jpg)

## Ejecución
El proyecto consta de un total de 15 fases en las que se han ido añadiendo paulatinamente al juego los requisitos obligatorios. De este modo las 10 primeras fases son aspectos de ejecución obligatorios y las 5 fases restantes son mejoras adicionales.
Para poder ejecutar el programa se recomienda usar un sistema operativo Windows con un IDE para Pascal, podeís usar Dev-Pascal, cuyo instalador está comprimido en el zip devpas192.zip, facilitado en el repositorio. 

Una vez descargado, descomprimido e instalado Dev-Pascal, al abrirlo, aparece una ventana como la siguiente:

![alt text](https://i.ibb.co/BVVhHhC/IDE-pascal.png)

Para ejecutar el juego se debe seleccionar la ruta de guardado del proyecto y seleccionar uno de los ficheros de código. Si se selecciona por ejemplo la versión final, es decir, el fichero alg2a08_jnav_15.pas aparecerá algo similar a lo mostrado en esta imagen:

![alt text](https://i.ibb.co/bLcQKk8/15.png)

Para ejecutar basta con hacer click en el tick verde de la barra de herramientas del IDE y presionar el botón execute. 

![alt text](https://i.ibb.co/TwF2PDH/execute.png)

Si se desea tener una buena resolución del juego se recomienda una vez que se lanza la consola de windows configurar sus dimensiones. Para ello se debe hacer botón derecho sobre la terminal, seleccionar la opción propiedades, y dentro hacer click sobre la ventana diseño. El tamaño idóneo de la terminal es 80 de ancho y 25 de alto. 

![alt text](https://i.ibb.co/XSDmXRX/options.png)



