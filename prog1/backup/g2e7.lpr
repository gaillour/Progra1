program g2e7;
var
     genero, talle: char;
     cantidad,total:integer;
begin
  total:=0;
  write('genero (H/M): ');
  readln(genero);
  write('talle (S,M,X,L): ');
  readln(talle);
  writeln('cantidad: ');
  readln(cantidad);
  if cantidad >12 then
     total := total*0.07;
  total:= total*0.21;
end.
{Un negocio vende camisas, éstas pueden ser de hombre o de mujer. Los talles que fabrican son: S,
M, L y X. El precio base unitario es de $1000 para hombres y $1200 para mujer, se debe agregar el
IVA del 21%. Hay una promoción en los talles S de hombre y X de mujer con un 5% de descuento.
Además, sila compra supera la docena se considera venta mayorista y obtiene un descuento extra del
7% del total. Determinar cuáles son los datos necesarios para calcular el importe a facturar
en una venta.}

