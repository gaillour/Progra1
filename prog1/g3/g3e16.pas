program g3e16;

{Una empresa de autos de alquiler posee N vehículos y ha registrado la siguiente información 
de los viajes realizados, por cada uno de ellos: 
 Patente  
 Total de litros de combustible consumidos 
Y por cada viaje realizado 
  - Kilómetros recorridos. (0 indica fin de datos). 
Se pide ingresar los datos e informar: 
a)  Por cada vehículo el consumo que tuvo (cantidad de litros por km. recorrido) 
b)  Patente del vehículo que más viajes hizo.  
c)  Total de litros consumidos por el auto que hizo la menor cantidad de kms.}

{ ej linea de archivo:
patente (str[7]) lts(real) km1 km2 km3 .. kmX
AA423BE 70 12 53 64 .. 6
}

var 
    arch:text;
    n,cviajes,maxviajes:byte;
    masviajes,patente:string[7];
    lts,ltsmenorkm,km,kmt,minkm,consumo:real;

begin
    Assign(arch,'autos.txt');Reset(arch);
    readln(arch,n);
    maxviajes:=0; minkm:=9999;
    while not eof(arch) do 
    begin
        read(arch,patente,lts);
        kmt:=0;cviajes:=0;
        repeat
            read(arch,km);
            kmt:=kmt+km;  
            cviajes:=cviajes+1;
        until km=0;
        if cviajes>maxviajes then 
        begin
            maxviajes:=cviajes;
            masviajes:=patente;
        end;
        if kmt<minkm then
        begin
            minkm:=kmt;
            ltsmenorkm:=lts;
        end;
        readln(arch);
        consumo:=lts/kmt;
        writeln(patente,' consume: ', consumo:4:2, ' por km');
    end;
    writeln('la patente del vehiculo con mas viajes es: ', masviajes);
    writeln('los litros consumidos por el auto con menor cantidad de km son: ', ltsmenorkm:4:2);

end.