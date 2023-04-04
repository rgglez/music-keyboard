PROGRAM TECLADO_CON_SONIDO_Y_MELODIAS_PROGRAMADAS;
USES
   Crt,Graph,Dos;
CONST
     Right  = #77;
     Left   = #75;
     Up     = #72;
     Down   = #80;
     Return = #13;
     Esc    = #27;
     Punto  = #46;
VAR
   File_1:Text;
   File_2:Text;
   File_3:Text;
   File_4:Text;
   Filename:String [50];
   M: Integer;
   OPCION : Char;
   X,X1,P:Integer;
   Nombre: Array [1..40] of String [40];


                           (* GRAFICAS *)

Procedure Modo_Grafico;
Var
   Gd, Gm : Integer;
Begin
   Gd := Detect; InitGraph(Gd, Gm, '');
   If GraphResult <> grOk then Halt(1);
End;

(* Procedure Lee_flecha;
   Var
       Col, Ren : Integer;
   Begin
      Repeat
      Col := Columna;
      Ren := Pos_ren;
      Flecha := ReadKey;
      N_gotoxy(2,23, 36,'.............................................................................');
      If Flecha IN [Right,Left,Up,Down,Esc,Punto] Then
          A_gotoxy(Columna,Pos_Ren+7,36,'.........');
      Case Flecha of
      Right : Begin
                Pos_Col := Succ(Pos_Col);
                If Pos_Col > 4 Then Pos_Col := 1;
              End;
      Left  : Begin
                Pos_Col := Pred(Pos_Col);
      If Pos_Col < 1 Then Pos_Col := 4;
           End;
      Up    : Begin
                Pos_Ren := Pred(Pos_Ren);
                If Pos_Ren < 1 Then Pos_Ren := 12;
              End;
      Down  : Begin
                Pos_Ren := Succ(Pos_Ren);
                If Pos_Ren > 12 Then Pos_Ren := 1;
              End;
  End; { Case }

           Coloca el Cursor en Renglon y Columna Correspondiente

  Case Pos_Col of
    1 : Columna := 11;
    2 : Columna := 30;
    3 : Columna := 49;
    4 : Columna := 68;
  End; { Case }

  A_gotoxy(Columna,Pos_Ren+7,120,'         ');

  A_gotoxy(Col,Ren+7,36,'.........');

  Until Flecha In [Return,Esc,Punto];
End; { Lee_flecha }
*)

Procedure OpenFile;
Var
   Ok:Boolean;
Begin
   Repeat
      Assign (File_1,'A:PSS795PT.DAT');
      (*$I-*)
      Reset (File_1);
      (*$I+*)
      Ok := (Ioresult = 0);
      If not Ok then Writeln ('El archivo no existe');
   Until Ok;
End;


Procedure OpenFile_Salida;
Var
   Ok:Boolean;
Begin
   Repeat
      Assign (File_3,'A:STAFF.DAT');
      (*$I-*)
      Reset (File_3);
      (*$I+*)
      Ok := (Ioresult = 0);
      If not Ok then Writeln ('El archivo no existe');
   Until Ok;
End;


Procedure Marco (x1,y1,x2,y2:Integer);
     Begin
       x1 :=  x1;
       y1 :=  y1;
       x2 :=  GetMaxX;
       y2 :=  GetMaxY;
       SetLineStyle (SolidLn,0,ThickWidth);
       Rectangle (x1,y1,x2,y2);
     End;



(* PINTA TECLAS *)

Procedure DoFaP (Xad : Integer);
   Const
      Tecla:Array[1..6] of PointType = ((x:173; y:161),
                                        (x:181; y:161),
                                        (x:181; y:191),
                                        (x:185; y:191),
                                        (x:185; y:213),
                                        (x:173; y:213));
   Begin
      SetFillStyle (SolidFill,5);
      FillPoly (SizeOf (Tecla) div SizeOf (PointType),Tecla);
   End;

(* DESPINTA TECLAS *)

