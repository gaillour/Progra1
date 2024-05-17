program g3e1;
var
  n,puesto,max, apariciones,puestomax, num:integer;

begin
  writeln('ingrese un numero (0 para terminar) ');
  readln(num);
  max:=num;
  puesto := 1;
  while num<>0 do
  begin
  if num>max then
     max:=num;
     puestomax:= puesto;
  if num=max then
     apariciones := apariciones +1;
  writeln('ingrese un numero(0 para terminar) ');
  readln(num);
  puesto:= puesto +1;
  end;
  if num= 0 then
     writeln('el maximo es: ',max, ' ultimo puesto en el q aparecio: ',puestomax,' cantidad de veces que aparecio: ', apariciones);
  readln
end.

