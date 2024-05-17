program g7be4;

{ En una competencia intervienen N equipos deportivos de los cuales se registró: 
      Nombre del Club 
      Cantidad de partidos jugados 
      El resultado de cada encuentro  ( G = ganado, E = empatado, P = perdido) 
Se pide almacenar los datos en una estructura adecuada junto con el total del puntaje obtenido. 
Por cada partido ganado son 3 puntos, empatado 1 y perdido 0. 
A partir de lo almacenado, informar: 
a) Listado con los nombres de los clubes junto con el puntaje obtenido. 
b) Nombre de el/los punteros de la Tabla. 
c) Porcentaje de los que no perdieron ningún partido sobre el total de clubes}

const
    max=30;

type
    TrE=record
        nombre:string;
        puntaje:byte;
        perdio:boolean;
    end;
    tv=array[1..max]of TrE;

procedure leer(var vec:tv;var n:byte);
var
    arch:text;
    i,k:byte;
    blanco,resultado,car:char;
begin
    assign(arch,'e4.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        with vec[n] do
        begin
            nombre:='';puntaje:=0;perdio:=false;
            read(arch,car);
            while car<>' ' do
            begin
                nombre:=nombre+car;read(arch,car);
            end;
            read(arch,k);
            for i:=1 to k do
            begin
                read(arch,blanco,resultado);
                case resultado of
                    'G':puntaje:=puntaje+3;
                    'E':puntaje:=puntaje+1;
                    'P':perdio:=true;
                end;
            end;
            readln(arch);
        end;
    end;
    close(arch);
end;

procedure punteros(vec:tv;n:byte);
var
    i,imax:byte;
    max:real;
begin
    write('puntero/s: ');
    max:=0;
    for i:=1 to n do
    begin
        with vec[i] do
        begin   
            if puntaje>max then
            begin
                max:=puntaje;
                imax:=i
            end;            
        end;
    end;
    for i:=imax to n do
    begin
        if vec[i].puntaje=max then
            write(vec[i].nombre,' ')
    end;
    writeln;
end;

function noPerdieron(vec:tv;n:byte):real;
var
    i:byte;
    suma:word;
begin
    suma:=0;
    for i:=1 to n do 
        with vec[i] do
            if not perdio then
                suma:=suma+1;
    noPerdieron:=(suma/n)*100;
end;

procedure mostrar(vec:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
    begin
        with vec[i] do
            writeln(nombre,' : ',puntaje);
    end;
end;


var
    vec:tv;
    n:byte;
begin
    leer(vec,n);
    mostrar(vec,n);
    punteros(vec,n);
    writeln('porcentaje de equipos que no perdio ni un partido: ',noPerdieron(vec,n):4:2,'%');

end.