Procedure DoFaD (Xad : Integer);
   Const
      Tecla:Array[1..6] of PointType = ((x:173; y:161),
                                        (x:181; y:161),
                                        (x:181; y:191),
                                        (x:185; y:191),
                                        (x:185; y:213),
                                        (x:173; y:213));
   Begin
      SetFillStyle (EmptyFill,0);
      FillPoly (SizeOf (Tecla) div SizeOf (PointType),Tecla);
   End;

Procedure Dibuja;
Var
    X1,  Y1, X2, Y2, Radio, K: Integer;
Begin
   OPENFILE;
   ClearDevice;
      While Not EOF (File_1) Do
     Begin
       Readln(File_1,X1,Y1,X2,Y2);
       Line(X1+50,Y1,X2+50,Y2);
     End;
   Close(FILE_1);
   Marco (1,1,718,347);
   Radio := 51;
   For K := 1 TO 50 Do
      Begin
         Circle (160,102,Radio);
         Circle (550,102,Radio);
         Radio := Radio-3;
      End;
    Circle (236,93,11);
    Radio :=4;
    For K := 1 TO 10 Do
       Begin
          Circle (236,93,Radio);
          Radio := Radio-1;
       End;
    SetTextStyle (SmallFont,HorizDir,4);
    MoveTo (135,218);
    OutText ('YAMAHA');
    MoveTo (564,218);
    OutText ('AWM');
    SetLineStyle  (SolidLN,0,NormWidth);
    Line (130,270,580,270);
    Line (130,275,580,275);
    Line (130,280,580,280);
    Line (130,285,580,285);
    Line (130,290,580,290);
End;


Procedure Estrella;
  Var
     X1,X2,X3,X4,X5,Y1,Y2,Y3,Y4,Y5,CPx,CPy,K:Integer;
     Angulo1,Angulo2,Angulo3,Angulo4,Angulo5:Real;
     Radio:Real;
  Const
     Incremento = 15;
     Decremento =  5;
  Begin
     CPx := GetMaxX Div 2;
     CPy := GetMaxY Div 2+30;
     Radio := 70;
     Angulo1 :=270; Angulo2 :=342; Angulo3 :=414; Angulo4 :=486; Angulo5 :=558;
     Angulo1 := (Angulo1*0.017453292);
     Angulo2 := (Angulo2*0.017453292);
     Angulo3 := (Angulo3*0.017453292);
     Angulo4 := (Angulo4*0.017453292);
     Angulo5 := (Angulo5*0.017453292);
     For K := 1 To 25 Do
        Begin
          X1 := Round (Radio * Cos (Angulo1));   Y1 := Round (Radio * Sin (Angulo1));
          X2 := Round (Radio * Cos (Angulo2));   Y2 := Round (Radio * Sin (Angulo2));
          X3 := Round (Radio * Cos (Angulo3));   Y3 := Round (Radio * Sin (Angulo3));
          X4 := Round (Radio * Cos (Angulo4));   Y4 := Round (Radio * Sin (Angulo4));
          X5 := Round (Radio * Cos (Angulo5));   Y5 := Round (Radio * Sin (Angulo5));
          Line (CPx+X1,CPy+Y1,CPx+X3,CPy+Y3);
          Line (CPx+X3,CPy+Y3,CPx+X5,CPy+Y5);
          Line (CPx+X5,CPy+Y5,CPx+X2,CPy+Y2);
          Line (CPx+X2,CPy+Y2,CPx+X4,CPy+Y4);
          Line (CPx+X4,CPy+Y4,CPx+X1,CPy+Y1);
          Angulo1:=Angulo1 + Incremento;
          Angulo2:=Angulo2 + Incremento;
          Angulo3:=Angulo3 + Incremento;
          Angulo4:=Angulo4 + Incremento;
          Angulo5:=Angulo5 + Incremento;
          Radio := Radio - Decremento;
        End;
   End;


Procedure Marco2 (X1,Y1,X2,Y2:Integer);
   Var
     XX,YY:Integer;
Begin
   X1 := X1;
   X2 := X2;
   Y1 := Y1;
   Y2 := Y2;
   For XX := X1 To X2 DO
     Begin
       GotoXY (XX,Y1); Write ('Í');
       GotoXY (XX,Y2); Write ('Í');
     End;
   For YY := Y1 To Y2 DO
     Begin
       GotoXY (X1,YY); Write ('º');
       GotoXY (X2,YY); Write ('º');
     End;
       GotoXY (X1,Y1); Write ('É');
       GotoXY (X2,Y1); Write ('»');
       GotoXY (X2,Y2); Write ('¼');
       GotoXY (X1,Y2); Write ('È');
