program g4be4;

{Desarrollar una función que calcule la potencia n-ésima de un número X ( Xn ).}

function potencia(x,n:byte):integer;
var
    i:byte;
    aux:integer;
begin
    aux:=1;
    for i:=1 to n do
        aux:=x*aux;
    
end;

var 
    x,n:byte;
begin
    write('x: ');readln(x);
    write('n: ');readln(n);
    write(x,' a la ',n,': ',potencia(x,n));
end.