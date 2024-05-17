program g4e9;
{Ej 9) Dado un archivo que contiene en cada línea 4 números (N1, D1, N2, D2) numerador y denominador
de dos fracciones. Se pide leer los pares de fracciones y por cada uno de ellos informe:
a) La suma como fracción.
b) El producto como fracción. }
procedure fracciones(n1,d1,n2,d2:integer; var suma: real;var producto : string);
var
  s1,s2:string;
begin
  str(n1*n2,s1);  str(n,s)
  str(d1*d2,s2);
  suma:= (n1/d1)+(n2/d2);
  producto:= s1+'/'+s2;
end;

var
  archivo:text;
  n1,d1,n2,d2 : integer;
  s: real;
  p:string;

begin
  assign(archivo, 'C:\Users\Usuario\Desktop\facu\prog1\franjere.txt');
  reset(archivo);
  while not eof(archivo) do
        begin
        read(archivo,n1,d1,n2,d2);
        fracciones(n1,d1,n2,d2,s,p);
        writeln('suma: ',s:8:2, 'producto: ', p);
        end;
  readln
end.

