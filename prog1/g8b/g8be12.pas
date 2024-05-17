program g8be12;

{Verificar si una matriz A de NxN de números enteros cumple que para cada fila el elemento 
respectivo de la diagonal principal es mayor a la suma del resto de los elementos de la fila.}

const
    n=4;
type
    tm=array[1..N,1..N] of byte;
const
    a:tm=((9,1,1,1),(1,9,1,1),(1,1,9,1),(1,1,1,9));

procedure crear(var mat:tm;n:byte);
var
    i,j:byte;
begin
    randomize;
    for i:=1 to n do
        for j:=1 to n do
            mat[i,j]:=random(10);
end;


procedure sumas(mat:tm;n,i,j,suma:byte;var cumple:boolean);
begin
    if (i>0) and (cumple) then
    begin
        if (j>=1) then
        begin
            if i<>j then suma:=suma+mat[i,j];
            sumas(mat,n,i,j-1,suma,cumple);
        end
        else
        begin
            if mat[i,i]>suma then
            begin
                cumple:=True;
                sumas(mat,n,i-1,n,0,cumple)
            end
            else cumple:=false;        
        end;
    end;
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
    matcumple,acumple:boolean;
begin
    crear(mat,n);
    mostrarmat(mat,n,n);
    matcumple:=true;
    sumas(mat,n,n,n,0,matcumple);
    write('la matriz random ');
    if matcumple then writeln('cumple')
    else writeln('no cumple');

    acumple:=true;
    mostrarmat(a,n,n);
    sumas(a,n,n,n,0,acumple);
    write('la matriz A ');
    if acumple then writeln('cumple')
    else writeln('no cumple')
end.