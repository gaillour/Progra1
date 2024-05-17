program e22;


{A partir de un archivo de entrada que contiene secuencias de caracteres que forman 
palabras, separadas por uno o más blancos, escribir en un archivo de salida las palabras
que  tienen longitud creciente. 
Ejemplo:  La  casa blanca de la colina fue derribada ayer.  ->  La casa blanca derribada 
 
La  cantidad  de  caracteres  de  cada  palabra  debe  ser  comparada  con  la  longitud
de  la  última palabra grabado, si es mayor se graba.}

var
    arch,salida:text;
    i,ultpal:byte;
    c:char;
    pal:String;

begin
    assign(arch,'fraselarga.txt'); reset(arch);
    assign(salida,'acortada.txt'); Rewrite(salida);

    pal:='';ultpal:=0;
    read(Arch,c);
    while c<>'.' do
    begin   
        if c<>' ' then
        begin
            i:=0;
            while (c<>' ') and (c<>'.') do
            begin
                i:=i+1;
                pal:=pal+c;
                read(arch,c);
            end;
            if i>ultpal then
            begin
                write(salida,pal,' ');
                ultpal:=i;
            end            
        end
        else read(Arch,c);
        pal:='';
    end;
    close(salida);    
    close(arch);
end.