program g6be5;

{Una Tarjeta de Crédito tiene información de las compras de sus N clientes en un archivo  y  en cada
línea se almacenó: 
 Número de cliente   (puede repetirse) 
 Tipo de compras (1=Supermercado, 2=Combustible, 3=Indumentaria, 4=Otros) 
 Monto de la compra. 
Nota: Un cliente puede registrar más de una compra del mismo tipo.  
 
Leer los datos en un arreglo NroCli paralelo a la matriz acumulativa Compras de Nx4 donde la 1º 
columna corresponde a la compra en Supermercado, la 2º a Combustible, la 3º a Indumentaria y la 4º a 
Otros. Calcular e Informar: 

a) Total de compras en cada rubro. 
b) Listado con los clientes en los cuales el monto en Supermercado superó a Indumentaria 
c) Promedio de compra por cliente.
d) Número de cliente que más consumió. 
e) Cuántos clientes no registraron compras en algún rubro. 
}

const
    max=20;
    m=4;

type
    tm=array[1..max,1..4] of integer;
    tv=array[1..max] of integer;



{inicio}
procedure posicion(nro:integer;var vnro:tv;var n,j:byte);
var
    i:byte;
begin
    i:=1;
    while (i<n) and (vnro[i]<>nro) do
        i:=i+1;
    if vnro[i]=nro then
        j:=i
    else
    begin
        n:=n+1;
        j:=n;
        vnro[n]:=nro;
    end;
end;
procedure leer(var compras:tm;var vnro:tv;var n:byte);
var
    nro,monto:integer;
    j,tipo:byte;
    arch:text;
begin
    assign(arch,'e5.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        readln(arch,nro,tipo,monto);
        posicion(nro,vnro,n,j);{devuelve j=pos del numero o j=ultimo+1}
        compras[j,tipo]:=compras[j,tipo]+monto;
    end;
    close(arch);
end;





{a,b,c,d,e}

//a) Total de compras en cada rubro. 
procedure totalCompras(compras:tm;n:byte);
var
    i,tot,j:byte;
begin
    for j:=1 to m do
    begin
        tot:=0;
        for i:=1 to n do
            if compras[i,j]>0 then tot:=tot+1;
        writeln('total de compras en rubro nro ',j,': ', tot)
    end;
    
end;
//b) Listado con los clientes en los cuales el monto en Supermercado superó a Indumentaria 
procedure SuperMejorIndum(vnro:tv;compras:tm;n:byte);
var
    i,j:byte;
begin
    writeln('clientes en los que super supero a indumentaria: ');
    for i:=1 to n do
    begin
        if compras[i,1]>compras[i,3] then
            write(vnro[i],' ');
    end;
    
end;
//c) Promedio de compra por cliente.
function promCompraXCliente(compras:tm;n:byte):real;
var
    i,j:byte;
    suma:integer;

begin
    suma:=0;
    for i:=1 to n do
    begin
        for j:=1 to m do
            suma:=suma+compras[i,j];
    end;
    promCompraXCliente:=suma/n;
end;
//d) Número de cliente que más consumió.
function clienteMayorConsumo(vnro:tv;compras:tm;n:byte):integer;
var
    max,suma:integer;
    i,j,imax:byte;
begin
    max:=0;
    for i:=1 to n do
    begin
        suma:=0;
        for j:=1 to m do suma:=suma+compras[i,j];
        if suma>max then 
        begin
            max:=suma;
            imax:=i;
        end;
    end;
    clienteMayorConsumo:=vnro[imax];    
end;
//e) Cuántos clientes no registraron compras en algún rubro.
function noCompraron(compras:tm;n:byte):byte;
var
    i,j,tot:byte;

begin
    tot:=0;
    for i:=1 to n do
    begin
        j:=1; 
        while (j<n) and (compras[i,j]<>0) do
            j:=j+1;
        if compras[i,j]=0 then tot:=tot+1
    end;   
    noCompraron:=tot; 
end;




{mostrar}
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
procedure mostrarvec(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;
procedure inicializar(var mat:tm);
var
    i,j:byte;
begin
    for i:=1 to max do
        for j:=1 to max do 
            mat[i,j]:=0;
end;


var
    Compras:tm;
    vnro:tv;
    n:byte;
begin
    inicializar(compras);
    leer(Compras,vnro,n);
    mostrarmat(Compras,n,m);
    mostrarvec(vnro,n);
    totalCompras(Compras,n);
    SuperMejorIndum(vnro,Compras,n);
    writeln('promedio de compra por cliente: ',promCompraXCliente(Compras,n):4:2);
    writeln('cliente de mayor consumo: ',clienteMayorConsumo(vnro,Compras,n));
    writeln('cantidad de clientes que no registraron compras en algun rubro: ',noCompraron(Compras,n));
end.