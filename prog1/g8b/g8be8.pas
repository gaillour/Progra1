program g8be8;

{Desarrollar un procedimiento recursivo que devuelva en un arreglo los máximos de cada fila de 
una matriz de NxM.}

const
    N=3;
    M=4;
type
    tm=array[1..N,1..M] of byte;
    tv=array[1..N] of byte;

const
    mat:tm=((5,7,4,3),(4,4,5,10),(2,8,5,20));


procedure maximos(mat:tm;var v:tv;i,j,m:byte;var max:byte);
begin   
    if i>0 then
    begin
        if j>1 then 
        begin
            if mat[i,j]>max then
                max:=mat[i,j];
            maximos(mat,v,i,j-1,m,max);
        end
        else
        begin
            v[i]:=max;
            max:=0;
            maximos(mat,v,i-1,m,m,max);
        end;
    end;
end;


procedure mostrarV(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        Write(v[i],' ')
end;
var
    v:tv;
    max:byte;

begin   
    max:=0;
    maximos(mat,v,n,m,m,max);
    mostrarV(v,n);
end.