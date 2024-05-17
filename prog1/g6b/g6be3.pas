program g6be3;

{En un archivo se almacenaron Y números enteros en cada línea. Cada línea se cargará en una fila 
de la matriz si cumple que el primero es divisor del último (el Y-ésimo). Mostrar la matriz generada. 
La dimensión será N x Y (N se debe calcular)}

const
    max=3;
    y=4;

type    
    tvw=array[1..y] of word;
    tmw=array[1..max,1..y] of Word;

procedure leer(var mat:tmw;var n:byte);
var
    vec:tvw;
    i:byte;
    arch:text;

begin
    assign(arch,'e3.txt'); reset(arch);
    n:=0;
    while not Eof(arch) do
    begin
        for i:=1 to y do 
            read(arch,vec[i]);
        readln(arch);
        if vec[y] mod vec[1] = 0 then
        begin
            n:=n+1;
            mat[n]:=vec;
        end;
    end;
    close(arch);
end;

procedure mostrarmat(mat:tmw;n,m:byte);
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
    mat:tmw;
    n:byte;
begin
    leer(mat,n);
    mostrarmat(mat,n,y);
end.