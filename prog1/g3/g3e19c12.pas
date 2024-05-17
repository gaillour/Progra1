program g3e19c12;

{Leer desde archivo un conjunto de números, con elementos negativos no consecutivos que 
delimitan subconjuntos. Obtener e informar el valor máximo de cada subconjunto 
(el máximo entre dos negativos).  
Ejemplo:   
2  3  4  -7  4  5  -5  7  5  3  9  8  7  -1  3  1  -2  ---> 5  9  3 
 
2  3  4  -7  4  5  -5  7  5  3  9  8  7  -1  3  1  ---> 5  9 }

var
    arch:text;
    max,n1,n2:byte;
    

begin
    assign(arch,'negativos.txt'); reset(arch);
    read(Arch,n1);
    while not eof(arch) do
    begin
        max:=0;
        if (n1<0) then
        begin
            repeat
                read(arch,n2);
                if n1>max then
                    max:=n1;
            until n2<0;
            writeln(max);
        end
        else read(arch,n2);
        n1:=n2;
    end;    
    
    
    close(arch);
end.