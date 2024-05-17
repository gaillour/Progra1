{Ej 24) En un archivo se han grabado palabras, separadas por uno o más blancos en una
misma línea, finalizando con un punto. Cada palabra está conformada por letras y dígitos
(3ab4c3Hd). 
Se pide, a partir del archivo descripto generar otro cambiando las parejas
“LetraminusculaDigito” por las repeticiones de la Letra según indique el digito. 
 
Ejemplos:    ab4C3hd     1Ab2c3hD2.    -> abbbbC3hd   1AbbccchD2. 
        Ab0C3hd     1Ab2c0hD2.    -> AC3hd   1AbbhD2.}
program g3franp23;
var
car1,car2,i:char;
arch:text;


begin
assign(arch,'digitos.txt'); reset(arch);
while not eof(arch) do
  begin
      read(arch,car1);
        while car1<>'.' do
            begin
            read(arch,car2);
            if (car1 in ['a'..'z']) and (car2 in ['1'..'9']) then
            begin
                for i:='1' to car2 do
                
                    write(car1);
                  read(arch,car2);
            end
            else
                    write(car1);
                    car1:=car2;
            
              
         
        end;
        readln(arch);
        
    end;
close(arch);
end.