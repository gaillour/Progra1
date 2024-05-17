program g6be1;

{Leer desde un archivo una matriz de NxM elementos enteros, (N y M se encuentran en la primera 
línea del archivo y luego en las restantes N líneas vienen los M elementos). Se pide: 
a) Generar un arreglo con el máximo de cada fila y mostrarlo. 
b) Generar un arreglo con la suma de los impares de cada columna, no generar elemento si la 
columna no tiene impares. 
c) Dada una columna X, ingresada por el usuario, hallar el promedio de sus elementos.}

const
    max=6;
type
    tm=array[1..max,1..max] of byte;
    tv=array[1..max] of word;


procedure leer(var mat:tm;var n,m:byte);
var
    i,j:byte;
    arch:Text;    
begin
    assign(arch,'e1.txt'); reset(arch);
    readln(Arch,n,m);
    for i:=1 to n do
    begin
        for j:=1 to m do
            read(arch,mat[i,j]);
        readln(arch);
    end;
    close(arch);    
end;

procedure generarvmax(mat:tm;n,m:byte;var vmax:tv);
var
    i,j:byte;
    max:word;
begin
    for i:=1 to n do
    begin
        max:=mat[i,1];
        for j:=2 to m do
            if  mat[i,j]>max then
                max:=mat[i,j];
        vmax[i]:=max;
    end;    
end;


procedure generarvimp(mat:tm;n,m:byte;var vimp:tv;var v:byte);
var
    i,j:byte;
    suma:word;
begin
    v:=0;
    for j:=1 to m do
    begin
        suma:=0;
        for i:=1 to n do
        begin
            if mat[i,j] mod 2 <> 0 then
                suma:=suma+mat[i,j];
        end;
        if suma>0 then
        begin
            v:=v+1;
            vimp[v]:=suma;
        end;
    end;
end;

function promcolumna(mat:tm;n,j:byte):real;
var
    i,suma:word;
begin   
    suma:=0;
    for i:=1 to n do
    begin
        suma:=suma+mat[i,j];
    end;
    promcolumna:=suma/n;    
end;


procedure mostrarmat(var mat:tm;var n,m:byte);
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

procedure mostrarvec(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;


var
    n,m,v,j:byte;
    mat:tm;
    vmax,vimp:tv;

begin
    leer(mat,n,m);
    mostrarmat(mat,n,m);
    generarvmax(mat,n,m,vmax);
    WriteLn('maximos: ');
    mostrarvec(vmax,n);

    writeln('suma impares');
    generarvimp(mat,n,m,vimp,v);
    mostrarvec(vimp,v);
    
    Write('ingrese columna: ');
    repeat
        readln(j);
        Write('ingrese columna: ');
    until j<=m;
    writeln('el promedio de la columna ',j,' es: ',promcolumna(mat,n,j):4:2);
end.