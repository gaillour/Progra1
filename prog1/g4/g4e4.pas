program g4e4;

function potencia(x,n:integer):integer;
var
    aux,i:integer;
begin
if n=0 then
  potencia:=1
else if n=1 then
    potencia:=x
else 
    potencia:=x*potencia(x,n-1);

end;

begin

writeln(potencia(2,3));
  
end.