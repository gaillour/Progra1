program g4be3;

{Dado un número natural N, calcular y mostrar la suma de los N primeros números
naturales}

function suma(n:byte):integer;
var
    aux:integer;
    i:Byte;
begin
    aux:=0;
    for i:=1 to n do
        aux:=aux+i;
    suma:=aux;
end;

var 
    n:byte;
begin
    n:=5;
    writeln(suma(n));
end.