program g4be2;

{Desarrollar una función para calcular el factorial de un número}

function factorial(n:byte):integer; {byte}
var
    aux:integer;
    i:byte;
begin
    aux:=1;
    if (n=0) then factorial:=1
    else 
    begin
        for i:=n downto 1 do
            aux:=aux*i
    end;
    factorial:=aux;
end;

var
    n:byte;
begin
    n:=5;
    writeln(factorial(n));

end.