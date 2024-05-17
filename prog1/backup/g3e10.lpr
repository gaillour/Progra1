program g3e10;
var
  numeros:text;
  anterior, siguiente, frecuencia:integer;

begin
  assign(numeros,'numeros.txt');
  rewrite(numeros);
  writeln(numeros, '2 2 3 3 3 3 7 9 9 9');
  reset(numeros);
  read(numeros, anterior);
  frecuencia:=1;
  while not eof(numeros) do
  begin
    read(numeros, siguiente);
    if anterior = siguiente then
       begin
       frecuencia := frecuencia +1;
       end
    else
    begin
        writeln(anterior, ': ', frecuencia);
        frecuencia := 1;
    end;
    anterior:=siguiente;
  end;
  writeln(anterior, ': ', frecuencia);
  readln
end.

