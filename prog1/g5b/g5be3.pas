program g5be3;

const   
    N=10;
type
    vec=array[1..N] of byte;

const
    v:vec=(4,7,2,2,3,2,6,3,2,1);

procedure cambiar(var v:vec;k:byte);
var
    i:Byte;
begin
    for i:=1 to N do
    begin
        if v[i]=k then
            v[i]:=0
    end
end;

procedure mostrar(v:vec;x:byte);
var
    i:byte;
begin
    for i:=1 to x do
    begin
        write(v[i],' ');
    end;
end;

var
    k:byte;
begin
    k:=2;
    cambiar(v,k);
    mostrar(v,N);
end.