program g5be12;
{En  un  archivo  de  texto  se  ha  grabado  por  cada  línea,  una  cadena y  que  siempre
termina  en  letra luego uno o más blancos y tres números separados por blancos,
por último uno o más blancos y una letra. 
Ejemplo: mU&1#hT34*A    80   40   30     P 
Se pide, a partir del archivo, cargar tres arreglos paralelos: 
• VClave contendrá las claves sin los caracteres especiales, las claves que tengan más de tres
invalidan la información de la línea
• VProm almacena el promedio de los tres números. 
• VCar almacena el caracter que está al final de la línea, siempre que no coincida 
con la última letra de la clave, en cuyo caso invalida la información de la línea, 
que no se almacena) 
Mostrar los arreglos generados, y luego para una letra y una clave que se ingresan por teclado: 
a)  Para la letra ingresada, calcular e informar la clave de máximo promedio. 
b)  Para la clave ingresada, informar el promedio y la letra asociada (puede no existir)}

const
    max=30;

type
    tvs=array[1..max] of string;
    tvr=array[1..max] of real;
    tvc=array[1..max] of char;



procedure validarclave(var clave:string;car:char;var valida:boolean);
var
    i,cesp:byte;
    aux:string;
begin   
    valida:=true;
    i:=0; aux:='';cesp:=0;
    while (i<Length(clave)) and (cesp<=3) do
    begin
        i:=i+1;
        if (clave[i] in ['a'..'z']) or (clave[i] in ['A'..'Z']) or (clave[i] in ['0'..'9']) then
            aux:=aux+clave[i]
        else cesp:=cesp+1;
        if i=length(clave) then
        begin
            if clave[i]=car then 
            begin
                valida:=false;
            end;
        end;
    end;
    if cesp>3 then valida:=False
    else clave:=aux;
end;


procedure leer(var vclave:tvs;var vprom:tvr; var vcar:tvc;var n:byte);
var
    clave:string;
    num,suma:integer;
    car:char;
    arch:text;
    valida:boolean;
    i:byte;
begin
    assign(arch,'e12.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        clave:='';suma:=0;
        read(Arch,car);
        while car<>' ' do
        begin
            clave:=clave+car;
            read(arch,car);
        end;
        for i:=1 to 3 do
        begin
            read(arch,num);
            suma:=suma+num;  
        end;
        repeat
            read(arch,car);
        until car<>' ';
        validarclave(clave,car,valida);
        if valida then
        begin
            n:=n+1;
            vclave[n]:=clave;
            vprom[n]:=suma/3;
            vcar[n]:=car;       
        end;
        readln(arch);
    end;
    close(arch);    
end;

//a)
function maxprom(vclave:tvs;vprom:tvr;vcar:tvc;n:byte;letra:char):string;
var
    i,imax:byte;
    max:real;
begin
    max:=0;
    for i:=1 to n do
    begin
        if vcar[i]=letra then
        begin
            if vprom[i]>max then
            begin
                max:=vprom[i];
                imax:=i;
            end;
        end;
    end;
    if max=0 then maxprom:=''
    else    maxprom:=vclave[imax];
end;

//b)
procedure informarclave(vclave:tvs;vprom:tvr;vcar:tvc;n:byte;clave:string);
var
    i:byte;
begin
    i:=1;
    while (i<n) and (vclave[i]<>clave) do
        i:=i+1; 
    if vclave[i]=clave then write('el promedio de ',vclave[i],' es: ',vprom[i]:4:2,', y la letra es: ',vcar[i])
    else writeln('no esta esa clave');
    
end;

procedure mostrar(vclave:tvs;vprom:tvr;vcar:tvc;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
    begin
        writeln(vclave[i],' ',vprom[i]:4:2,' ',vcar[i]);
    end;
end;

procedure leeruser(var clave:string;var letra:char);
begin
    write('ingrese clave: ');
    readln(clave);
    write('ingrese letra: ');
    readln(letra);
end;


var
    vclave:tvs;
    vprom:tvr; 
    vcar:tvc;
    n:byte;
    clave:string;
    letra:char;
    maxp:string;

begin
    leer(vclave,vprom,vcar,n);
    mostrar(vclave,vprom,vcar,n);
    leeruser(clave,letra);
    maxp:=maxprom(vclave,vprom,vcar,n,letra);
    if maxp<>'' then  writeln('el maximo promedio con letra ',letra,' es: ',maxp)
    else writeln('no esta esa letra');
    informarclave(vclave,vprom,vcar,n,clave);
end.