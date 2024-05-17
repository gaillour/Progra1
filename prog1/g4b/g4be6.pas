program g4be6;

{  Desarrollar  una  función  que  devuelva  un  número  aleatorio  en  un rango  [A,  B]  con  A<B  ingresados 
por teclado. Nota: usar la función Random y Randomize}

function aleatorio(a,b:integer):integer;
var
    aux:integer;
begin
    randomize;
    repeat
        aux:= random(b)+1;
    until aux>=a; 
    aleatorio:=aux;
end;

var 
    a,b:integer;
begin
    repeat
    writeln('[a,b] (con a<b): ');
    write('a: ');readln(a);
    write('b: ');readln(b);
    until a<b;

    Writeln(aleatorio(a,b));

end.