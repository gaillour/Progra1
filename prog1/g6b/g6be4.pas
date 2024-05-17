program g6be4;

{Se tiene en un archivo los elementos de una matriz “rala” (se dice que una matriz es rala cuando la 
mayoría de sus elementos son cero). En cada línea del archivo viene: 
     fila, columna, dato (distinto de cero) 
Se pide: 
    a) Armar la matriz original y mostrarla en forma matricial. 
    (Obtener N y M, sabiendo que hay al menos un valor no nulo en la última fila de alguna columna y 
    en la última columna de alguna fila ). 
    b) Si es cuadrada (N=M) determinar si es triangular inferior.
}

const
    max=10;
type
    tm=array[1..max,1..max] of byte;

procedure inicializar(var mat:tm);
var
    j,i:byte;
begin
    for i:=1 to max do
        for j:=1 to max do
            mat[i,j]:=0;
end;

procedure crear(var mat:tm;var n,m:byte);
var
    arch:text;
    i,j,num:byte;
begin
    assign(arch,'e4.txt'); reset(arch);
    n:=0;m:=0;
    while not Eof(arch) do
    begin
        readln(arch,i,j,num);
        mat[i,j]:=num;
        if i>n then
            n:=i;
        if j>m then
            m:=j;
    end;    
    close(arch);    
end;


function esinferior(mat:tm;n:byte):boolean;
var
    i,j:byte;

begin
    i:=1;
    while (i<=n) and (mat[i,j]=0) do
    begin
        i:=i+1;
        j:=1;
        while (j<i-1) and  (mat[i,j]=0) do
            j:=j+1;        
    end;
    if mat[i,j]<>0 then esinferior:=false
    else esinferior:=true;
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
    mat:tm;
    n,m:byte;
begin
    inicializar(mat);
    crear(mat,n,m);
    mostrarmat(mat,n,m);
    if n=m then
    begin
        if esinferior(mat,n) then
            write('es triangular inferior')
        else write('no es triangular inferior');
    end
    else write('no es cuadrada');
end.