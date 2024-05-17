program g3e20;

{Leer desde un archivo números enteros, calcular y escribir el promedio de los elementos
positivos y  distintos de cero que se encuentran entre dos negativos no consecutivos. 
Ejemplos: 
-7  6  -1  0  2  4  -8  -7  3  1  -24  6  7  0  9   debe escribir : 6  3  2 
 
 7  6  -1  0  2  4  -8  -7  3  1  -24  6  7  0  9  -8   debe escribir : 3  2  7.33 }


var
    arch:text;
    sum,cant,num,aux:integer;
    prom:real;

begin
    Assign(arch,'promedios.txt'); reset(Arch);
    read(arch,aux);
    while not eof(arch) do
    begin
        if (aux<0) then
        begin
            cant:=0;
            sum:=0;
            repeat
                read(arch,num);
                if num>0 then
                begin
                    sum:=sum+num;
                    cant:=cant+1;
                end
            until ((num<0) or (Eof(arch))) and (cant>0); {tiene q haber un numero entre dos negativos}
            if num<0 then
            begin
                prom:=sum/cant;
                writeln(prom:4:2);
                aux:=num
            end;
        end
        else read(arch,aux);      
    end;


end.