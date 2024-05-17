program g5e3;
{ Dado un arreglo V y un número K, cambiar todas las ocurrencias de K por 0.}
type
  vector = array[1..100] of integer;
var
  v: vector;
  k,i,n,j:integer;
  numeros: text;
begin
  assign(numeros, 'numeros.txt');
  reset(numeros);
  i:=1;
  writeln('numero a cambiar por cero: ');
  readln(k);
  while not eof(numeros) do
  begin
  readln(numeros, n);
       if n = k then
          v[i]:=0
       else
         v[i]:= n;
       i:=i+1
  end;
  for j:=1 to 10 do
      writeln(v[j]);
  readln
end.

