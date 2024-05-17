program procedimientos;

type 
    tmat=array[1..10, 1..10] of integer;

//por filas
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

begin
  

end.