End;

Procedure Ayuda;
   Begin
     ClrScr;
      MARCO2 (1,1,79, 3);
      GotoXY ( 5,2); Writeln ('                     AYUDA DE TECLADOMANIA PSS-795              ');
      GotoXY ( 5,5); Writeln ('    EN EL MODO DE MELODIAS PREPROGRAMADAS:                      ');
      GotoXY ( 5,7); Writeln ('        DE EL NUMERO DE LA MELODIA DESEADA. SI SE INSTALA EN    ');
      GotoXY ( 5,8); Writeln ('        UN DISCO DE 3 1/2, TODOS LOS ARCHIVOS ESTARAN           ');
      GotoXY ( 5,9); Writeln ('        EN DICHO DISCO. PROCURE NO ABORTAR LA EJECUCION DE UN   ');
      GotoXY (5,10); Writeln ('        SONIDO, CON CTRL-C, DEBIDO A QUE LA BOCINA CONTINUARA   ');
      GotoXY (5,11); Writeln ('        ENCENDIDA. SI SUCEDE ESTO CORRA OTRA VEZ EL PROGRAMA.   ');
      GotoXY (5,13); Writeln ('    EN EL MODO DE TECLADO CON SONIDO:                           ');
      GotoXY (5,15); Writeln ('        EL TECLADO DEBE ESTAR EN ESPANOL. USE EL COMANDO KEYB   ');
      GotoXY (5,16); Writeln ('        SP,437 PARA CAMBIARLO SI ES QUE NO ENTRO CON TECEXEC.   ');
      GotoXY (5,17); Writeln ('        LA CONFIGURACION DE LOS TECLADOS PUEDE VARIAR, ALTE-    ');
      GotoXY (5,18); Writeln ('        RANDO LAS NOTAS. EL TECLADO PARA EL QUE ESTA PROGRA--   ');
      GotoXY (5,19); Writeln ('        MADO ES UN BTC5349.                                     ');
      GotoXY (50,22); Writeln ('PRESIONE CUALQUIER TECLA ');
      MARCO2 (1,1,79,24);
    Repeat Until KeyPressed;
  End;

 Procedure Especificaciones;
   Begin
      ClrScr;
      MARCO2 (1,1,79,24);
      MARCO2 (1,1,79, 3);
      GotoXY (22, 2); Writeln ('ESPECIFICACIONES DEL YAMAHA PSS-795');
      GotoXY ( 9, 5); Writeln ('No. de Teclas: 61.  No. de Voces: 100. No. de Ritmos:50.');
      GotoXY ( 9, 7); Writeln ('Generador de Tonos: AWM (Avanced Wave of Memory).');
      GotoXY ( 9, 9); Writeln ('Generador de Ritmos: PCM (Pulse Code Modulation).');
      GotoXY ( 9,11); Writeln ('Vector Sintetizador. Secuenciador Digital de 8 pistas.');
      GotoXY ( 9,13); Writeln ('Sonido Estereofonico. Refuerzo de Bajos. Auto Acompa¤amiento.');
      GotoXY ( 9,15); Writeln ('(ABC). AutoArmonia de 6 tipos. Pads de Bateria: 8');
      GotoXY ( 9,17); Writeln ('Reverberaci¢n. Vibrato. Pitch Bender. Sistema MIDI 1.1');
      GotoXY ( 9,19); Writeln ('Transporte Tonal. Afinaci¢n Fina. Polifonia: 28 notas en');
      GotoXY ( 9,21); Writeln ('modo normal.');
      GotoXY (50,22); Writeln ('PRESIONE CUALQUIER TECLA ');
      Repeat Until KeyPressed;
   End;

