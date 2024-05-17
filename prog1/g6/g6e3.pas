program g6e3;

{En un archivo se almacenaron Y números enteros en cada línea. 
Cada línea se cargará en una fila de la matriz si cumple que el 
primero es divisor del último (el Y-ésimo). Mostrar la matriz generada.
La dimensión será N x Y (N se debe calcular) }
const 
    y=4;

type
    tmat=array[1..15, 1..y] of integer;
    tlinea=array[1..y] of integer;

procedure leer(var mat:tmat;var linea:tlinea;var n:byte);
var 
    i,j:byte;
    arch:text;

begin
    Assign(arch,'ynum.txt'); reset(arch);
    while not eof(arch) do
    begin
        for i:=1 to y do
            read(arch, linea[i]);
        if (linea[1] mod linea[y]=0) or (linea[y] mod linea[1] =0)then 
        begin
            n:=n+1;
            for j:=1 to y do
            begin
                mat[n,j]:=linea[j];
                linea[j]:=0;
            end;
        end;          
    end;   
end;

procedure mostrarmat(var mat:tmat;var n:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to y do
            write(mat[i,j],' ');
        writeln;
    end;
end;

var
    mat:tmat;
    linea:tlinea;
    n:byte;

begin
leer(mat,linea,n);
mostrarmat(mat,n);

end.
