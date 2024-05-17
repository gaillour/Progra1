program ejMatriz;
{Un conjunto de corredores entrenan para una carrera, corriendo una hora cada uno de los 7 días de la
semana y teniendo como meta alcanzar en dicha hora, una mínima de X kms. 
En un archivo de texto se graba la meta X en la primera línea y en las restantes líneas el nombre 
(10 caracteres como máximo) y los km en los 7 días de cada corredor. 
	X=19 						
Ivo 	5 	10 	15 	15 	10 	5 	0 
Pia 	10 	20 	5 	10 	10 	30 	5 
Juan 	5 	5 	10 	1 	10 	15 	25 
Omar 	5 	10 	25 	20 	40 	25 	15 

Se pide desarrollar un programa Pascal, correctamente modularizado que lea y almacene los nombres en 
un vector y los tramos  en una matriz. 
a.-Generar un arreglo con los nombres de los corredores que superaron la meta establecida algún día 
de la semana. Imprimirlo 
b.- Calcule e imprima, cuantos días no alcanzo la meta  el corredor con promedio diario máximo
}


const 
    max=10;
    m=7;//dias

type
    st10=string[10];
    tv=array[1..max] of st10;
    tm=array[1..max,1..m] of byte;

procedure leer(var mat:tm;var vnom:tv;var n,x:byte);
var
    arch:text;
    i:byte;
begin
    assign(arch,'ejMatriz.txt'); reset(arch);
    readln(arch,X);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        read(arch,vnom[n]);
        for i:=1 to 7 do
            read(arch,mat[n,i]);
        readln(arch);
    end;
    close(arch);
end;


procedure superaronX(mat:tm;vnom:tv;n,m,x:Byte;var superaron:tv;var k:byte);
var
    i,j:byte;
begin
    k:=0;
    for i:=1 to n do
    begin
        j:=1;
        while (j<=m) and (mat[i,j]<=x) do 
            j:=j+1;
        if mat[i,j]>x then
        begin
            k:=k+1;
            superaron[k]:=vnom[i];
        end;
    end;
end;


function corredorMaxPromedio(mat:tm;n,m:byte):byte;//devuelve la posicion
var
    i,j,imax:byte;
    prom,max:real;
begin
    max:=0;
    for i:=1 to n do
    begin
        prom:=0;
        for j:=1 to m do
            prom:=prom+mat[i,j];
        prom:=prom/m;
        if prom>max then
        begin
            max:=prom;
            imax:=i;
        end;
    end;
    corredorMaxPromedio:=imax;    
end;

function cantDias(mat:tm;i,m,x:byte):byte;
var
    j,aux:byte;
begin
    aux:=0;
    for j:=1 to m do
        if mat[i,j]<=x then aux:=aux+1;
    cantDias:=aux; 
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

procedure mostrarvec(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;

var 
    mat:tm;
    vnom,superaron:tv;
    n,x,k,i:byte;

begin
    leer(mat,vnom,n,x);
    mostrarmat(mat,n,m);
    mostrarvec(vnom,n);
    superaronX(mat,vnom,n,m,x,superaron,k);
    writeln('superaron x: ');
    mostrarvec(superaron,k);

    i:=corredorMaxPromedio(mat,n,m);
    writeln('cant de dias que ',vnom[i],' no supero la meta ',x,': ',cantDias(mat,i,m,x));

end.