Procedure Encabezado;
   Var
      Pincel:Array [1..79,1..24] of Char;
      X,Y:Integer;
   Begin
      Clrscr;
      For X := 1 to 79 do
      For Y := 1 to 24 do
         Begin
            Pincel [X,Y] := 'Û';
            GotoXY (X,Y);   Write   (Pincel[X,Y]);
            Writeln;
         End;
      GotoXY (28,10); Writeln (' C.R.E.O. Producciones ');
      GotoXY (28,12); Writeln ('       Presenta...     ');
      Delay (5000);
      Clrscr;
   End;


Procedure Portada;
   Var
     K,X,Y:Integer;
     Color:Word;
   Begin
     Modo_Grafico;
     ClearDevice;
     Color := GetMaxColor;
     Marco (1,1,719,348);
        For K := 1 to 500 do
        Begin
           X := Random(748);
           Y := Random(348);
           PutPixel (X, Y, Color);
           PutPixel (X, Y, 0);
           Delay (20);
           PutPixel (Random(719), Random(347), color);
        End;
     SetLineStyle (0,1,NormWidth);
     ESTRELLA;
     Sound (523);  Delay (400); Nosound;
     Sound (587);  Delay (400); Nosound;
     Sound (659);  Delay (400); Nosound;
     Sound (699);  Delay (400); Nosound;
     Sound (784);  Delay (400); Nosound;
     Sound (880);  Delay (400); Nosound;
     Sound (987);  Delay (400); Nosound;
     Sound (1047); Delay (400); Nosound;
     MoveTo (100,20);
     SetTextStyle (1,0,10);
     OutText ('TECLADO');
     SetTextStyle (1,0,3);
     OutTextXY (120,130,'PSS-795');
     OutTextXY (520,130,'MANIA');
     SetTextStyle (1,0,1);
     MoveTo (305,300);
     OutText ('C.R.E.O. 1992');
     Delay (1500);
     ClearDevice;
     RestoreCrtMode;
  End;

  Procedure Menu_Principal;
     Var
        Hour,Minute,Second,Sec100:Word;
        Year,Month,Day,DayofWeek:Word;
        DiaSemana:String [10];
     Begin
        RestoreCrtMode;
        ClrScr;
        GetTime (Hour,Minute,Second,Sec100);
        GetDate (Year,Month,Day,DayofWeek);
        Case DayOfWeek of
           1 : DiaSemana := 'Lunes';
           2 : DiaSemana := 'Martes';
           3 : DiaSemana := 'Mi‚rcoles';
           4 : DiaSemana := 'Jueves';
           5 : DiaSemana := 'Viernes';
           6 : DiaSemana := 'Sabado';
           7 : DiaSemana := 'Domingo';
        End;
        MARCO2 (1,1,79,24);
        MARCO2 (1,1,79, 5);
        GotoXY ( 5, 2); Writeln ('TECLADOMANIA PSS-795');
        GotoXY ( 5, 4); Writeln ('C.R.E.O. 92. Ver. 1.0');
        GotoXY (50, 2); Writeln ('DIA: ',Day,'-',Month,'-',Year,', ',DiaSemana);
        GotoXY (50, 4); Writeln ('HORA: ',Hour,':',Minute,':',Second,':',Sec100);
        MARCO2 (20, 5,60,7);
        GotoXY (22, 6); Writeln ('MENU PRINCIPAL DE OPCIONES DE TECLADO');
        MARCO2 (25, 8,55,18);
        GotoXY (27, 9); Writeln ('1.-MELODIAS PREPROGRAMADAS');
        GotoXY (27,11); Writeln ('2.-TECLADO CON SONIDO');
        GotoXY (27,13); Writeln ('3.-AYUDA');
        GotoXY (27,15); Writeln ('4.-ESPECIFICACIONES PSS-795');
        GotoXY (27,17); Writeln ('5.-SALIDA TOTAL');
        MARCO2 (33,21,50,23);
        GotoXY (35,22); Writeln ('ELIJA OPCION: ');
     End;

  Procedure Salida;
        Var
           Let: String [80];
        Begin
           RestoreCrtMode;
           ClrScr;
           OPENFILE_SALIDA;
           For X := 1 to 24 do
           Writeln;
           While Not EOF (File_3) do
              Begin
                Readln (File_3,Let);
                Writeln (Let);
                Delay (200);
              End;
            ClrScr;
            Close (File_3);
            Sound (349);  Delay (400); Nosound;
            Sound (523);  Delay (400); Nosound;
            Sound (699);  Delay (400); Nosound;
            Sound (784);  Delay (400); Nosound;
            Sound (880);  Delay (400); Nosound;
            Sound (987);  Delay (400); Nosound;
            Sound (1047); Delay (800); Nosound;
            ClrScr;
            GotoXY (33,12); Writeln ('GRACIAS...­­­');
            Delay (1500);
            ClrScr;
         End;


                           (* SONIDO *)

