program g6be6;

{Un cuadrado mágico de orden N (impar), es una matriz cuadrada de NxN  que contiene números 
naturales de 1 a N2, tal que la suma de cualquier columna, fila o diagonal coincide. Se construye 
de la siguiente manera:      

     El número 1 se coloca en la casilla central de la primera fila.     
     Cada número siguiente se coloca en la casilla correspondiente a 
    la fila anterior y columna posterior.     
     Si el número es el que sigue a un múltiplo de N, se coloca en la 
    casilla de la fila posterior en la misma columna. 
     Se considera fila anterior a la primera, la última.     
     Se considera columna posterior a la última, la primera 

Se pide: 
a) Escribir un procedimiento que, dados una matriz Mat y N, genere el cuadrado mágico. 
b) Escribir una función booleana que verifique si la matriz Mat es un cuadrado mágico.}


const
    N=5;
type
    tmat=array[1..N,1..N] of byte;

procedure cuadrado(var mat:tmat;n:byte);
var
    i,j,k:byte;
begin
    i:=1; j:=n div 2 +1;
    for k:=1 to sqr(n) do
    begin
        mat[i,j]:=k;
        if k mod n <> 0 then
        begin
            if i>1 then i:=i-1
            else i:=n;
            if j<=n-1 then j:=j+1
            else j:=1;
        end
        else 
        begin
            if i<=n-1 then i:=i+1
            else i:=1;
        end;
    end;
end;



procedure mostrarmat(mat:tmat;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to m do
            write(mat[i,j],' ');
        writeln;
    end;
end;
var
    mat:tmat;

begin
    cuadrado(mat,n);
    mostrarmat(mat,n,n);
    

end.