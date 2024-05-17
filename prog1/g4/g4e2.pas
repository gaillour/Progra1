
Program g4e2;
{Desarrollar una función para calcular el factorial de un número}

Function factorial(n:integer): integer;

Var 
  i: integer;

Begin
  If n=0 Then
    factorial := 1
  Else
    factorial := n*(factorial(n-1))

End;


Begin
  writeln(factorial(5))
End.
