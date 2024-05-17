program g5e12;

{En  un  archivo  de  texto  se  ha  grabado  por  cada  línea,  una  cadena  (es  una  clave  encriptada  que 
puede  contener  letras,  números  y  caracteres  especiales  (&,  $,  #,  etc.),  y  que  siempre  termina  en  letra), 
luego uno o más blancos y tres números separados por blancos, por último uno o más blancos y una letra.  
Ejemplo: mU&1#hT34*A    80   40   30     P 
Se pide, a partir del archivo, cargar tres arreglos paralelos: 
• VClave contendrá las claves sin los caracteres especiales, que registren en su encriptación hasta  
tres caracteres especiales (las claves que tengan más de tres invalidan la información de la línea, 
que no se almacena) 
• VProm almacena el promedio de los tres números. 
• VCar almacena el caracter que está al final de la línea, siempre que no coincida con la última letra 
de la clave, en cuyo caso invalida la información de la línea, que no se almacena) 
Mostrar los arreglos generados, y luego para una letra y una clave que se ingresan por teclado: 
a)  Para la letra ingresada, calcular e informar la clave de máximo promedio. 
b)  Para la clave ingresada, informar el promedio y la letra asociada (puede no existir)}

const 
    n=4;
type 
    vclave=array[1..n] of string;
    vprom=array[1..n] of real;
    vcar=array[1..n] of char;

procedure leerclaves(var arch:text; var claves:vclave; var proms:vprom; var cars:vcar);
var
    car:char;
    cesp,ic,i:byte;
    clave:string;
    n1,n2,n3:integer;
    prom:real;
begin
    assign(arch,'encriptado.txt');
    reset(arch);
    i:=0; 
    while not eof(arch) do
    begin
        read(arch,car);
        cesp:=0; ic:=0; clave:='';
        prom:=0; 
        while car<>' ' do
        begin
            if (car in ['a'..'z']) or (car in ['A'..'Z']) or  (car in ['0'..'9']) then
                clave:=clave+car
            else
            begin
                cesp:=cesp+1;
            end;
            read(arch, car);
        end;
        read(arch,n1,n2,n3);
        repeat
            read(arch,car);
        until car<>' ';
        if  (car <> clave[length(clave)]) and (cesp<=4) then
        begin
            i:=i+1;
            claves[i]:=clave;
            prom:=(n1+n2+n3)/3;
            proms[i]:=prom;
            cars[i]:=car;
        end;
    end;
end;

{a)  Para la letra ingresada, calcular e informar la clave de máximo promedio.}
function maxpromedio(l:char; cars:vcar; proms:vprom; claves:vclave):string;
var
    maxprom:real;
    i,ic:byte;
begin
    maxprom:=0; ic:=0;
    for i:=1 to n do
    begin
        if (cars[i]=l) and (proms[i]>maxprom) then
        begin
            maxprom:=proms[i];
            ic:=i;
        end;
    end;
    maxpromedio:=claves[ic];
end;


{b)}


var
    arch:text;
    claves:vclave;
    proms:vprom;
    cars:vcar;
    i,j:byte;
    l:char;

begin
leerclaves(arch,claves,proms,cars);

for i:=1 to n do
    writeln(i,': ',claves[i],' ',proms[i]:4:2,' ',cars[i],' ');

writeln;

write('ingrese caracter: ');
readln(l);
l:=upcase(l);
writeln('la clave de mayor promedio con la letra ',l,' asociada es: ',maxpromedio(l,cars,proms,claves));
          
end.