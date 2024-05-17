program g5e3;

{ Dado un arreglo V y un número K, cambiar todas las ocurrencias de K por 0}
type
    vec=array[1..10] of integer;

const
    v:vec=(1,4,53,4,3,4,64,32,4,4);

procedure cambio(var v:vec; var k:integer);
var 
    i:byte;
begin
    for i:=1 to length(v) do 
        begin
        if v[i]=k then
          v[i]:=0;
        end;
  
end;

var 
    i:byte;
    k:integer;
begin
k:=4;
cambio(v,k);
for i:=1 to Length(v) do 
    writeln(v[i]);
end.