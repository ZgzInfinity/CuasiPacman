{ --------------------------------------------------
  ---- JUEGO GR�FICO ----- NAVIDAD -----------------
  --------------------------------------------------
  Fase 1 - Eelaboraci�n de los bordes y los puntos -
  --------------------------------------------------
  --- Rub�n Rodr�guez Esteban - Nov. 2015 ----------
  --------------------------------------------------
}

program alg2a08_jnav_01;

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


begin

      (* - Recorrido de las filas de la pantalla  *)


      textcolor (yellow);
      textbackground (blue);
      clrscr;

       (**********************************************)
       (****** DIBUJO DEL BORDE DE LA PANTALLA *******)
       (**********************************************)


       (* Elaboraci�n del borde horizontal de arriba*)

       write (esz);
       for i:= 2 to NCOL-1 do write (lh);
       write (esd);

       (* Creaci�n de las l�neas verticales del borde *)

       for i:= 2 to NFIL-1 do
       begin
             gotoxy(1,i); write (lv);
             gotoxy (NCOL,i); write (lv);
       end;

       (* Elaboraci�n del borde horizontal de abajo*)

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

      readkey;
end.
