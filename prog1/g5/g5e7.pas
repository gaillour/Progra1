program g5e7;

{Realizar la suma de dos números positivos muy grandes (de 10 cifras, por ejemplo). Implementar el 
programa principal que lea ambos números, invoque el subprograma que resuelve la suma y muestre el 
resultado.}

type
    vec=array[1..12] of byte;

procedure suma(var num1,num2: integer;var n1,n2,s:vec);
var
    i:byte;
begin
 
end;

var
    num1,num2:integer;
begin
write('num1: ');
readln(num1);
write('num2: ');
readln(num2);

end.