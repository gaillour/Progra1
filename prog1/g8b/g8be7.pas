program g8be7;

{Crear una función recursiva que busque el elemento mínimo de una matriz cuadrada}

const
    N=3;
    M=4;
type
    tm=array[1..N,1..M] of byte;

{
 1 7 4 3 
 2 2 5 10 
 2 8 5 20 
}

const
    mat:tm=((5,7,4,3),(4,4,5,10),(2,8,5,20));


procedure minimo(mat:tm;i,j,m:byte;var min:byte);
begin
    if i>0 then
    begin
        if mat[i,j]<min then min:=mat[i,j];
        if j>1 then minimo(mat,i,j-1,m,min)
        else minimo(mat,i-1,m,m,min)        
    end;
end;

var
    min:byte;
begin   
    min:=9999;
    minimo(mat,n,m,m,min);
    writeln('el minimo es: ',min);
end.