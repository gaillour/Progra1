program g5e2;
{Dado un archivo de enteros, se pide almacenar en un vector V sólo los elementos impares y en otro
vector W, los pares, ignorando si hubiese, los ceros.}
Type
  vector = array[1..100] of integer;
var
  v,w: vector;
  numeros:text;
  n, i,j: integer;

begin
  assign(numeros,'nomeros.txt');
  reset(numeros);
  i:=1;
  j:=1;
  while not eof(numeros) do
  begin
  readln(numeros, n);
  if n<>0 then
     begin
     if n mod 2 = 0 then
        begin
        v[i]:=n;
        i:=i+1;
        end
     else
         begin
         w[j]:=n;
         j:=j+1;
         end;
     end;
  end;

  writeln('pares');
  for i:=1 to i -1 do
      writeln(v[i], '');
  writeln('impares');
  for j:=1 to j -1 do
      writeln(w[j], '');

  readln
end.

