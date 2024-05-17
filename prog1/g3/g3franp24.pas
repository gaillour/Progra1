{Ej 24) En un archivo se han grabado palabras, separadas por uno o más blancos en una
misma línea, finalizando con un punto. Cada palabra está conformada por letras y dígitos
(3ab4c3Hd). 
Se pide, a partir del archivo descripto generar otro cambiando las parejas
“LetraminusculaDigito” por las repeticiones de la Letra según indique el digito. 
 
Ejemplos:    ab4C3hd     1Ab2c3hD2.    -> abbbbC3hd   1AbbccchD2. 
        Ab0C3hd     1Ab2c0hD2.    -> AC3hd   1AbbhD2.}
program g3franp24;
var
arch1,arch2:text;
car1,car2,i:char;


begin
assign(arch1,'digitos.txt'); reset(arch1);
assign(arch2,'salidadigitos.txt');rewrite(arch2);

read(arch1,car1);
while car1<>'.' do
  begin
      read(arch1,car2);
      if (car1 in ['a'..'z']) and (car2 in['0'..'9']) then
      begin
        for i:='1' to car2 do
            write(arch2,car1);
        read(arch1,car2);
      end
    else
        write(arch2,car1);
     car1:=car2;
  end;
close(arch1);
close(arch2);



end.