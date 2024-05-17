program g8e1;

function potencia(x:integer;n:byte):integer;
begin
    if n=0 then
        potencia:=1
    else potencia:=potencia(x,n-1)*x;
end;



begin
writeln(potencia(3,2))
end.