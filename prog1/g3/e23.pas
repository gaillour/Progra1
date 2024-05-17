program e23;

{ En un archivo se han grabado palabras finalizando con un punto, cada palabra está 
conformada por letras y dígitos (3ab4c3Hd). 
Se pide a partir del archivo descripto generar otro cambiando las parejas 
“DigitoLetraminuscula” por las repeticiones de la Letra según indique el digito. 
Ejemplos:   3ab4C3hd   ab4c2hd.   -> aaab4Chhhd    abcccchhd. 
         0ab4C3hd   ab4c0hd.   ->   b4Chhhd    abccccd}

var 
    arch,salida:Text;
    i,c1,c2:char;
    

begin
    assign(arch,'digitoletraminuscula.txt'); reset(arch);
    assign(salida,'salida.txt'); rewrite(salida);

    read(arch,c1);
    while c1<>'.' do
    begin
        read(Arch,c2);
        if (c1 in ['0'..'9'] ) and (c2<>upcase(c2)) then
        begin
            for i:='1' to c1 do
                write(salida,c2);
            read(arch,c2);
        end
        else write(salida,c1);
        c1:=c2;
    end;
    
    close(salida); 
    close(arch);

end.