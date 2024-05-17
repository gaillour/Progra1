program g3e3;
var
   n, num,anterior, i, veces:integer;

begin
  writeln('ingrese cantidad de numeros');
  readln(n);
  anterior:=-99999;
  for i:=1 to n do
      begin
        writeln('ingrese un numero');
        readln(num);
        if num> anterior then
           veces :=veces +1;
        anterior:=num
      end;
  writeln('el numero supero al anterior: ', veces -1, ' veces');
  readln
end.

