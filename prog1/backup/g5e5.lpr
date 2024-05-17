program g5e5;
{Dado un archivo de enteros, almacenarlos en un arreglo, luego obtener el promedio de todos los
números divisores del máximo y con ellos armar otro arreglo. Mostrar ambos arreglos y el promedio
obtenido.}
const
  top=100;
type
  vector= array[1..top] of integer;
var
  enteros: text;
  divs, nums: vector;
  n,i,j,k,l ,sum, max:integer;
  prom:real;
begin
  assign(enteros, 'g5e5.txt');
  reset(enteros);
  i:=1;
  j:=1;
  max:=-10000;
  while not eof(enteros) do
  begin
    read(enteros,n);
    nums[i]:=n;
    i:=i+1;
    if n > max then
       max:=n;
  end;
  for k:=1 to max do
      if max mod k = 0 then
         begin
         divs[j] := k;
         j:=j+1
         end;
  for l:=1 to j do
      begin
      sum:= sum + divs[i];
      prom:=sum/(j-1);
      end;
  for i:=1 to i-1 do
      writeln(nums[i]);
  writeln('divisores');
  for j:=1 to j-1 do
      writeln(divs[j]);
  writeln('promedio: ', prom:8:2);
  readln

end.