(*SONIDO DESDE TECLADO *)

Procedure Sonico;
Var
   tecla:char;
Begin
   SetGraphMode (GetGraphMode);
   ClearDevice;
   DIBUJA;
   SetTextStyle (1,0,1);
   Line (1,318,719,318);
   OutTextXY (200,320,'TOQUE DESDE EL TECLADO SP');
   Repeat
   Tecla:=ReadKey;

      (* DO *)
      if tecla in ['1','!'] then
        begin
           sound (131);
           delay (200);
           nosound;
        end;

      (* DO# *)
      if tecla in ['2','"'] then
        begin
           sound (139);
           delay (200);
           nosound;
        end;

      (* RE *)
      if tecla in ['3','ú'] then
        begin
           sound (147);
           delay (200);
           nosound;
        end;

      (* RE# *)
      if tecla in ['4','$'] then
        begin
           sound (156);
           delay (200);
           nosound;
        end;

      (* MI *)
      if tecla in ['5','%'] then
        begin
           sound (165);
           delay (200);
           nosound;
        end;

      (* FA *)
      if tecla in ['6','&'] then
        begin
           sound (175);
           delay (200);
           nosound;
        end;

      (* FA# *)
      if tecla in ['7','/'] then
        begin
           sound (186);
           delay (200);
           nosound;
        end;

      (* SOL *)
      if tecla in ['8','('] then
        begin
           sound (196);
           delay (200);
           nosound;
        end;

      (* SOL# *)
      if tecla in ['9',')'] then
        begin
           sound (208);
           delay (200);
           nosound
        end;

      (* LA *)
      if tecla in ['0','='] then
        begin
           sound (220);
           delay (200);
           nosound;
        end;

      (* LA# *)
      if tecla in ['q','Q'] then
        begin
           sound (234);
           delay (200);
           nosound;
        end;

      (* SI *)
      if tecla in ['w','W'] then
        begin
           sound (247);
           delay (200);
           nosound;
        end;

      (* DO *)
      if tecla in ['e','E'] then
        begin
           sound (262);
           delay (200);
           nosound;
        end;

      (* DO# *)
      if tecla in ['r','R'] then
        begin
           sound (278);
           delay (200);
           nosound;
        end;

      (* RE *)
      if tecla in ['t','T'] then
        begin
           sound (294);
           delay (200);
           nosound;
        end;

      (* RE# *)
      if tecla in ['y','Y'] then
        begin
           sound (312);
           delay (200);
           nosound;
        end;

      (* MI *)
      if tecla in ['u','U'] then
        begin
           sound (330);
           delay (200);
           nosound;
        end;

      (* FA *)
      if tecla in ['i','I'] then
        begin
           sound (349);
           delay (200);
           nosound;
        end;

      (* FA# *)
      if tecla in ['o','O'] then
        begin
           sound (371);
           delay (200);
           nosound;
        end;

      (* SOL *)
      if tecla in ['p','P'] then
        begin
           sound (392);
           delay (200);
           nosound;
        end;

      (* SOL# *)
      if tecla in ['a','A'] then
        begin
           sound (416);
           delay (200);
           nosound;
        end;

      (* LA *)
      if tecla in ['s','S'] then
        begin
           sound (440);
           delay (200);
           nosound;
        end;

      (* LA# *)
      if tecla in ['d','D'] then
        begin
           sound (467);
           delay (200);
           nosound;
        end;

      (* SI *)
      if tecla in ['f','F'] then
        begin
           sound (494);
           delay (200);
           nosound;
        end;

      (* DO *)
      if tecla in ['g','G'] then
        begin
           sound (523);
           delay (200);
           nosound;
        end;

      (* DO# *)
      if tecla in ['h','H'] then
        begin
           sound (555);
           delay (200);
           nosound;
        end;

      (* RE *)
      if tecla in ['J','j'] then
        begin
           sound (587);
           delay (200);
           nosound;
        end;

      (* RE# *)
      if tecla in ['k','K'] then
        begin
           sound (623);
           delay (200);
           nosound;
        end;

      (* MI *)
      if tecla in ['L','l'] then
        begin
           sound (659);
           delay (200);
           nosound;
        end;

      (* FA *)
      if tecla in ['¥','¤'] then
        begin
           sound (699);
           delay (200);
           nosound;
        end;

      (* FA# *)
      if tecla in ['<','>'] then
        begin
           sound (742);
           delay (200);
           nosound;
        end;

      (* SOL *)
      if tecla in ['Z','z'] then
        begin
           sound (784);
           delay (200);
           nosound;
        end;

      (* SOL# *)
      if tecla in ['X','x'] then
        begin
           sound (832);
           delay (200);
           nosound;
        end;

      (* LA *)
      if tecla in ['C','c'] then
        begin
           sound (880);
           delay (200);
           nosound;
        end;

      (* LA# *)
      if tecla in ['V','v'] then
        begin
           sound (934);
           delay (200);
           nosound;
        end;

      (* SI *)
      if tecla in ['B','b'] then
        begin
           sound (987);
           delay (200);
           nosound;
        end;

      (* DO *)
      if tecla in ['N','n'] then
        begin
           sound (1047);
           delay (200);
           nosound;
        end;

      (* DO# *)
      if tecla in ['M','m'] then
        begin
           sound (1111);
           delay (200);
           nosound;
        end;

      (* RE *)
      if tecla in [',',';'] then
        begin
           sound (1175);
           delay (200);
           nosound;
        end;

      (* RE# *)
      if tecla in ['.',':'] then
        begin
           sound (1247);
           delay (200);
           nosound;
        End;
    Until Tecla In ['-','_'];
    RestoreCrtMode;
End;

(* MELODIAS PREPROGRAMADAS *)

Procedure MenuMelodias;
   Begin
      ClrScr;
      MARCO2 (1,1,79,24);
      Nombre [1] := 'ENCUENTRO 4';
      Nombre [2] := 'HIMNO A LA ALEGRIA';
      Nombre [3] := 'CON. PARA ENAMORADOS';
      Nombre [4] := 'CALYPSO 1';
      Nombre [5] := 'TOCATA Y FUGA EN RE MENOR';
      Nombre [6] := 'TRISTEZA';
      Nombre [7] := 'SINFONIA #40';
      Nombre [8] := 'NIGHT BIRDS';
      Nombre [9] := 'NOCHE DE PAZ';
      Nombre[10] := 'LA MARSELLESA';
      Nombre[11] := 'DANUBIO AZUL';
      Nombre[12] := 'YESTERDAY';
      Nombre[13] := 'CABALLO VIEJO';
      Nombre[14] := 'MEDITACION';
      Nombre[15] := 'CLAIR DE LUNE';
      Nombre[16] := 'JOY';
      Nombre[17] := 'BRASIL';
      Nombre[18] := 'PERPIGNAN';
      Nombre[19] := 'PRELUDIO';
      Nombre[20] := 'FEELINGS';
      Nombre[21] := 'MY WAY';
      Nombre[22] := 'LOVE HISTORY';
      Nombre[23] := 'LA BIKINA';
      Nombre[24] := 'VALZ DE LAS FLORES';
      Nombre[25] := 'TRISTEZA(BOSA)';
      Nombre[26] := 'MICHELLE';
      Nombre[27] := 'TEMA DE NADIA';
      Nombre[28] := 'SAN LUIS BLUES';
      Nombre[29] := 'DE BUEN HUMOR';
      Nombre[30] := 'MARCHA DE LOS SANTOS';
      Nombre[31] := 'GUADALAJARA';
      Nombre[32] := 'QUE CHULA ES PUEBLA';
      Nombre[33] := 'LOS SONIDOS DEL SILENCIO';
      Nombre[34] := 'I JUST CALL TO SAY I LOVE YOU';
      Nombre[35] := 'TICO TICO';
      Nombre[36] := 'NEW YORK, NEW YORK';
      Nombre[37] := 'BALADA PARA ADELINA';
      Nombre[38] := 'MATRIMONIO DE AMOR';
      Nombre[39] := 'A COMO EL AMOR';
      Nombre[40] := 'MARCHA NUPCIAL';
      MARCO2 ( 1, 1,79, 3);
      MARCO2 ( 1, 3,79,20);
      GotoXY (29, 2); Writeln ('MELODIAS DISPONIBLES:');
      GotoXY (3 , 4); WRiteln ('0.-SALIDA');
      GotoXY (3 , 5); Writeln ('1.-',Nombre[1]);
      GotoXY (3 , 6); Writeln ('2.-',Nombre[2]);
      GotoXY (3 , 7); Writeln ('3.-',Nombre[3]);
      GotoXY (3 , 8); Writeln ('4.-',Nombre[4]);
      GotoXY (3 , 9); Writeln ('5.-',Nombre[5]);
      GotoXY (3 ,10); Writeln ('6.-',Nombre[6]);
      GotoXY (3 ,11); Writeln ('7.-',Nombre[7]);
      GotoXY (3 ,12); Writeln ('8.-',Nombre[8]);
      GotoXY (3 ,13); Writeln ('9.-',Nombre[9]);
      GotoXY (3 ,14); Writeln ('10.-',Nombre[10]);
      GotoXY (3 ,15); Writeln ('11.-',Nombre[11]);
      GotoXY (3 ,16); Writeln ('12.-',Nombre[12]);
      GotoXY (3 ,17); Writeln ('13.-',Nombre[13]);
      GotoXY (3 ,18); Writeln ('14.-',Nombre[14]);
      GotoXY (3 ,19); Writeln ('15.-',Nombre[15]);
      GotoXY (32, 4); Writeln ('16.-',Nombre[16]);
      GotoXY (32, 5); Writeln ('17.-',Nombre[17]);
      GotoXY (32, 6); Writeln ('18.-',Nombre[18]);
      GotoXY (32, 7); Writeln ('19.-',Nombre[19]);
      GotoXY (32, 8); Writeln ('20.-',Nombre[20]);
      GotoXY (32, 5); Writeln ('21.-',Nombre[21]);
      GotoXY (32, 6); Writeln ('22.-',Nombre[22]);
      GotoXY (32, 7); Writeln ('23.-',Nombre[23]);
      GotoXY (32, 8); Writeln ('24.-',Nombre[24]);
      GotoXY (32, 9); Writeln ('25.-',Nombre[25]);
      GotoXY (32,10); Writeln ('26.-',Nombre[26]);
      GotoXY (32,11); Writeln ('27.-',Nombre[27]);
      GotoXY (32,12); Writeln ('28.-',Nombre[28]);
      GotoXY (32,13); Writeln ('29.-',Nombre[29]);
      GotoXY (32,14); Writeln ('30.-',Nombre[30]);
      GotoXY (32,15); Writeln ('31.-',Nombre[31]);
      GotoXY (32,16); Writeln ('32.-',Nombre[32]);
      GotoXY (32,17); Writeln ('32.-',Nombre[33]);
      GotoXY (32,18); Writeln ('34.-',Nombre[34]);
      GotoXY (32,19); Writeln ('35.-',Nombre[35]);
      GotoXY (55, 4); Writeln ('36.-',Nombre[36]);
      GotoXY (55, 5); Writeln ('37.-',Nombre[37]);
      GotoXY (55, 6); Writeln ('38.-',Nombre[38]);
      GotoXY (55, 7); Writeln ('39.-',Nombre[39]);
      GotoXY (55, 8); Writeln ('40.-',Nombre[40]);
      MARCO2 (13,22,45,24);
      GotoXY (15,23); Write ('Melodia a tocar (y ENTER): '); Read (M);
      Case M of
        1 : FileName := 'RENDEZ4.DAT';
        2 : FileName := 'ALEGRIA.DAT';
        3 : FileName := 'CONCENAM.DAT';
        4 : FileName := 'CALYPSO1.DAT';
        5 : FileName := 'TOCATA.DAT';
        6 : FileName := 'TRISTEZA.DAT';
        7 : FileName := 'SINFO#40.DAT';
        8 : FileName := 'BIRDS.DAT';
        9 : FileName := 'NOCHEPAZ.DAT';
       10 : FileName := 'MARSELLA.DAT';
       11 : FileName := 'DANUBIO.DAT';
       12 : FileName := 'AYER.DAT';
       13 : FileName := 'CVIEJO.DAT';
       14 : FileName := 'MEDITAC.DAT';
       15 : FileName := 'CDELUNA.DAT';
       16 : FileName := 'JOY.DAT';
       17 : FileName := 'BRASIL.DAT';
       18 : FileName := 'PERPIGNA.DAT';
       19 : FileName := 'PRELUDIO.DAT';
       20 : FileName := 'FEELINGS.DAT';
       21 : FileName := 'MYWAY.DAT';
       22 : FileName := 'LOVEST.DAT';
       23 : FileName := 'BIKINA.DAT';
       24 : FileName := 'FLORES.DAT';
       25 : FileName := 'TRIZBOSA.DAT';
       26 : FileName := 'MICHELLE.DAT';
       27 : FileName := 'NADIA.DAT';
       28 : FileName := 'SNLUIS.DAT';
       29 : FileName := 'DBHUMOR.DAT';
       30 : FileName := 'SANTOS.DAT';
       31 : FileName := 'GUADALAJ.DAT';
       32 : FileName := 'QCPUEBLA.DAT';
       33 : FileName := 'SILENCIO.DAT';
       34 : FileName := 'JUSTCALL.DAT';
       35 : FileName := 'TICOTICO.DAT';
       36 : FileName := 'NEWYORK.DAT';
       37 : FileName := 'ADELINA.DAT';
       38 : FileName := 'MATRIMON.DAT';
       39 : FileName := 'ACOMOAMO.DAT';
       40 : FileName := 'MARCHANU.DAT';
     End;
   End;

Procedure MelodiasFile;
Var
   Ok:Boolean;
Begin
   Repeat
      MenuMelodias;
      Assign (File_2,FileName);
      (*$I-*)
      Reset (File_2);
      (*$I+*)
      Ok := (IoResult = 0);
      If Not Ok Then
         Begin
            ClrScr;
            Writeln ('El Archivo NO EXISTE');
            Writeln ('Inserte Disco Con Archivo En A:, Y De Numero.');
         End;
   Until Ok;
   SetGraphMode (GetGraphMode);
End;


Procedure Melodias;
   Var
      Hertz,Dur:Integer;
   Begin
      MelodiasFile;
      DIBUJA;
      SetTextStyle (1,0,1);
      Line (1,318,719,318);
      OutTextXY (200,320,'CORRIENDO: ' + Nombre [M]);
      While not eof (File_2) do
      Begin
         Readln (File_2,Hertz,Dur);
         If M = 6 then
            Begin
               Sound (Hertz);
               Delay (Dur*4);
               Nosound;
            End;
         If (M<>6) or (M<>11) or (M<>12) then
            Begin
               Sound (Hertz);
               Delay (Dur*2);
               Nosound;
            End;
         If M = 11 then
            Begin
               Dur := Round (Dur/4);
               Sound (Hertz);
               Delay (Dur);
               Nosound;
            End;
         If M = 12 then
            Begin
               Sound (Hertz);
               Delay (Dur*3);
               Nosound;
            End;
      End;
      Close (File_2);
      RestoreCrtMode;
   End;

                     (* P R O G R A M A  P R I N C I P A L *)

BEGIN
   ENCABEZADO;
   PORTADA;
   (* MenuPrincipal *)
   REPEAT
   MENU_PRINCIPAL;
   OPCION := READKEY;
   CASE OPCION OF
      '1' : MELODIAS;
      '2' : SONICO;
      '3' : AYUDA;
      '4' : ESPECIFICACIONES;
      '5' : SALIDA;
     END;
   UNTIL OPCION = '5';
END.
















