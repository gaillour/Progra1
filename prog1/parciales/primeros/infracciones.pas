program infracciones;

type
    st3=string[3];
    st7=string[7];
    ts3=array[1..20] of st3;
    ts7=array[1..20] of st7;
    tbyte=array[1..20] of byte;
    tint=array[1..20] of byte;
    treal=array[1..20] of real;


function esinfraccion(tipo:byte;km:integer):boolean;
begin
    if ((tipo=1) and (km>100)) or ((tipo=3) and (km>90)) or  ((tipo=2) and (km>110)) then
        esinfraccion:=true
    else esinfraccion:=false;
end;


procedure leerzonas(var zonas:ts3;var factor:treal);
var
    i:byte;
    arch:text;
begin
    Assign(arch,'zonas.txt'); reset(arch);
    i:=0;
    while not eof(arch) do
    begin
        i:=i+1;
        readln(arch, zonas[i], factor[i]);

    end;
end;


function costo(tipo:byte;zona:st3;zonas:ts3; factor:treal):real;
var 
    i:byte;
begin
    i:=0;
    while zonas[i]<>zona do  //se sabe q el elemento esta
        i:=i+1;
    case tipo of
    1:costo:=1000*factor[i];
    2:costo:=2000*factor[i];
    3:costo:=5000*factor[i];
    end;
end;

procedure leer(var vtipo:tbyte; var vkm:tint; var vzona,zonas:ts3; var vpatente:ts7;var vcosto,factor:treal;var noinfraccion,n:byte);
var
    arch:text;
    i,tipo:byte;
    km: integer;
    zona:st3;
    patente:st7;
    blanco,blanco2:char;
begin
    assign(arch, 'radar.txt'); reset(arch);
    n:=0; noinfraccion:=0;
    while not eof(arch) do 
    begin
        readln(arch, tipo, km, blanco,zona,blanco2,patente);
        if esinfraccion(tipo,km) then
        begin
            n:=n+1;
            vtipo[n]:=tipo;
            vkm[n]:=km;
            vzona[n]:=zona;
            vpatente[n]:=patente;
            vcosto[n]:=costo(tipo,zona,zonas,factor);
        end
        else noinfraccion:=noinfraccion+1;
        
    end;
end;




{c) Cantidad de infracciones de una zona ingresada por teclado (puede no existir)}

function cantinf(userzona:st3;vzona:ts3;n:byte):byte;
var 
    i:byte;

begin
    i:=0;
    cantinf:=0;
    for i:=1 to n do 
    begin
        if vzona[i]=userzona then
            cantinf:=cantinf+1;
    end;
end;

{b) Patente de la multa de valor máximo cometida en cada zona 
(si se repite la multa máxima, tomar la primera)}
procedure maxporzona(var zonas,vzona:ts3;var vcosto:treal;var vpatente,maximos:ts7;var n:byte);
var 
    i,j:byte;
    max:real;
begin
    for i:=1 to 5 do   //cant zonas
    begin
        max:=0;j:=0;
        while (j<=n) do;
        begin
            j:=j+1;
            if (vzona[j]=zonas[i]) and (vcosto[j]>max) then
                begin
                    max:=vcosto[j];
                    maximos[i]:=vpatente[j];   
                end;
        end;      
    end;
  
end;

var 
    vtipo:tbyte;
    vkm:tint;
    vzona,zonas:ts3;
    vpatente,maximos:ts7;
    factor,vcosto:treal;
    n,noinfraccion,i,incisoc:byte;
    userzona:st3;

begin

leerzonas(zonas,factor);
leer(vtipo,vkm,vzona,zonas,vpatente,vcosto,factor,noinfraccion,n);

for i:=1 to n do
    writeln(i,': ', vtipo[i],' ', vkm[i], ' ', vzona[i],' ',vpatente[i],' ',vcosto[i]:4:2);

//a)
writeln(noinfraccion,' lecturas no corresponden a infraccion');

//b) no anda
//maxporzona(zonas,vzona,vcosto,vpatente,maximos,n);



//c)
write('ingrese zona a buscar: ');
readln(userzona);
userzona:=upcase(userzona);
incisoc:=cantinf(userzona,vzona,n);
if incisoc<>0 then
    write('hubieron ', incisoc,' infracciones en la zona ', userzona)
else writeln('no hubieron infracciones en la zona ', userzona);
  
end.