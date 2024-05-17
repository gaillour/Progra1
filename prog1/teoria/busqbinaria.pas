program busqbinaria;

type
    tv=array[1..8] of byte;

const
    vec:tv=(1,4,5,7,9,10,12,14);

function busquedabinaria(vec:tv;x,n:byte):boolean;
var
    pri,ult,medio:byte;
begin       
    pri:=1; ult:=n;
    medio:=(pri+ult) div 2;
    while (pri<ult) and (vec[medio]<>x) do
    begin
        if x>vec[medio] then
            pri:=medio+1
        else ult:=medio-1;
        medio:=(pri+ult) div 2
    end;
    busquedabinaria:=x=vec[medio];
end;

begin
writeln(busquedabinaria(vec,10,Length(vec)));
end.