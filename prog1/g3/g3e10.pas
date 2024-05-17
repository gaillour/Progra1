program g3e10;

{Leer desde un archivo números enteros ordenados de menor a mayor, puede haber elementos 
repetidos.  
Calcular y mostrar cada número con su respectiva frecuencia. 
Ejemplo:  2, 2, 3, 3, 3, 3, 7, 9, 9, 9}

var
    num,aux,frec:byte;
    arch:text;

begin
    assign(arch,'frecuencia.txt'); reset(arch);
    readln(arch,aux); frec:=1;
    while not eof(arch) do
    begin
        readln(arch,num);
        if aux=num then
            frec:=frec+1
        else 
        begin
            writeln('numero: ', aux,' frecuencia: ', frec);
            frec:=1;
        end;
        aux:=num
    end;
    writeln('numero: ', aux,' frecuencia: ', frec);
end.