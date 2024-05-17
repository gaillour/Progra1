program g5e4;

{Se pide compactar un arreglo (eliminar los ceros que contiene) generando otro arreglo}

type 
    vec=array[1..8] of integer;

const
    v:vec=(1,0,53,0,4,20,0,0);

procedure compactar(var v,c:vec);
var
    i,j:byte;
begin
    j:=0;
    for i:=1 to Length(v) do
        begin
          if v[i]<>0 then
          begin
            j:=j+1;
            c[j]:=v[i]
           end; 
        end;
end;

var 
    i:byte;
    c:vec;

begin
compactar(v,c);
for i:=1 to length(c) do 
    writeln(c[i])
end.