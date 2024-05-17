program g5be8;

{ Dado un arreglo V de N elementos ordenados en forma ascendente con componentes repetidas, 
generar W con la frecuencia de los elementos de V. Mostrar W 
Ejemplo: N=10; V=(2,2,3,3,3,3,7,9,9,9)    W=(2,4,1,3) }

const
    N=10;

type    
    tv=array[1..N] of byte;

const
    V:tv=(2,2,3,3,3,3,7,9,9,9);

procedure generar(v:tv;n:byte;var w:tv;var m:byte);
var
    i:byte;
begin
    m:=1;
    for i:=1 to n do 
    begin
        if i<n then
        begin
            if v[i]=v[i+1] then
                w[m]:=w[m]+1
            else
            begin
                w[m]:=w[m]+1;
                m:=m+1;
            end;        
        end
        else 
        begin
            w[m]:=w[m]+1;    
        end;
    end;
end;


procedure mostrar(v:tv;n:byte);
var 
    i:byte;
begin
    for i:=1 to n do
    begin
        write(v[i],' ');
    end;
    
end;

var
    w:tv;
    m:byte;
begin
    generar(v,n,w,m);
    mostrar(w,m);
end.