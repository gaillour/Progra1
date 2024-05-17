
Program g4e1;

Function letra(car:Char): boolean;

Begin
  If upcase(car)<>car Then
    letra:=True
    else letra:=False;

End;

Var 
  car: char;
Begin

  readln(car);

  writeln(letra(car));

End.
