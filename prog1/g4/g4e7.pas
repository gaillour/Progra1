program g4e7;
{Un estudio contable registró la facturación de varios comercios en los últimos N meses, por cada uno 
se tiene: 
  Nombre 
  Tipo (S/N) si es Responsable Inscripto o No, y luego por cada uno de los N meses: 
- Importe facturado mensual sin IVA 
Se desea saber: 
a)  Listar Nombre, tipo y cuánto pagó de IVA en los N meses. 
b)  El nombre del comercio Responsable Inscripto que menos facturó en total. 
 
Desarrollar la función Impuesto con los parámetros necesarios de modo tal que devuelva el monto de IVA 
que debe pagar. Sabiendo que si es Responsable Inscripto, corresponde el 21% de la compra, si no lo es, 
el 21%+10%}

function impuesto(tipo:char; imptot:real):real;

begin
tipo:=upcase(tipo);
if tipo='S' then
  impuesto:=imptot*(0.21)
else if tipo='N' then
  impuesto:=(imptot*(0.21))+(imptot*(0.1));
end;

var
    nombre:string;
    tipo:char;
    meses:integer;
    importe,imptot:real; 

begin
readln(nombre);
readln(tipo);
readln(meses);
readln(importe);//por mes
imptot:=importe*meses;

writeln('nombre: ', nombre);
if tipo='s' then
  writeln('responsable inscripto')
else writeln('no responsable inscripto');

writeln('IVA: ', impuesto(tipo,imptot):4:2);
  
end.