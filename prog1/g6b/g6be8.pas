program g6be8;

{ Sea un conjunto A de enteros y una relación R, se pide 
a) Generar la matriz booleana MatR que representa una relación R.  
b) Determinar si R es: 
 Reflexiva  
 Simétrica 
  
Ejemplo : 
A = [1,2,3,9,18] 
R = relación de Divisibilidad   
 
                        1 si   ai R aj (si aj mod ai = 0)
    MatR[ i , j ] = 
                        0 en otro caso
Respuesta: R es Reflexiva – R no es Simétrica}

const
    N=5;
type
    tv=array[1..N] of integer;
    tm=array[1..N,1..N] of integer;

const
    A:tv=(1,2,3,9,18);

procedure relacion(var matR:tm; A:tv; n:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
        for j:=1 to n do
        begin
            if A[j] mod A[i] = 0 then
                matR[i,j]:=1
            else matR[i,j]:=0;          
        end;    
end;

function reflexiva(matr:tm;n:byte):boolean;
var 
    i:byte;
begin
    i:=1;
    while (i<n) and (matr[i,i]=1) do
        i:=i+1;
    reflexiva:=matr[i,i]=1;
end;

// aRb => bRa
function simetrica(matR:tm;n:byte):boolean;
var
    i,j:byte;
begin   
    i:=1;
    while (i<n) and ((matr[i,j]=1) and (matr[j,i]=1) or (matr[i,j]=0)) do
    begin
        j:=i+1; 
        while (j<n) and ((matr[i,j]=1) and (matr[j,i]=1) or (matr[i,j]=0)) do 
            j:=j+1;
        i:=i+1;
    end;
    simetrica:= ((matr[i,j]=1) and (matr[j,i]=1)) or (matr[i,j]=0);
end;

procedure mostrarmat(mat:tm;n,m:byte);
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
    matr:tm;
begin
    relacion(matR,A,n);
    mostrarmat(matr,n,n);
    if reflexiva(matr,n) then writeln('es reflexiva')
    else writeln('no es reflexiva');
    if simetrica(matR,n) then writeln('es simetrica')
    else writeln('no es simetrica');
end.