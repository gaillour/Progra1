program tambos;

const   
    MAX=40;
type
    st4= string[4];
    tvs4=array[1..MAX] of st4;
    tvi=array[1..MAX] of  integer;
    tvb=array[1..MAX] of byte;


procedure leer(var vcod:tvs4;var vtot:tvi;var vent:tvb;var n:byte);
var
    lts:integer;
    i,j,dia:byte;
    cod:st4;
    arch:text;

begin
    assign(arch,'tambos.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        readln(arch,cod,dia,lts);
        i:=1;
        while (i<n) and (vcod[i]<>cod) do
            i:=i+1;
        if vcod[i]=cod then
            j:=i
        else 
        begin
            n:=n+1;j:=n;
            vcod[n]:=cod;
            vent[n]:=0;
            vtot[n]:=0;
        end;
        vent[j]:=vent[j]+1;
        vtot[j]:=vtot[j]+lts;
    end;
    close(arch);
end;

//a) Código del tambo que más leche entregó a la compañía.
function masleche(vcod:tvs4;vtot:tvi;n:byte):st4;
var 
    i,imax:byte;
    max:integer;
begin
    max:=0;
    for i:=1 to n do
    begin
        if vtot[i]>max then
        begin
            max:=vtot[i];
            imax:=i;  
        end;
    end;
    masleche:=vcod[imax];
end;

//b) Cuántos superaron un promedio de X litros de entrega.
{function promedio(vtot:tvi;vent:tvb;n:byte;x:real):byte;
var
    i,cant:byte;
    prom:real;

begin
    cant:=0;
    for i:=1 to n do
    begin
        prom:=vtot[i]/vent[i];
        if prom>x then
            cant:=cant+1
    end;    
    promedio:=cant;
end;}

//c) Dado un código, el total y el promedio diario entregado, (si es que existe)
procedure totyprom(cod:st4;vcod:tvs4;vtot:tvi;vent:tvb;n:byte);
var
    i:byte;

begin
    i:=1;
    while (i<n) and (vcod[i]<>cod) do
        i:=i+1;
    if vcod[i]=cod then
        writeln('el total es: ',vtot[i],' con un promedio de: ',(vtot[i]/vent[i]):4:2)
    else writeln('no se encontro');
end;

{Cuántos superaron un promedio de X litros de entrega. }
function superax (vtot:tvi;vent:tvb;n:byte;x:real):byte;
var
i,cant:byte;
prom:real;
begin
    prom:=0;cant:=0;
    for i:=1 to n do
      begin
            prom:=vtot[i]/vent[i];
            if prom>x then
              cant:=cant+1;
      end;
      superax:=cant;  
end;


var    
    vcod:tvs4;
    vtot:tvi;
    vent:tvb;
    n,i:byte;
    x:real;
    cod:st4;
begin
    leer(vcod,vtot,vent,n);
    for i:=1 to n do
    begin
        writeln(vcod[i],' ',vtot[i],' ',vent[i]);
    end;

    writeln('el que mas leche entrego: ',masleche(vcod,vtot,n));
    write('ingrese el promedio: ');readln(x);
    writeln('la cantidad q superan ',x:4:2,' son: ', superax(vtot,vent,n,x));
    write('ingrese codigo: ');readln(cod);
    totyprom(cod,vcod,vtot,vent,n);
end.