program g6e5;

{ Una Tarjeta de Crédito tiene información de las compras de sus N clientes en un 
archivo  y  en cada línea se almacenó: 
 Número de cliente   (puede repetirse) 
 Tipo de compras (1=Supermercado, 2=Combustible, 3=Indumentaria, 4=Otros) 
 Monto de la compra. 
Nota: Un cliente puede registrar más de una compra del mismo tipo.  
 
Leer los datos en un arreglo NroCli paralelo a la matriz acumulativa Compras de Nx4
donde la 1º columna corresponde a la compra en Supermercado, la 2º a Combustible,
la 3º a Indumentaria y la 4º a Otros. Calcular e Informar: 
a) Total de compras en cada rubro. 
b) Listado con los clientes en los cuales el monto en Supermercado superó a Indumentaria 
c) Promedio de compra por cliente. 
d) Número de cliente que más consumió. 
e) Cuántos clientes no registraron compras en algún rubro
}

const   
    m=4;
type
    tint=array[1..20] of integer;
    tmat=array[1..20,1..4] of integer;
    tbyte=array[1..4] of byte;

procedure leer(var vcod:tint;var mat:tmat;var n:byte);
var
    arch:text;
    j:byte;
begin
    assign(arch,'tarjeta.txt');reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        read(arch, vcod[n],j);
        readln(arch,mat[n,j]);
    end;
end;



{a) Total de compras en cada rubro.}
procedure totaldecompras(var mat:tmat;var vrubro:tbyte;n:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        j:=1;
        while (j<m) and (mat[i,j]=0) do
            j:=j+1;
        if mat[i,j]<>0 then
            vrubro[j]:=vrubro[j]+1;
        
    end;    
end;

{b) Listado con los clientes en los cuales 
el monto en Supermercado superó a Indumentaria 
1=Supermercado, 2=Combustible, 3=Indumentaria, 4=Otros}
procedure clientessupermercado(var vcod,vclientes:tint;var mat:tmat;var n,c:byte);
var
    i:byte;
begin  
    c:=0;
    for i:=1 to n do
    begin
        if mat[i,1]>mat[i,3] then
        begin
            c:=c+1;
            vclientes[c]:=vcod[i];
        end;    
    end;
end;



procedure mostrarmat(var vcod:tint;var mat:tmat;var n:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        write(vcod[i],': ');
        for j:=1 to m do
            write(mat[i,j],' ');
        writeln;
    end;
end;

procedure mostrarvec(var vrubro:tbyte);
var
    i:byte;
begin
    for i:=1 to m do
        writeln(i,': ',vrubro[i],' ');
end;


var 
    vcod,vclientes:tint;
    mat:tmat;
    vrubro:tbyte;
    i,n,c:byte;

begin
leer(vcod,mat,n);
mostrarmat(vcod,mat,n);
totaldecompras(mat,vrubro,n);
writeln('cantidad de compras por rubro: ');
mostrarvec(vrubro);
clientessupermercado(vcod,vclientes,mat,n,c);
for i:=1 to c do 
    writeln(vclientes[i]);


  
end.