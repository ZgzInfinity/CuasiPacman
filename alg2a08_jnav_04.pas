{ --------------------------------------------------
  ---- JUEGO GRÁFICO ----- NAVIDAD -----------------
  --------------------------------------------------
  Fase 1 - Eelaboración de los bordes y los puntos -
  Fase 2 - Creación del primer malo  ---------------
  Fase 3 - Codificación del segundo malo  ----------
  Fase 4 - Terminar el juego al presionar tecla ESC
  --------------------------------------------------
  --- Rubén Rodríguez Esteban - Nov. 2015 ----------
  --------------------------------------------------
}

program alg2a08_jnav_04;

uses CRT;

const
     TECLA_ESC = 27;
     NFIL = 24;
     NCOL = 80;
     TECLA_INI = 71;    (* Tecla inicio *)
     TECLA_ESP = 0;    (* Primer byte de tecla especial *)
     TECLA_F1 = 59;
     TECLA_F2 = 60;
     TECLA_ESPACIO = 32;
     TECLA_UP    =  72;    (* Tecla cursor arriba *)
     TECLA_DOWN  =  80;    (* Tecla cursor abajo *)
     TECLA_LEFT  =  75;    (* Tecla cursor izquierda *)
     TECLA_RIGHT =  77;    (* Tecla cursor derecha *)
     lh = #196;
     lv = #179;
     eiz = #192;
     esz = #218;
     eid = #217;
     esd = #191;
     cca = #194;
     ccb = #193;

var

     i : integer;
     j : integer;
     cmalo1 , fmalo1 , fmalo2 , cmalo2 : byte;
     final : boolean;
     tecla : char;
     cod_ascii : byte;

begin

      (* - Recorrido de las filas de la pantalla  *)


      textcolor (yellow);
      textbackground (blue);
      clrscr;

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

      (* APARICIÓN ALEATORIA DEL MALO *)

      (* Saco aleatoriamente la posición del malo1*)

      fmalo1 := random (NFIL-2) +2;          (* Obtengo la fila*)
      cmalo1 := random (NCOL-2) +2;          (* Obtengo la columna*)

      (* Saco aleatoriamente la posición del malo2*)

      fmalo2 := random (NFIL-2) +2;          (* Obtengo la fila*)
      cmalo2 := random (NCOL-2) +2;          (* Obtengo la columna*)


      final:= false;

                     repeat

                    if keypressed then                           (* Al pulsar cualquier tecla *)
        begin
             tecla := readkey;                                       (* Se guarda la tecla pulsada *)

             cod_ascii := ord (tecla);                             (* Se saca el código ascii y de la dicha tecla *)

             if cod_ascii = TECLA_ESC  then final:= true;                (* Sí el código ascii coincide con la tecla ascii, el juego para *)
        end;

          (*---------------------------------------------------------------------------------------------*)

                     gotoxy (1,25);
                     textcolor (yellow);
                     write (' Pulse la tecla ESC para terminar el programa');

                     (* Este es el malo 1 *)

                     textbackground (red);        (* Cambio el color de fondo a rojo*)
                     gotoxy(cmalo1,fmalo1);            (* Sacoel malo por pantalla, es el rectangulo rojo*)
                     write (' ');

                     delay (100);            (* Retardo de 100 milisegundos*)

                     gotoxy(cmalo1,fmalo1);       (* Con la misma posición anterior, cambio el fondo a azul, la fuente a amarillo y escribo el punto*)
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

                     delay (100);            (* Retardo de 100 milisegundos*)

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
                                                                           (* El bucle termina al pulsar la tecla ESC *)
                    until final = TRUE ;


                    textbackground(blue);
                    gotoxy (1,25); write ('Que poca paciencia tienes. Pulsa una tecla para finaliar');
  readkey;

end.
