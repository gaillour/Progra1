program g6e4;

{Se tiene en un archivo los elementos de una matriz “rala” 
(se dice que una matriz es rala cuando la mayoría de sus elementos son cero).
En cada línea del archivo viene:fila, columna, dato (distinto de cero) 
Se pide: 
a) Armar la matriz original y mostrarla en forma matricial. 
(Obtener N y M, sabiendo que hay al menos un valor no nulo en la última fila de 
alguna columna y en la última columna de alguna fila ). 
b) Si es cuadrada (N=M) determinar si es triangular inferior.}

type 
    tmat=array[1..10,1..10] of integer;

procedure inicializar(var mat:tmat);
var
    i,j:byte;

begin
    for i:=1 to Length(mat) do
    begin
        for j:=1 to Length(mat) do 
            mat[i,j]:=0;
    end;
end;

procedure rala(var mat:tmat;var n,m:byte);
var 
    i,j:byte;
    valor:integer;
    arch:text;
begin
    assign(arch,'rala.txt'); Reset(arch);
    n:=0;m:=0;
    while not eof(arch) do
    begin
        readln(arch, i,j,valor);
        mat[i,j]:=valor;
        if i>n then
            n:=i;
        if j>m then 
            m:=j;
    end;    
end;

function estriangular(mat:tmat;n:byte):boolean;
var
    i,j:byte;
begin
    i:=0;j:=0;
    while (i<n-1) and (mat[i,j]=0) do
    begin
        i:=i+1;
        j:=i;
        while (j<n) and (mat[i,j]=0) do
        begin
            j:=j+1;
            Writeln(i,j);
        end;
    end;
    if mat[i,j]<>0 then
        estriangular:=False
    else estriangular:=True;
end;

procedure mostrarmat(var mat:tmat;var n,m:byte);
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
    n,m:byte;
begin
rala(mat,n,m);
mostrarmat(mat,n,m);

if n=m then
begin
    if estriangular(mat,n)=True then
        writeln('es triangular inferior')
    else writeln('no es triangular inferior');
end;


end.