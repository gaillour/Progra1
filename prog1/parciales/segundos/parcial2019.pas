program parcial2019;

const
    lim=20;

type 
    st8=string[8];
    tmat=array[1..lim,1..lim] of Integer;
    rubro=record
        nombre:st8;
        margen:integer;
    end;
    tv=array[1..lim] of rubro;


procedure leer(var mat:tmat;var rubros:tv;var n,m:byte);
var 
    arch:text;
    i,j,k:byte;
    importe:integer;
begin
    assign(arch,'rubros.txt'); reset(arch);i:=0;
    readln(arch,n,m);
    for k:=1 to n do
        readln(arch,rubros[k].nombre,rubros[k].margen);
    while not eof(arch) do
    begin
        i:=i+1;
        repeat
            read(arch,i,importe);
            if (i<>0) and (importe<>0) then
            mat[i,j]:=mat[i,j]+importe;
        until (j=0) or (importe=0);
        readln(arch);
    end;
end;

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
    rubros:tv;
    n,m:byte;

begin
inicializar(mat);
leer(mat,rubros,n,m);
mostrarmat(mat,n,m);

end.