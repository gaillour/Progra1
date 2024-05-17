program g4e3;
{ Dado un número natural N, calcular y mostrar la suma de los N primeros números naturales}

function suma(n:integer):integer;
var
    i,aux:integer;
begin
  aux:=0;
  for i:=1 to n do
    aux:= aux+i;   
  suma:=aux;  
end;

begin
  Write(suma(4))
end.