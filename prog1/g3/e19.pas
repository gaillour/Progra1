program e19;

{Se tiene un conjunto de números primos y por cada uno de ellos N números no primos, 
este agrupamiento se mantiene hasta que ingresa un cero. O sea se repite el siguiente esquema: 
  P (número primo ó  0 que indica fin de datos) 
  N (cantidad entera) 
  y a continuación N números no primos. 
Se pide ingresar dichos datos, calcular e informar: 
a.  Para cada primo porcentaje de múltiplos entre los N no primos. 
b.  Número primo con mayor porcentaje de múltiplos. 
c.  Cantidad de primos sin múltiplos.}

var
    arch:text;
    primo,n,i,cm,num,primomax,csinm:byte;
    porcentaje,maxp:real;
begin
    assign(arch,'primos.txt'); reset(arch);
    maxp:=0; csinm:=0;
    read(arch,primo);
    repeat
        cm:=0;
        read(arch,n);
        for i:=1 to n do
        begin
            read(arch, num);
            if num mod primo = 0 then
                cm:=cm+1;
        end;
        if cm=0 then csinm:=csinm+1;
        readln(arch);
        porcentaje:=(cm/n)*100;
        writeln(primo,': ',porcentaje:4:2,'%');
        if porcentaje>maxp then
        begin
            maxp:=porcentaje;
            primomax:=primo;
        end;
        read(arch,primo);
    until (primo=0) or (eof(arch));
    writeln('el primo con mayor porcentaje de multiplos fue: ', primomax);
    writeln('la cantidad de primos sin multiplos es: ', csinm);
    close(arch);
    
end.