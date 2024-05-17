program g6e1;

type
    tmat=array[1..6,1..6] of byte;
    tvec=array[1..6] of byte;

procedure leer(var mat:tmat; var n,m:byte);
var
    i,j:Byte;
    arch:text;

begin
    assign(arch,'ej1.txt'); reset(arch);
    readln(arch,n,m);       
    for i:=1 to n do 
    begin
        for j:=1 to m do
            read(arch,mat[i,j]);
        readln(arch);
    end;
end;


{a) Generar un arreglo con el máximo de cada fila y mostrarlo.}
procedure maximos(mat:tmat; var vec:tvec;var n,m:byte);
var
    i,j:byte;
    max:byte;

begin
    for i:=1 to n do
    begin
        max:=mat[1,1];
        for j:=1 to m do 
        begin
            if mat[i,j]>max then
                max:=mat[i,j];
        end;  
        vec[i]:=max;
    end;
end;

{b) Generar un arreglo con la suma de los impares de cada columna,
no generar elemento si la columna no tiene impares}
procedure sumaimp(mat:tmat;var vec:tvec;var n,m,k:byte);
var
    i,j,sum:byte;

begin
    k:=0;
    for j:=1 to m do
    begin
        sum:=0;
        for i:=1 to n do 
        begin
            if mat[i,j] mod 2 <>0 then
                sum:=sum+mat[i,j];
        end;
        if sum > 0 then
        begin
            k:=k+1;
            vec[k]:=sum;
        end;
    end;
end;

{c) Dada una columna X, ingresada por el usuario, hallar el promedio 
de sus elementos.}
function promedio(mat:tmat;n,m,x:Byte):real;
var
    i,suma:byte;

begin
    suma:=0;
    for i:=1 to n do
    begin
        suma:=suma+mat[i,x];
    end;
    promedio:=suma/n;

end;




procedure mostrarmat(mat:tmat;n,m:byte);
var
    i,j:byte;

begin
    for i:=1 to n do
    begin
        for j:=1 to m do
            write(mat[i,j],' ');
        writeln();
    end;
end;

procedure mostrarvec(vec:tvec;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
      writeln(vec[i]);           
end;





var
    mat:tmat;
    n,k,x,m:byte;
    vecmax,vecimp:tvec;

begin
leer(mat,n,m);
mostrarmat(mat,n,m);

writeln('maximo de cada fila:');
maximos(mat,vecmax,n,m);
mostrarvec(vecmax,n);

writeln('suma de impares en columnas: ');
sumaimp(mat,vecimp,n,m,k);
mostrarvec(vecimp,k);


repeat
write('ingrese columna: ');
readln(x);  
until (x>0) and (x<=5);

writeln('el promedio de la columna ',x,' es: ',promedio(mat,n,m,x):4:2);


end.