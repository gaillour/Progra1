program junio2021;

const
    MAX=20;

type
    st10=string[10];
    st4=string[4];
    Tr=record
        tipo:st10;
        precio,porcentaje:real;
    end;
    TrX=record
        cod:st4;
        tipo:st10;
    end;
    tvs4=array[1..MAX] of st4;
    tvr=array[1..MAX] of tr;
    tm=array[1..MAX,1..MAX] of byte;
    tvX=array[1..MAX] of TrX;


procedure leerTipos(var vtipos:tvr;var m:byte);
var
    arch:text;
    i:byte;
begin
    assign(arch,'ventas.txt'); reset(arch);
    readln(arch,m);
    for i:=1 to m do
        with vtipos[i] do
            readln(Arch,tipo,precio);
    close(arch);
end;

procedure leerMat(var mat:tm;var vCod:tvs4;var n:byte;m:byte);
var
    j:byte;
    arch:text;
begin
    assign(arch,'combustible.txt'); reset(arch);
    n:=0;
    while not eof(Arch) do  
    begin
        n:=n+1;
        read(arch,vCod[n]);
        for j:=1 to m do
            read(arch,mat[n,j]);
        readln(arch);
    end;
    close(arch);
end;

{a)Para un código de surtidor C, el tipo de combustible que más litros vendió. Puede no existir.
Recursividad: Obtener la posición del máximo de una fila (para el inciso a)}

function busca(vCod:tvs4; C:st4;n:byte):byte;
var
    i:byte;
begin
    i:=1;
    while (i<n) and (vCod[i]<>C) do 
        i:=i+1;
    if vCod[i]=C then busca:=i
    else  busca:=0;
end;

procedure maxFila(mat:tm;i,j:byte;var max,jmax:byte);
begin
    if j>0 then
    begin
        if mat[i,j]>max then
        begin
            max:=mat[i,j];
            jmax:=j;
        end;
        maxFila(mat,i,j-1,max,jmax)
    end;
end;

{Porcentaje de importe de venta de cada  tipo de combustible respecto de la venta 
total de combustible.
Recursividad:   - Total de ventas de tipo de combustible (para el inciso b) 
            o   - Total de ventas del día (para el inciso b)}
procedure totalVentas(mat:tm;vTipos:tvr;i,j,m:byte;var tot:real);
begin
    if i>0 then
    begin
        if j>0 then
        begin
            tot:=tot+mat[i,j]*vTipos[j].precio;
            totalVentas(mat,vTipos,i,j-1,m,tot);
        end
        else totalVentas(mat,vTipos,i-1,m,m,tot);
    end;
end;

procedure porcentajes(mat:tm;var vtipos:tvr;n,m:byte;tot:real);
var
    i,j:byte;
    suma:real;

begin
    for j:=1 to m do
    begin
        suma:=0;
        for i:=1 to n do
            suma:=suma+mat[i,j]*vtipos[j].precio;   
        vtipos[j].porcentaje:=(suma/tot)*100;
    end;
end;

{Para aquellos surtidores que vendieron más de X litros de un tipo de combustible, generar una
estructura con: código de surtidor y  tipo de combustible. Luego listarlos.}
{                   st4                     st10            }
procedure superaronX(mat:tm;vCod:tvs4;vtipos:tvr;n,m,x:byte;var superaron:tvX;var k:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            if mat[i,j]>x then
            begin
                k:=k+1;
                superaron[k].cod:=vCod[i];
                superaron[k].tipo:=vtipos[j].tipo;
            end;
        end;
    end;
end;

procedure listarX(superaron:tvX;k:byte);
var
    i:byte;
begin
    for i:=1 to k do
        writeln(superaron[i].cod,' ', superaron[i].tipo)
end;

procedure mostrarmatyvec(mat:tm;vec:tvs4;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        Write(vec[i],': ');
        for j:=1 to m do
        begin
            write(mat[i,j],' ');
        end;
        writeln;
    end;
end;

var
    vtipos:tvr;
    x,k,n,m,i,jmax,maximo,pos:byte;
    mat:tm;
    vCod:tvs4;
    C:st4;
    tot:real;
    superaron:tvX;
begin
    leerTipos(vtipos,m);
    leerMat(mat,vCod,n,m);
    mostrarmatyvec(mat,vCod,n,m);

    write('ingrese codigo de surtidor: ');
    ReadLn(C);
    pos:=busca(vCod,C,n);    
    if pos>0 then
    begin
        maxFila(mat,pos,m,maximo,jmax);
        writeln('el tipo que mas vendio ',C,': ', vtipos[jmax].tipo);
    end
    else writeln('no se encontro');

    tot:=0;
    totalVentas(mat,vtipos,n,m,m,tot);
    porcentajes(mat,vtipos,n,m,tot);
    for i:=1 to m do
        writeln(vtipos[i].porcentaje:4:2);

    
    write('ingrese X: ');readln(X);
    superaronX(mat,vCod,vtipos,n,m,x,superaron,k);
    listarX(superaron,k);


end.