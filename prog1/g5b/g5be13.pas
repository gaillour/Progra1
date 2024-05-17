program g5be13;

{ En una estación de peaje hay N cabinas por donde pasan varios vehículos. 
Desde un archivo se lee la siguiente información: 
    • Número de cabina 
    • Tipo de vehículo (1=auto, 2=moto, 3=camioneta, 4=camión, 5=colectivo) 
    • Hora (0..23) 

Las tarifas son: moto = $150, auto y camioneta = $300, camión = $470, colectivo = $390.

Si la hora está entre las 10 y las 18 sufre un incremento del 10%. 

Calcular e informar: 
a)  Cuántos vehículos atendió cada una de las N cabinas.  
b)  Cuál fue la que más importe recaudó
}

const
    N=6;{numero de cabinas}
type
    tvr=array[1..N] of real;
    tvb=array[1..N] of byte;

function importe(tipo,hora:byte):real;
var
    aux:real;
begin
    case tipo of
        1:aux:=300;
        2:aux:=150;
        3:aux:=300;
        4:aux:=470;
        5:aux:=390;
    end;
    if (hora>=10) and (hora<=18) then
        aux:=aux+(aux*0.1);
    importe:=aux;
end;

procedure leer(var vimp:tvr;var vcant:tvb);
var
    arch:text;
    cab,tipo,hora:byte;
    imp:real;

begin
    assign(arch,'e13.txt'); reset(arch);
    while not eof(arch) do
    begin
        readln(arch,cab,tipo,hora);
        imp:=importe(tipo,hora);
        vimp[cab]:=vimp[cab]+imp;
        vcant[cab]:=vcant[cab]+1;
    end;
    close(arch);
end;

procedure mostrar(vimp:tvr;vcant:tvb;n:byte);
var
    i:Byte;
begin
    for i:=1 to n do
    begin
        writeln('la cabina ',i,' vendio un total de ',vimp[i]:4:2,' y pasaron ',vcant[i],' vehiculos');
    end;
end;

procedure inicializarr(var v:tvr;n:byte);
var
    i:byte;

begin
    for i:=1 to n do
    begin
        v[i]:=0;
    end;
end;

procedure inicializarb(var v:tvb;n:byte);
var
    i:byte;

begin
    for i:=1 to n do
    begin
        v[i]:=0;
    end;
end;


var
    vcant:tvb;
    vimp:tvr;

begin
    inicializarr(vimp,N);
    inicializarb(vcant,N);
    leer(vimp,vcant);
    mostrar(vimp,vcant,N) 
end.