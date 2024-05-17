program g5e13;

{En una estación de peaje hay N cabinas por donde pasan varios vehículos. Desde un archivo se lee 
la siguiente información: 
•  Número de cabina 
• Tipo de vehículo (1=auto, 2=moto, 3=camioneta, 4=camión, 5=colectivo) 
• Hora (0..23) 
Las tarifas son: moto = $150, auto y camioneta = $300, camión = $470, colectivo = $390. 
Si la hora está entre las 10 y las 18 sufre un incremento del 10%. 
Calcular e informar: 
a)  Cuántos vehículos atendió cada una de las N cabinas.  
b)  Cuál fue la que más importe recaudó.}

const   
    n=5;

type
    vec=array[1..7] of word;
    vcab=array[1..n] of byte;
    vimp=array[1..n] of real;

procedure leer(var arch:text; var cabinas,tipos,horas:vec);
var 
    i,cabina,tipo,hora:byte;

begin
    Assign(arch,'cabinas.txt');
    reset(arch);
    i:=0;
    while not eof(arch) do
    begin
        read(arch,cabina,tipo,hora);
        i:=i+1;
        cabinas[i]:=cabina;
        tipos[i]:=tipo;
        horas[i]:=hora;
    end;

end;

procedure cantidad(var cabinas:vec;var cant:vcab);
var
    i,cab:byte;
begin
    for i:=1 to Length(cabinas) do
    begin
        cant[cabinas[i]]:=cant[cabinas[i]]+1;
    end;
end;

//cambia tipo de vehiculo por precio
procedure precio(var tipos:vec);
var 
    i:byte;
begin
    for i:=1 to Length(tipos) do
    begin
        case tipos[i] of
        1:tipos[i]:=150;
        2:tipos[i]:=300;
        3:tipos[i]:=300;
        4:tipos[i]:=470;
        5:tipos[i]:=390;
        end;
    end;
end;

//guarda importes en arreglo imp
procedure importes(var cabinas,tipos,horas:vec;var cant:vcab;var imp:vimp);
var 
    i:byte;
begin
    for i:=1 to Length(cabinas) do
    begin
        if horas[i] in [10..18] then
            imp[cabinas[i]]:= imp[cabinas[i]]+(tipos[i]*1.1)
        else imp[cabinas[i]]:=imp[cabinas[i]]+ tipos[i];
    end;
end;

 
function mayorimp(imp:vimp):byte;
var
    i:byte;
    max:real;
begin
    max:=imp[1];
    for i:=1 to n do 
    begin
        if imp[i]>max then
        begin
            max:=imp[i];
            mayorimp:=i;
        end;
    end;
end;

var
    cabinas,tipos,horas:vec;
    cant:vcab;
    i,j,k:byte;
    arch:text;
    imp:vimp;

begin
    leer(arch,cabinas,tipos,horas);
    precio(tipos);

    for i:=1 to Length(cabinas) do
      writeln(cabinas[i],' ', tipos[i],' ',horas[i]);
    cantidad(cabinas,cant);

    for j:=1 to n do
        writeln('en la cabina ',j,' se atendieron ',cant[j]);
    importes(cabinas,tipos,horas,cant,imp);

    for k:=1 to n do
        writeln('la cabina ',k,' gano $',imp[k]:4:2);
    writeln('la cabina que mas recaudo fue ', mayorimp(imp));
end.