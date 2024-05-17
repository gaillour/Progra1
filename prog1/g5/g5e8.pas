program g5e8;

{Dado un arreglo V de N elementos ordenados en forma ascendente con componentes repetidas, 
generar W con la frecuencia de los elementos de V. Mostrar W 
Ejemplo: N=10; V=(2,2,3,3,3,3,7,9,9,9)    W=(2,4,1,3)}

type 
    vec=array[1..10] of byte;

const 
    v:vec=(2,2,3,3,3,3,7,9,9,9);  // a W=(2,4,1,3)

procedure frecuencia(var v,w:vec);
var 
    i,j,aux:byte;
begin
aux:=0;
j:=0;
    for i:=1 to Length(v) do
      begin
        if v[i]>aux then
            begin
            j:=j+1;
            aux:=v[i];
            w[j]:=w[j]+1;
            end
        else  
        begin
        w[j]:=w[j]+1;          
        end;
      end;
end;

var
    w:vec;
    i:byte;

begin
frecuencia(v,w);
for i:=1 to 4 do    
    writeln(w[i])  
    
end.