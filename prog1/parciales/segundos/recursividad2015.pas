program recursividad2015;

const  
    n=5;
    m=3;

type
    tmat=array[1..n,1..m] of integer;
    tv=array[1..n]of integer;

const
    mat:tmat=((2,0,3),(3,6,4),(0,0,0),(7,4,7),(3,0,7));
    vec:tv=(2,5,7,1,5);

procedure inicializar(var mat:tmat;i,j:byte);
begin
    if (i<=n) then
    begin
        if (j<=m) then
        begin
            mat[i,j]:=0;
            inicializar(mat,i,j+1)
        end
        else inicializar(mat,i+1,1);
    end
end;    

procedure cantceros(mat:tmat;i,j:byte;var cant:byte);
begin
    if i<=n then
    begin
        if mat[i,j]=0 then
        begin
            cant:=cant+1;
        end;
        cantceros(mat,i+1,j,cant);
    end;
end;

procedure nulos(mat:tmat;i,j:byte;var filanula:boolean);
begin
    filanula:=true;
    if j<=m then
    begin
        if mat[i,j]<>0 then
            filanula:=false
        else nulos(mat,i,j+1,filanula);
    end;
end;


procedure buscar(vec:tv;i,x:byte;var pos:byte);
begin
    if i<=n then
    begin
        if vec[i]=x then
            pos:=i
        else buscar(vec,i+1,x,pos)

    end;       
end;


procedure mostrarmat(var mat:tmat);
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
    mat0:tmat;
    cant,i,j,pos:byte;
    filanula:boolean;
begin
inicializar(mat0,1,1);
mostrarmat(mat0);
writeln;
mostrarmat(mat);

cant:=0;
write('ingrese columna a buscar: ');
repeat
  readln(j);
until j<=m;

cantceros(mat,1,j,cant);
writeln('en la columna ', j,' hay ', cant, ' ceros');

repeat
    write('ingrese fila a buscar: ');
    readln(i)
until i<=n;

filanula:=false;
nulos(mat,i,1,filanula);

if filanula then
    writeln('la fila ',i,' tiene todos sus elementos nulos')
else writeln('la fila ',i,' no tiene todos sus elementos nulos');

buscar(vec,1,5,pos);
writeln(pos)

end.
