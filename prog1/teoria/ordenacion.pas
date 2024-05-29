program ordenacion;

type    
    tv=array[1..8] of byte;
const
    v1:tv=(2,4,3,7,8,6,5,1);
    v2:tv=(2,4,3,7,8,6,5,1);

procedure seleccion(var v:tv; n:byte);
var 
    min, i, k: byte;   
    aux: integer;
begin
    for k:=1 to n-1 do 
    begin 
        min:=k; 
        for i:=k+1 to n do   
            If  V[min]>V[i] then 
                min:= i; 
        If min <> k then 
        begin 
            aux:=V[k];   V[k]:=V[min];   V[min]:=aux; 
        end;
    end;
end;

procedure burbujeo(var v:tv; n:byte);
var
    i,k,aux,tope:byte;
begin
    tope:=n;
    repeat
        k:=0;
        for i:=1 to tope-1 do
        begin
            if v[i]>v[i+1] then
            begin
                aux:=v[i]; v[i]:=v[i+1]; v[i+1]:=aux;
                k:=i;
            end;
        end;
        tope:=k;
    until k<=1;
end;

procedure insercion();
begin

    
end;    

procedure mostrar(var v:tv; n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i])
end;    

var
    n:byte;
begin
n:=Length(v1);
seleccion(v1,n);
mostrar(v1,n);
burbujeo(v2,n);
mostrar(v2,n);

end.