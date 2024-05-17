program c3clima;

{ En el archivo Clima.txt se ha grabado información climática, en cada línea: 
         Fecha (dd/mm/aaaa)     máxima      minina  
Se pide leer el archivo y grabar en otro archivo Amplitud.txt  las fechas que 
registren amplitud térmica mayor a 10}


var 
    arch,archD:text;
    fecha:string[10];
    max,min:integer;
begin   
    assign(arch,'clima.txt'); reset(arch);
    assign(archD,'amplitud.txt');Rewrite(archD);
    while not eof(arch) do 
    begin
        readln(arch,fecha,max,min);
        if (max-min)>10 then
            writeln(archD,fecha);
    end;
    close(arch);
   Reset(archd);
    while not eof(Archd) do
    begin
        readln(Archd,fecha);
        writeln(fecha);
    end;
end.