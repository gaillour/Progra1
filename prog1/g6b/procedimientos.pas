program procedimientos;

type 
    tmat=array[1..10, 1..10] of integer;

//por filas
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

procedure mostrarvec(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;

procedure inicializar(var mat:tmat);
var
    i,j:byte;
begin
    for i:=1 to Length(mat) do
        for j:=1 to Length(mat) do 
            mat[i,j]:=0;
end;

begin
  

end.