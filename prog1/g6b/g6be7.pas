program g6be7;

{ La Secretaría de Transporte quiere evaluar el movimiento de pasajeros en N paradas de colectivo. 
En  cada  una  de  ellas  se  detienen  M  líneas  de  colectivo.  Dispositivos  electrónicos  han 
registrado  el movimiento de un día y grabado en un archivo de texto dicha información en tiempo real
(desordenada). 
En cada registro se expresa: 
     Parada (1..N)   
     Línea   (1..M)  
     Cantidad de pasajeros que ascienden  
     Cantidad de pasajeros que descienden  
Se pide leer la información del archivo, almacenándola de forma adecuada para calcular e informar:   
a) Parada con mayor cantidad de pasajeros que bajaron.  
b) Línea con menor cantidad de pasajeros que subieron.  
c) Cantidad de paradas en las cuales el total de personas que subieron fue menor al 40% de las que 
bajaron.  
d) Cuántas líneas no registraron subida o bajada de pasajeros en alguna parada.  
Los ítems anteriores se refieren al movimiento de todo el día.   
¿Qué debería agregar/modificar si se pidiera para cada línea o parada promedio de gente que ascendió o 
descendió cada vez que se detuvo el colectivo? 
}

const
    n=4;m=3;
type
    tm=array[1..n,1..m] of byte;

procedure leer(var mata,matd:tm;n,m:byte);
var
    i,j,asc,desc:byte;
    arch:text;
begin   
    assign(arch,'e7.txt'); reset(arch);
    while not eof(arch) do
    begin
        readln(arch,i,j,asc,desc);
        mata[i,j]:=mata[i,j]+asc;
        matd[i,j]:=matd[i,j]+desc;
    end;
    close(arch);
end;

//b)Parada con mayor cantidad de pasajeros que bajaron.
function masBajaron(matd:tm;n,m:byte):byte;
var
    max,imax,i,j,suma:byte;
    
begin   
    max:=0;
    for i:=1 to n do
    begin
        suma:=0;
        for j:=1 to m do
            suma:=suma+matd[i,j];
        if suma>max then
        begin
            max:=suma; imax:=i;
        end;
    end;
    masBajaron:=imax;
end;

//b) Línea con menor cantidad de pasajeros que subieron.
function menosSubieron(var mata:tm;n,m:byte):byte;
var
    i,j,jmin,min,suma:byte;
begin
    min:=250;
    for j:=1 to m do    
    begin
        suma:=0;
        for i:=1 to n do
            suma:=suma+mata[i,j];
        if suma<min then
        begin
            min:=suma; jmin:=j;
        end;
    end;
    menosSubieron:=jmin;
end;
//c)Cantidad de paradas en las cuales el total de personas que subieron fue menor al 40% de las que bajaron.
function cantParadas(mata,matd:tm;n,m:byte):byte;
var
    i,j,tota,aux:byte;
    porc:real;
begin
    aux:=0;
    for i:=1 to n do
    begin
        porc:=0;tota:=0;
        for j:=1 to n do
        begin
            porc:=porc+matd[i,j];            
            tota:=tota+mata[i,j];
        end;
        porc:=porc/m;
        if tota<porc then aux:=aux+1;
    end;
    cantParadas:=aux;
end;

//d) Cuántas líneas no registraron subida o bajada de pasajeros en alguna parada.
function noRegistraron(mata,matd:tm;n,m:byte):byte;
var
    i,j,aux:byte;
begin
    aux:=0;
    for j:=1 to m do
    begin
        i:=1;
        while (i<n) and ((mata[i,j]<>0) and (matd[i,j]<>0)) do
            i:=i+1; 
        if ((mata[i,j]=0) and (matd[i,j]=0)) then
            aux:=aux+1;
    end;
    noRegistraron:=aux;    
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
    mata,matd:tm;

begin
    leer(mata,matd,n,m);
    writeln('subieron: ');
    mostrarmat(mata,n,m);
    writeln('bajaron: ');
    mostrarmat(matd,n,m);
    writeln('parada en la que mas bajaron: ', masBajaron(matd,n,m)); 
    Writeln('linea en la que menos subieron: ',menosSubieron(mata,n,m));
    writeln('cantidad total subieron < 40% q bajaron: ',cantParadas(mata,matd,n,m));
    writeln('lineas con paradas sin subidas ni bajadas: ', noRegistraron(mata,matd,n,m));
end.