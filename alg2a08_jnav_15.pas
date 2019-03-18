{ --------------------------------------------------
  ---- JUEGO GRÁFICO ----- NAVIDAD -----------------
  --------------------------------------------------
  Fase 1 - Eelaboración de los bordes y los puntos -
  Fase 2 - Creación del primer malo  ---------------
  Fase 3 - Codificación del segundo malo  ----------
  Fase 4 - Terminar el juego al presionar tecla ESC
  Fase 5 - Creación del personaje bueno ------------
  Fase 6 - Contador de los movimientos del bueno ---
  Fase 7 - Terminar el juego cuando los malos cogen
  --------------------- al bueno -------------------
  Fase 8 - Validación de las vidas y final del juego
  ---------- cuando las vidas llegan a cero --------
  Fase 9 - Validación de la velocidad de los -------
  ----------------- enemigos -----------------------
  Fase 10 - Choque voluntario con la tecla FIN y ---
  --- cambio de color del malo con el que chocas ---
  Fase 11 - Cambio de color aleatorio con el malo --
  ------------ con el que te chocas ----------------
  Fase 12 - Selección al principio del color del ---
  ----------- personaje bueno ----------------------
  Fase 13 - El bueno consigue un bonus de ----------
  ------ puntuacion tras un periodo de tiempo ------
  Fase 14 - Incorporación de las instrucciones -----
  ------------------ del juego ---------------------
  Fase 15 - Pregunta si el jugador quiere volver ---
  --- a jugar y verificacion de los movimientos ----
  ------------------- validos ----------------------
  --------------------------------------------------
  --- Rubén Rodríguez Esteban - Nov. 2015 ----------
  --------------------------------------------------
}

program alg2a08_jnav_15;

uses CRT;

const
     TECLA_ESC = 27;
     NFIL = 24;
     NCOL = 80;
     TECLA_ESP = 0;    (* Primer byte de tecla especial *)
     TECLA_UP    =  72;    (* Tecla cursor arriba *)
     TECLA_DOWN  =  80;    (* Tecla cursor abajo *)
     TECLA_LEFT  =  75;    (* Tecla cursor izquierda *)
     TECLA_RIGHT =  77;    (* Tecla cursor derecha *)
     TECLA_CARITA = 184;  (* Tecla para representar la carita, es el personaje bueno*)
     CORAZON = 03;               (* Representa las vidas del bueno *)
     TECLA_FIN = 79;                 (* Controla el choque voluntario *)
     RECTANGULO = 219;            (* Reprsenta los posibles colores del bueno *)
     PICA = 06;                      (* Identifica el color que no del bueno que no puede elegir el usuario *)
     TREBOL = 05;                                (* Representa el bonus *)



      (* Constantes para hacer el los bordes del terreno de juego *)
     lh = #196;
     lv = #179;
     eiz = #192;
     esz = #218;
     eid = #217;
     esd = #191;

var

     i : integer;                                (* Variable que indica las filas *)
     j : integer;                                 (* Variable que indica las columnas *)
     cmalo1 , fmalo1 , fmalo2 , cmalo2 : byte;    (* Coordenadas de los personajes malos *)
     cbueno , fbueno : byte;     (* Coordenadas del personaje bueno *)
     final : boolean;         (* Variable lógica que condiciona el final del juego *)
     tecla : char;           (* Variable que indica si se pulsa alguna tecla *)
     per_usu : char;          (* Es la varible para representar el personaje que maneja el usuario *)
     cod_ascii : byte;         (* Variable que guarda los codigos ascii de las teclas pulsadas *)
     puntos : integer;      (* Variable que controla las veces que se mueve el personaje bueno *)
     exterminado : boolean;       (* Variable que controla si las vidas se agotan *)
     exito : boolean;              (* Variable que controla si se supera el límite de puntos*)
     vidas : integer;             (* Variable que lleva la cuenta de las vidas que tiene el personaje bueno *)
     retardo : integer;           (* Variable controla el retardo en milisegundos *)
     camaleon: byte;            (* Controla el cambio aleatorio de color del malo tras chocar voluntariamente con el bueno *)
     colc : byte;            (* Variable que controla la columna donde se colocan los colores posibles del personaje bueno *)
     color_per : byte;             (* Color del personaje bueno *)
     color_imp : byte ;           (* Color que no se puede elegir para el personaje bueno*)
     tiempo : integer;        (* Controla el tiempo que lleva jugando el usuario *)
     cbonus , fbonus : byte ;    (* Coordenadas de los bonus *)
     repetir : char;               (* Controla si el jugador quiere volver a jugar *)



