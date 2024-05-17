program propuesto1;

{a) Código del tambo que más leche entregó a la compañía. 
b) Cuántos superaron un promedio de X litros de entrega. 
c) Dado un código, el total y el promedio diario entregado, (si es que existe dicho código). }
const   
    n=4;

type    
    st4=string[4];
    vcod=array[1..n] of st4;
    vtot=array[1..n] of integer;
    vprom=array[1..n] of real;

procedure leer(var cod:vcod; var tot:vtot; var prom:vprom);
var
    arch:text;
    i,cant:byte;
    sum: integer;
begin
    assign(arch,'tambos.txt'); reset(arch);
    i:=0;
    while not eof(arch) do
    begin
        i:=i+1;
        sum:=0; cant:=0;
        readln(arch,cod[i]);
        repeat
        read(arch,sum);
        tot[i]:=tot[i]+sum; 
        cant:=cant+1
        until sum=0;
        prom[i]:=tot[i]/cant;
        readln(arch);
    end;
end;

{a) Código del tambo que más leche entregó a la compañía}
function mayorentrega(cod:vcod; tot:vtot):string;
var
    i,ic:byte;
    max:integer;
begin
    max:=tot[1];
    ic:=1;
    for i:=2 to n do
    begin
        if tot[i]>max then
        begin
            max:=tot[i];
            ic:=i;
        end;
    end;
    mayorentrega:=cod[ic];
end;

{b) Cuántos superaron un promedio de X litros de entrega.}
function superaron(x:real; prom:vprom):byte;
var
    i:byte;
begin
    superaron:=0;
    for i:=1 to n do 
    begin
        if prom[i]>x then
            superaron:=superaron +1;
    end;
end;

{c) Dado un código, el total y el promedio diario entregado, (si es que existe dicho código)}
procedure buscar(cod:vcod; tot:vtot; prom:vprom;codigo:string; var total:integer; var promedio:real);
var
    i:byte;
begin
    i:=0; total:=0; promedio:=0;
    while i<=n do
    begin
        i:=i+1;
        if codigo=cod[i] then
        begin
            total:=tot[i];
            promedio:=prom[i];
        end; 
    end;
end;

var 
    cod:vcod;
    tot:vtot;
    prom:vprom;
    i,cantsup:byte;
    codmayor,codigo:string;
    x,promedio:real;
    total:integer;

begin
leer(cod,tot,prom);
for i:=1 to n do 
    writeln(i,': ', cod[i],' ',tot[i],' ',prom[i]:4:2);

codmayor:=mayorentrega(cod,tot);
writeln('el codigo que mas entrego fue: ',codmayor); 

write('ingrese valor x: ');
readln(x);
cantsup:=superaron(x,prom);
writeln('la cantidad de tambos que entregaron promedio mayor a ',x:4:2,' es: ', cantsup);

write('ingrese codigo a buscar: ');
readln(codigo);
codigo:=upcase(codigo);
buscar(cod,tot,prom,codigo,total,promedio);
if total<>0 then
    writeln(codigo, ' sumo ', total, ' y un promedio de ', promedio:4:2)
else writeln('no hay ninguno con ese codigo');



end.