Program g4e6;


{ Desarrollar  una  función  que  devuelva  un  número  aleatorio  en  un rango  [A,  B]  con  A<B  ingresados 
por teclado. Nota: usar la función Random y Randomize}

Function aleatorio(a,b:integer): integer;
Begin
  aleatorio := random(b)+1;
  If (aleatorio<a) or (aleatorio>b)Then
    aleatorio := random(b)+1
End;

Begin
  randomize;
  writeln(aleatorio(3,6))
End.
