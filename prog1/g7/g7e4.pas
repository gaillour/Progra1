program g7e4;

{ En una competencia intervienen N equipos deportivos de los cuales se registró: 
  Nombre del Club 
  Cantidad de partidos jugados 
  El resultado de cada encuentro  ( G = ganado, E = empatado, P = perdido) 
Se pide almacenar los datos en una estructura adecuada junto con el total del
puntaje obtenido. Por cada 
partido ganado son 3 puntos, empatado 1 y perdido 0. 
A partir de lo almacenado, informar: 
a) Listado con los nombres de los clubes junto con el puntaje obtenido. 
b) Nombre de el/los punteros de la Tabla. 
c) Porcentaje de los que no perdieron ningún partido sobre el total de clubes.}

type
    club=record
        nombre:string;
        cpartidos:byte;
        puntos:byte;
    end;
    tv=array[1..15] of club;
    tvstring=array[1..15] of string;

function puntaje(gep:char):byte;
begin
    if gep='G' then
        puntaje:=3
    else if gep='E' then
        puntaje:=1
    else puntaje:=0;
end;


procedure leer(var vec:tv;var noperdieron,n:byte);
var
    arch:text;
    car,blanco:char;
    perdieron:boolean;
    i:byte;
begin
    assign(arch, 'partidos.txt'); reset(arch);
    n:=0;noperdieron:=0;
    while not eof(arch) do
    begin
        n:=n+1; perdieron:=false;
        read(arch,car);
        while car<>' ' do
        begin
            vec[n].nombre:=vec[n].nombre +car;
            read(arch,car);
        end;
        read(arch,vec[n].cpartidos);
        vec[n].puntos:=0;
        for i:=1 to vec[n].cpartidos do
        begin
            read(arch,blanco,car);
            car:=upcase(car);
            vec[n].puntos:=vec[n].puntos+puntaje(car);
            if car='P' then
                perdieron:=true;
        end;
        if perdieron=false then
            noperdieron:=noperdieron+1;
        readln(arch);
    end;
end;

procedure punteros(var vec:tv; var vpunteros:tvstring;var n,m:byte);
var
    i,max,imax:byte;
begin
    max:=0;
    for i:=1 to n do 
    begin
        with vec[i] do
        begin
            if puntos>max then
            begin
                max:=puntos; 
                imax:=i;
            end;      
        end;
    end;
    m:=0;
    for i:=1 to n do
    begin
        if vec[i].puntos = vec[imax].puntos then
        begin
            m:=m+1;
            vpunteros[m]:=vec[i].nombre;
        end;
    end;

end;


procedure mostrarlista(var vec:tv;var n:byte);
var
    i:byte;
begin           
    for i:=1 to n do 
        writeln(vec[i].nombre,' ', vec[i].cpartidos,' ',vec[i].puntos);
end;


var
    vec:tv;
    i,n,m,noperdieron:byte;
    vpunteros:tvstring;

begin
leer(vec,noperdieron,n);
mostrarlista(vec,n);
punteros(vec,vpunteros,n,m);

write('lista de punteros: ');
for i:=1 to m do
    writeln(vpunteros[i]);

writeln(noperdieron,' equipo/s no perdieron ningun partido');
end.