begin

      repeat   (* Este REPEAT controla el bucle de repeticion del juego si el usuario presiona la tecla S *)

      (* FASE DE ENTRADA *)

     (* Pantalla inicial del juego *)

     textbackground (black);
     textcolor (white);
     clrscr;

      for i:= 1 to 3 do
          for j:= 1 to NCOL do write ('*');

      gotoxy (10,2);
      write (' Juego de Navidad - PACMAN - Ruben Rodriguez ');


     (* Bucle de la validación de las vidas *)

     {$I-}
     Repeat
        gotoxy (5,9); clreol;
        write (' Introduce las vidas a utilizar (1..5) --> ');
        readln (vidas);
     until (IORESULT = 0)  and (vidas > 0) and (vidas <= 5);
     {$I+}


     (* Finaliza cuando la varible vidas sea mayor que cero y menor o igual que cinco *)



     (* Bucle de la validación de las vidas *)

     {$I-}
     Repeat
        gotoxy (5,11); clreol;
        write (' Introduce los milisegundos de retardo (100..1000) --> ');
        readln (retardo);
     until (IORESULT = 0)  and (retardo >= 100) and (vidas <= 1000);
     {$I+}

      (* Aleatotiamente, selecciono el color que el usuario mo va a poder escoger de personaje *)


      randomize;
      color_imp:= random (16);
      colc:= 7;

      (* Esteblezco los tipos posibles de colores que el usuaio puede elegir *)

     for i:= 0 to 15 do
      begin
         textcolor (white);
         textbackground (black);
         gotoxy (colc,13); write (i:2);

         textcolor (i);
         gotoxy (colc+1,14); write (chr(RECTANGULO));

         if i = color_imp then
         begin
          textcolor (white);
          textbackground (black);
          gotoxy (colc+1,16); write (chr (PICA));
         end;
         colc:= colc + 4;

      end;

      (* Bucle de validacon del color del personaje *)


      {$I-}
      repeat
            gotoxy (5,18);clreol;
            write ( ' Introduce el numero del color <> al de la pica --> ' );
            readln ( color_per);
      until (IORESULT=0) and (color_per>=0) and (color_per<=15) and (color_per <> color_imp );
      {$I+}

      textbackground (blue);

      clrscr;       (* Limpio la pantalla y creo el ñas instrucciones de juego *)

       (* FASE PROCESO *)


     (* Finaliza cuando la varible vidas sea mayor que cero y menor o igual que cinco *)


      gotoxy (10,2); write   ('   *******   ******  ******  ***          ****        ****** ');
      gotoxy (10,3); write   ('   **   ***  ***     ******  ***         ******       **     ');
      gotoxy (10,4); write   ('   **  **    *****   **      ***        ***  ***      ****** ');
      gotoxy (10,5); write   ('   *****     ******  ** ***  ***       **********     ****** ');
      gotoxy (10,6); write   ('   *******   *****   **  **  ******    ************   ****** ');
      gotoxy (10,7); write   ('   **  ****  **      ******  ******   ****      ****      ** ');
      gotoxy (10,8); write   ('   **  ***** ******  ******  ******  *****       **** ****** ');

      textcolor (white);

      (* Escribo las instrucciones *)

      gotoxy (3,10);  write (' Tu personaje se mueve con las flechas del cursor ');

      gotoxy (3,12);  write (' Las vidas se representan con corazones, si te pillan los malos pierdes vidas ');

      gotoxy (3,14);  write (' Pulsa tecla ESC para finalizar siempre que quieras');

      gotoxy (3,16);  write (' Pulsa la tecla FIN para chocarte contra un malo ');

      gotoxy (3,18);  write (' Si consigues llegar a 1500 puntos ganas la partida ');

      gotoxy (3,20);  write (' Si se te agotan las vidas pierdes.');

      gotoxy (3,22);  write (' Cada 200 segundos aparecera un bonus, si lo coges sumaras 100 puntos mas ');

      delay (9000);           (* Espero estos milisegundos *)

      clrscr;

      (* Vuelvo a limpiar la pantalla, y con este bucle FOR, simulo que el juego está cargando *)

      textcolor (yellow);
      gotoxy (5,21); write ('CARGANDO');

      gotoxy (5,23);
      for i:= 5 to NCOL - 2 do
      begin

                 gotoxy (i,23);
                 write ('.');

                 delay (100);

      end;



     (* COMIENZA EL JUEGO *)


      clrscr;


      (* - Recorrido de las filas de la pantalla  *)

       (**********************************************)
       (****** DIBUJO DEL BORDE DE LA PANTALLA *******)
       (**********************************************)


       (* Elaboración del borde horizontal de arriba*)

       write (esz);
       for i:= 2 to NCOL-1 do write (lh);
       write (esd);

       (* Creación de las líneas verticales del borde *)

       for i:= 2 to NFIL-1 do
       begin
             gotoxy(1,i); write (lv);
             gotoxy (NCOL,i); write (lv);
       end;

       (* Elaboración del borde horizontal de abajo*)

       write (eiz);
       for i:= 2 to NCOL-1 do write (lh);
       write (eid);

       i:=2;
       for i:= 2 to NFIL - 1  do
       begin
              j:=2;
              for j:= 2 to NCOL - 1 do
              begin
                  gotoxy (j,i);       (* Coloco los puntos en el recinto *)
                  write ('.');
              end;
      end;

      (* Se dejan de escribir los puntos cuando la posicion es la de los bordes*)

       tiempo:= 0;               (* Inicializo el tiempo de juego a cero*)
       puntos:= 0;                 (* Inicializo los puntos a cero *)
       final:= FALSE;
       exito:= FALSE;               (* Configuro las variables lógicas a FALSE *)
       exterminado:= FALSE;



      (* APARICIÓN ALEATORIA DEL MALO *)

      (* Saco aleatoriamente la posición del malo1*)

      fmalo1 := random (NFIL-2) +2;          (* Obtengo la fila*)
      cmalo1 := random (NCOL-2) +2;          (* Obtengo la columna*)

      (* Saco aleatoriamente la posición del malo2*)

      fmalo2 := random (NFIL-2) +2;          (* Obtengo la fila*)
      cmalo2 := random (NCOL-2) +2;          (* Obtengo la columna*)

       (* Saco aleatoriamente la posición del bueno*)

      randomize;

      fbueno := random (NFIL-2) +2;          (* Obtengo la fila*)
      cbueno := random (NCOL-2) +2;          (* Obtengo la columna*)
      per_usu:= chr (TECLA_CARITA);

      textbackground (red);                             (* Escribo el malo1*)

      gotoxy (cmalo1,fmalo1);      write (' ');
      gotoxy (cmalo2,fmalo2);      write (' ');         (* Escribo el malo2*)

      textbackground (blue);
      textcolor (color_per);
      gotoxy (cbueno,fbueno);      write (per_usu);        (* Escribo el personaje bueno con el color seleccionado por el usuario*)

      textcolor (white);

      gotoxy (70,25);
      write (puntos);                 (* Escribo los puntos y las vidas *)

        gotoxy (74,25); clreol;
           for i:= 1 to vidas do
           begin
           textcolor (lightred);
           write (chr(corazon));
           end;


      textcolor (yellow);
      gotoxy (1,25);
      write (' Pulse una tecla para comenzar el juego'); readkey;   (* Lo mantengo hasta que se pulsa una tecla *)



                     repeat

                    (* El tiempo se va sumando progresivamente al empezar a jugar *)

                    tiempo:= tiempo + 1;
                    delay (2);

                    if ( tiempo mod 200 = 0 ) then         (* Cada 100 segundos aparece un bonus en el tablero de juego *)

                    begin
                    fbonus := random (NFIL-2) +2;          (* Obtengo la fila del bonus*)
                    cbonus := random (NCOL-2) +2;          (* Obtengo la columna del bonus*)

                    textcolor (lightgreen);
                    gotoxy (cbonus , fbonus);          (* Escribo en la posicion aleatoria el trebol, es decir, el bonus *)
                    write (chr (trebol));


                    end;

                    if (cbueno = cbonus) and (fbueno = fbonus) then              (* Si el bueno coge el bonus *)
                    begin
                    textcolor (lightgreen);
                    puntos:= puntos + 100;
                    gotoxy (47,25); clreol;
                    write ('* BONUS *');
                    delay (500);
                    gotoxy (47,25); clreol;
                    write ('         ');
                    end;

                    textcolor (color_per);

                    if keypressed then
           begin
              tecla:= readkey;       (* Capturo la tecla pulsada *)
              cod_ascii := ord(tecla);  (* Me guardo el ASCII *)

              case cod_ascii of

                 TECLA_ESC  : final:= TRUE;          (* Control de la tecla ESC *)

                 TECLA_ESP :  (* Tecla especial *)

                  (* Codifico las teclas del cursor para que el usuario maneje al personaje  bueno *)

                    begin
                       case ord(readkey) of
                          TECLA_UP    : begin             (* Si se pulsa la tecla flecha arriba*)

                                          gotoxy (cbueno , fbueno);  (*  En la posición en la que está antes de pulsar escribo espacio en blanco *)
                                          write (' ');

                                          fbueno:= fbueno - 1;           (* a la fila actual, se le resta 1,se mueve hacia arriba *)

                                          if fbueno = 1 then
                                          begin
                                          fbueno:= 2;   (* Al tocar el borde superior, se queda parada en la fila 2, no sigue subiendo *)
                                          puntos:= puntos;
                                          end
                                          else
                                          puntos:= puntos + 1;

                                          gotoxy (cbueno , fbueno);     (* En la posición modificada, y escribo la carita*)
                                          write (per_usu);



                                        end;
                          TECLA_DOWN  : begin           (* Si se pulsa la tecla flecha abajo*)

                                           gotoxy (cbueno , fbueno);  (*  En la posición en la que está antes de pulsar escribo espacio en blanco *)
                                           write (' ');

                                           fbueno:= fbueno + 1;                            (* a la fila actual, se le suma 1,se mueve hacia abajo *)

                                           if fbueno = NFIL then
                                           begin
                                           fbueno:= NFIL - 1;       (* Al tocar el borde inferior, se queda parada en la fila 23, no sigue subiendo *)
                                           puntos:= puntos;
                                           end
                                           else
                                           puntos:= puntos + 1;

                                           gotoxy (cbueno , fbueno);      (*En la posición modificada, y escribo la carita*)
                                           write (per_usu);


                                        end;
                          TECLA_RIGHT    : begin             (* Si se pulsa la tecla flecha derecha *)

                                           gotoxy (cbueno , fbueno);       (*  En la posición en la que está antes de pulsar escribo espacio en blanco *)
                                           write (' ');

                                           cbueno:= cbueno + 1;                      (* a la columna actual, se le suma 1,se mueve hacia la derecha *)

                                           if cbueno = NCOL then
                                           begin
                                           cbueno:= NCOL - 1;  (* Al tocar el lateral derecho, se queda parada en la columna 79, no sigue moviendose*)
                                           puntos:= puntos;
                                           end
                                           else
                                           puntos:= puntos + 1;

                                           gotoxy (cbueno , fbueno);         (*En la posición modificada, y escribo la carita*)
                                           write (per_usu);



                                        end;
                          TECLA_LEFT  : begin                 (* Si se pulsa la tecla flecha izquierda  *)

                                           gotoxy (cbueno , fbueno);       (*  En la posición en la que está antes de pulsar escribo espacio en blanco *)
                                           write (' ');

                                           cbueno:= cbueno - 1;                   (* a la columna actual, se le resta 1,se mueve hacia la izquierda *)

                                           if cbueno = 1 then
                                           begin
                                           cbueno:= 2;        (* Al tocar el lateral izquierdo, se queda parada en la columna 2, no sigue moviendose*)
                                           puntos:= puntos;
                                           end
                                           else
                                           puntos:= puntos + 1;

                                           gotoxy (cbueno , fbueno);              (*En la posición modificada, y escribo la carita*)
                                           write (per_usu);



                                        end;
                          TECLA_FIN  : begin

                                           camaleon:= random(16);                (* Si choca el malo, cambia de color aleatoriamente *)
                                           textbackground (blue);
                                           gotoxy ( cbueno , fbueno );
                                           write (' ');

                                           cbueno:= cmalo1;
                                           fbueno:= fmalo1;

                                           textcolor (camaleon);
                                           gotoxy ( cbueno , fbueno );
                                           write (per_usu);

                                           vidas:= vidas - 1;     (* Las vidas van descencidendo cada vez que te coge uno de los malos *)
                                           textcolor (lightgreen);

                                           gotoxy (47,25);
                                           write ('* PERDISTE UNA VIDA*');
                                           delay (500);
                                           gotoxy (47,25);
                                           write ('                    ');

                                           textcolor (yellow);
                                           gotoxy (cbueno , fbueno);       (* En la posicion donde ye ha pillado, se ecribe punto*)
                                           write ('.');

                                           fbueno := random (NFIL-2) +2;             (* Actualizo una nueva posicion aleatoria*)
                                           cbueno := random (NCOL-2) +2;

                                           textcolor (color_per);

                                           gotoxy (cbueno , fbueno);             (* Escribo la carita*)
                                           write (per_usu);

                                           puntos:= puntos + 1;
                                       end;
                       end;
                    end;
              end;
           end;

           (* Escribo los puntos y las vidas y el tiempo que va llevando el personaje bueno *)

           gotoxy (1,25);
           textcolor (yellow);
           write (' Pulse la tecla ESC para terminar el programa');
           textcolor (white);
           gotoxy (60,25);    write (tiempo);
           gotoxy (70,25);    write (puntos);



           (* Bucle FOR para las vidas, se representan con los corazones *)

           gotoxy (74,25); clreol;
           for i:= 1 to vidas do
           begin
           textcolor (lightred);
           write (chr(corazon));
           end;

          (*---------------------------------------------------------------------------------------------*)

                     (* Este es el malo 1 *)

                     textbackground (red);        (* Cambio el color de fondo a otro aleatorio *)
                     gotoxy(cmalo1,fmalo1);            (* Sacoel malo por pantalla, es el rectangulo rojo*)
                     write (' ');

                     delay (retardo);            (* Retardo de los milisegundos específicados por el usuario*)

                     gotoxy(cmalo1,fmalo1);    (* Con la misma posición anterior, cambio el fondo a azul, la fuente a amarillo y escribo el punto*)
                     textbackground (blue);

                     textcolor (yellow);
                     write ('.');

                     fmalo1 := random (NFIL-2) +2;          (* Actualizo la posición anterior , columna y fila , y escribo el malo de nuevo*)
                     cmalo1 := random (NCOL-2) +2;

                     gotoxy(cmalo1,fmalo1);
                     TextBackGround (red);
                     write (' ');

         (*-----------------------------------------------------------------------------------------------------------------------*)

                     (* Este es el malo 2 *)


                     gotoxy(cmalo2,fmalo2);            (* Sacoel malo por pantalla, es el rectangulo blanco*)
                     write (' ');

                     delay (retardo);            (* Retardo de los milisegundos específicados por el usuario*)

                     gotoxy(cmalo2,fmalo2);       (* Con la misma posición anterior, cambio el fondo a azul, la fuente a amarillo y escribo el punto*)
                     textbackground (blue);
                     textcolor (yellow);
                     write ('.');

                     fmalo2 := random (NFIL-2) +2;          (* Actualizo la posición anterior , columna y fila , y escribo el malo de nuevo*)
                     cmalo2 := random (NCOL-2) +2;

                     gotoxy(cmalo2,fmalo2);
                     TextBackGround (red);
                     write (' ');


                     textbackground (blue);
                     textcolor (lightgreen);

              (*-----------------------------------------------------------------------*)

                      (* Validación de la segunda posibilidad de que se termine el juego, los malos cazan al bueno *)


                      if ((cbueno = cmalo1) or (cbueno = cmalo2)) and ((fbueno = fmalo1) or (fbueno = fmalo2)) then
                      begin
                      vidas:= vidas - 1;                               (* Las vidas van descencidendo cada vez que te coge uno de los malos *)

                      gotoxy (47,25);                                 (* Es el mismo codigo que cuando se pulsa la tecla FIN, en su mayor parte,
                                                                         intente no  repetirlo, pero me daba errores. Compilaba bien pero no iba
                                                                         como debia ir *)
                      write ('* PERDISTE UNA VIDA*');
                      delay (500);
                      gotoxy (47,25);
                      write ('                    ');

                      textcolor (yellow);
                      gotoxy (cbueno , fbueno);       (* En la posicion donde ye ha pillado, se ecribe punto*)
                      write ('.');

                      fbueno := random (NFIL-2) +2;             (* Actualizo una nueva posicion aleatoria*)
                      cbueno := random (NCOL-2) +2;

                      textcolor (color_per);
                      gotoxy (cbueno , fbueno);             (* Escribo la carita*)
                      write (per_usu);

                      end;


                      if (puntos >= 1500) then       (* Si se alcanza el limite de puntos maximo *)
                      begin
                      exito:= TRUE;                   (* Termina el juego*)
                      end;

                      if vidas = 0 then              (* Si se agotan las vidas *)
                      begin
                      exterminado:= TRUE;                 (* Tambien acaba el juego *)
                      end;
                                                     (* El bucle termina al pulsar la tecla ESC,
                                                        o si las vidas son igual a cero o si se supera el limite de puntuacion *)

                     until (final = TRUE) or (exito = TRUE) or (exterminado = TRUE);


                     (* FASE FINAL *)

                     (* Los mensajes que saco por pantalla en funcion de como ha finalizzado el juego*)

                     textcolor (yellow);

                     if final = TRUE then
                     begin
                     gotoxy (1,25); clreol;
                     write (' Que poca paciencia tienes.');
                     end
                     else
                     if exterminado = TRUE then
                     begin
                     gotoxy (1,25); clreol;
                     write (' Lo siento,las vidas se te han agotado.');
                     end
                     else
                     if exito = TRUE then
                     begin
                     gotoxy (1,25); clreol;
                     write (' ENHORABUENA, has conseguido completar la maxima puntuacion.');
                     end;


                     clrscr;   (* Limpio la pantalla *)

                     gotoxy (20,10);             write (' *****');
                     gotoxy (20,11);            write ('***** ');
                     gotoxy (20,12);           write ('****         **     **       ');
                     gotoxy (20,13);            write ('*****       **     **       ');
                     gotoxy (20,14);            write ('  ****');



                     (* Bucle de validación semántica para controlar si el usuario quiere volver a jugar *)

                     repeat

                        gotoxy (10,8); clreol;
                        write ( ' Deseas volver a jugar al PACMAN , pulse la tecla S (SI) o N (NO)');               (* Aquí se hace la pregunta de si se quiere volver a jugar *)
                        repetir:= upcase (readkey);
                        write (repetir);

                     until (repetir ='S') or (repetir ='N');


                     until ( repetir = 'N');

                     gotoxy (1,25);  write (' Pulsa una tecla para finalizar');

  readkey;

end.
