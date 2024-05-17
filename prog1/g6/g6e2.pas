program g6e2;
{ En un archivo se almacenó el Nombre del alumno y la nota de los K parciales, 
pasar los datos a un vector Nbre paralelo a la matriz Notas e informar: 
a) Listado de los alumnos que aprobaron los K parciales. 
b) Por cada alumno determinar su situación: 
 Promociona: si el promedio es >= 7 
 Habilita: si promedio >= 5 y < 7; y la K-ésima nota >= 5  
 Desaprobado: en otro caso 
y generar un arreglo con los nombres de aquellos que promocionaron}

const   
    k=3;

type 
    tstring=array[1..10] of string;
    tmat=array[1..10,1..k] of byte;
    treal=array[1..10] of real;

procedure leer(var vnom:tstring; var mnotas:tmat;var n:byte);
var
    j:byte;
    arch:text;
    car:char;
begin
    n:=1;
    assign(arch,'notas.txt');
    reset(arch);
    while not eof(arch) do
    begin
        read(arch,car);
        if car=' ' then
        begin
            for j:=1 to k do
                read(arch,mnotas[n,j]);
            n:=n+1;
        end
        else vnom[n]:=vnom[n]+car;
    end;
end;

procedure mostrar(var vnom:tstring;var mnotas:tmat;var n:byte);
var
    i,j:byte;
begin   
    for i:=1 to n do
    begin
        write(vnom[i], ' ');
        for j:=1 to k do
            write(mnotas[i,j]);
    end;
end;


procedure aprobaron(var vnom:tstring;var mnotas:tmat;var aprobados:tstring;var n,kaprobados:byte);
var
    i,j:byte;

begin
    kaprobados:=0;
    for i:=1 to n do
    begin
        j:=0;
        repeat
            j:=j+1;
        until(j=k) or (mnotas[i,j]<5); 
        if (j=k) and (mnotas[i,j]>=5) then
        begin
            kaprobados:=kaprobados+1;
            aprobados[kaprobados]:=vnom[i];
        end;
    end;
end;

procedure inicializar(var vprom:treal;var n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        vprom[i]:=0;
end;

procedure promedios(var mnotas:tmat;var vprom:treal;var n:byte);
var
    i,j:byte;
       
begin
    for i:=1 to n do
    begin
        for j:=1 to k do
            vprom[i]:=vprom[i]+mnotas[i,j];
        vprom[i]:=vprom[i]/k;
    end;
end;

procedure situacion(var vnom,vpromocionados:tstring; var vprom:treal;var n,p:byte);
var
    i:byte;
begin
    p:=0;
    for i:=1 to n do
    begin
        if vprom[i]>=7 then
        begin
            p:=p+1;
            vpromocionados[p]:=vnom[i];
        end;
    end;
end;

var
    vnom,aprobados,vpromocionados:tstring;
    mnotas:tmat;
    vprom:treal;
    n,i,kaprobados,p:byte;

begin
leer(vnom,mnotas,n);
mostrar(vnom,mnotas,n);
writeln;



aprobaron(vnom,mnotas,aprobados,n,kaprobados);
write('los que aprobaron los ', k, ' parciales fueron: ');
for i:=1 to kaprobados do
    write(aprobados[i],' ');

inicializar(vprom,n);
promedios(mnotas,vprom,n);
situacion(vnom,vpromocionados,vprom,n,p);
for i:=1 to n do 
begin
    writeln(vnom[i],': ', vprom[i]:4:2);
end;

write(' promocionaron: ');
for i:=1 to p do
    write(vpromocionados[i]);
end.