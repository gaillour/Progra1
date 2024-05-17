program campus;

const 
    x=15;
type 
    tstr=array[1..15] of string;
    tbyte=array[1..15] of byte;
    treal=array[1..15] of real;

procedure leer(var vnom:tstr;var vapuntes,vtareas,vforos:tbyte;var n:byte);
var
    arch:text;
    car:char;
    nombre:string;
    dias:byte;
begin
    assign(arch, 'alumnos.txt'); reset(arch);
    n:=0; 
    while not eof(arch) do
    begin
        nombre:='';
        read(arch,car);
        while car<>'.' do
        begin
            if (car=upcase(car)) and (car<>'.') then
                nombre:=nombre+car;
            read(arch,car);
        end;
        read(arch,dias);
        if dias<x then
        begin
            n:=n+1;
            vnom[n]:=nombre;
            readln(arch,vapuntes[n],vtareas[n],vforos[n]);
        end
        else readln(arch);
    end;
    close(arch);
end;

{a)  Para cada alumno, nombre, cantidad total de accesos 
y qué % de ellos corresponden a tareas}

procedure cantyprom(var vnom:tstr;var vapuntes,vtareas,vforos,vtotal:tbyte;var ptareas:treal; var n:byte);
var
    i:byte;

begin
    for i:=1 to n do 
    begin
        vtotal[i]:=vapuntes[i]+vtareas[i]+vforos[i];
        ptareas[i]:=(vtareas[i]*100)/vtotal[i];
    end;
  
end;


{b)  Dado un rango de accesosTotales[E1, E2] obtener promedio general de 
acceso a las tareas.}
function promedio(e1,e2:byte;vtareas,vtotal:tbyte;ptareas:treal;n:byte):real;
var
    i,cant:byte;
    suma:real;
begin
    cant:=0; suma:=0;
    for i:=1 to n do
    begin
        if (vtotal[i]<e2) and (vtotal[i]>e1) then
        begin
            suma:=suma+ptareas[i];
            cant:=cant+1;
        end;
    end;
    promedio:=suma/cant;
end;


//c)
function posmasacceso(vtareas,vforos:tbyte;n:byte):byte;
var
    i,max:byte;

begin
    max:=0;posmasacceso:=0;
    for i:=1 to n do
    begin
        if (vforos[i]=0 ) and (vtareas[i]>max) then
        begin
            max:=vtareas[i];
            posmasacceso:=i;
        end;
    end;
end;


var 
    vnom:tstr;
    vapuntes,vtareas,vforos,vtotal:tbyte;
    i,n,e1,e2:byte;
    ptareas:treal;

begin
leer(vnom,vapuntes,vtareas,vforos,n);
cantyprom(vnom,vapuntes,vtareas,vforos,vtotal,ptareas,n);


for i:=1 to n do
    writeln(vnom[i],' ', vapuntes[i],' ',vtareas[i],' ',vforos[i],' ',vtotal[i],' ',ptareas[i]:4:2);

writeln('[E1,E2]');
write('E1: ');
readln(e1);
write('E2: ');
readln(e2);
writeln('el promedio general de acceso a tareas fue: ', promedio(e1,e2,vtareas,vtotal,ptareas,n):4:2);

writeln(' la persona con mas accesos a tareas y ninguno a foros fue: ',vnom[posmasacceso(vtareas,vforos,n)]);
end.