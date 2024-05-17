program g3e24;

{Ej 24) En un archivo se han grabado palabras, separadas por uno o más blancos en una
misma línea, finalizando con un punto. Cada palabra está conformada por letras y dígitos
(3ab4c3Hd). 
Se pide, a partir del archivo descripto generar otro cambiando las parejas
“LetraminusculaDigito” por las repeticiones de la Letra según indique el digito. 
 
Ejemplos:    ab4C3hd     1Ab2c3hD2.    -> abbbbC3hd   1AbbccchD2. 
        Ab0C3hd     1Ab2c0hD2.    -> AC3hd   1AbbhD2.}

var
    arch,archesc:Text;
    c1,c2,i:char;
begin
    assign(arch,'digitos.txt'); reset(arch);
    assign(archesc,'digitossalida.txt'); Rewrite(archesc);
    read(arch,c1);
    while c1<>'.' do
    begin
        read(arch,c2);
        if (c2 in ['0'..'9'] ) and (c1 in ['a'..'z'])then
        begin
            for i:='1' to c2 do
                write(archesc,c1);
            read(arch,c2);
        end
        else write(archesc,c1);
        c1:=c2;
    end;
    close(arch); close(archesc);
    reset(archesc);
    while not(eof(archesc)) do
    begin
        read(archesc,c1); 
        write(c1);
    end;
end.