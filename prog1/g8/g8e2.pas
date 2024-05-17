program g8e2;

function funcion(i:integer):integer;
begin
    if i=0 then
        funcion:=1
    else if i mod 2 =0 then
        funcion:=1+funcion(i-1)
    else funcion:=funcion(i-1)
end;


begin
writeln(funcion(2))
  
end.