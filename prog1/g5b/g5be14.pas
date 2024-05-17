program g5be14;

{Una empresa de autos de alquiler grabó en cada línea del archivo la patente del vehículo
(cadena de 7) y el total recaudado en el día. Se pide leer los datos en dos arreglos paralelos
e informar: 
a) El promedio recaudado por auto. 
b) Las patentes de los vehículos que superaron en la recaudación X pesos (X es dato). 
c) La patente del que recaudó menos}


const 
    max=40;
type
    st7=string[7];
    tvs=array[1..max] of st7;
    tvr=array[1..max] of real;

procedure insertar(patente:st7;var vpat:tvs;var n,j:byte);
var
    i:byte;
begin
    i:=1;
    while (i<n) and (vpat[i]<>patente)do
        i:=i+1;
    if vpat[i]=patente then
        j:=i
    else 
    begin
        n:=n+1;
        j:=n;
        vpat[n]:=patente;    
    end;
end;


procedure leer(var vpat:tvs;var vtot:tvr; var n:byte);
var
    arch:Text;
    patente:st7;
    tot:real;
    j:byte;
begin
    assign(arch,'e14.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        Readln(arch,patente,tot);
        insertar(patente,vpat,n,j);
        vtot[j]:=vtot[j]+tot;      
    end;
    close(arch);
end;

//a)
function promedio(vtot:tvr;n:byte):real;
var
    i:byte;
    aux,suma:real;
begin
    suma:=0;
    for i:=1 to n do
        suma:=suma+vtot[i];
    aux:=suma/n;
    promedio:=aux;
end;

//b)
procedure superaron(x:real;vpat:tvs;vtot:tvr;n:byte);
var
    i:byte;
begin
    writeln('las patentes que superaron ',x:4:2,' fueron:');
    for i:=1 to n do
        if vtot[i]>x then
            writeln(vpat[i])
end;

function recaudomenos(vpat:tvs;vtot:tvr;n:byte):string;
var
    i,imin:byte;
    min:real;
begin
    min:=9999;
    for i:=1 to n do
    begin
        if vtot[i]<min then
        begin
            min:=vtot[i];
            imin:=i;
        end;
    end;
    recaudomenos:=vpat[imin];
end;

procedure mostrar(vpat:tvs;vtot:tvr;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln('la patente ',vpat[i],' recaudo ',vtot[i]:4:2,' en total')
end;

var
    vpat:tvs;
    vtot:tvr;
    n:byte;
    x:real;

begin
    leer(vpat,vtot,n);
    mostrar(vpat,vtot,n);
    writeln('el promedio recaudado por auto es: ', promedio(vtot,n):4:2);
    write('ingrese limite inferior (x): ');
    readln(x);
    superaron(x,vpat,vtot,n);
    WriteLn('la patente del que menos recaudo es: ',recaudomenos(vpat,vtot,n));

end.