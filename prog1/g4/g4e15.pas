program g4e15;

{Desarrollar  un  procedimiento  y  los  tipos  necesarios  para  el  cálculo  de  una  serie  finita.
Los parámetros serán: 
   N = cantidad de términos a sumar, con N>0 
   RES = resultado 
   F = función para calcular cada uno de los términos de la serie 
El procedimiento calculará:  RES  =  F(1) + F(2) + F(3) +...+ F(n) 
 
y se pide utilizarlo para evaluar por medio de un menú 
      RES1 =  1 + 1/4 + 1/9 +...+1/ n2 
      RES2 =  1 + 1/2 + 1/4 +...+ 1/ 2 (n-1) 
      RES3 =  1 + 1/2! + 1/3! +...+ 1/ n! 
Resolver utilizando el tipo función. ¿Cómo cambiaría F por P de tipo procedimiento?}

function cuadrado(n:integer):integer;
begin
  cuadrado:=n*n;
end;

function por2(n:integer):integer;
begin
  por2:=2*n;
end;

function factorial(n:integer):integer;
begin
  if n=0 then factorial:=1
  else factorial:=n*factorial(n-1);
end;

procedure resultado(var n:integer;var f:char;var res:real);
var
    i:word;
begin
  res:=0;
  if f='1' then 
  begin
    for i:=1 to n do
      res:= res + (1/(cuadrado(i)));
  end
  else if f='2' then
    begin
      res:=1;
      for i:=1 to n-1 do
        res:=res + (1/(por2(i)));
    end
  else if f='3' then
    begin
      for i:=1 to n do
        res:=res+ (1/(factorial(i)));
    end; 
end;

var 
n:integer;
f:char;
res:real;

begin
write('1: cuadrado, 2:por 2, 3:factorial: ');
readln(f);
write('n: ');
readln(n);
resultado(n,f,res);

writeln('resultado: ', res:4:2);
  
end.