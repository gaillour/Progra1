program e16;

{Si se requiere contar palabras en una secuencia, consideremos que una palabra es una 
serie de caracteres distintos de blanco antecedida por uno o más blancos (salvo la primera). 
   xxxxx       xxxxxx        xxx      x       xx. 
Tomando la idea del algoritmo anterior para contar parejas, la pareja formada por   
            Car1 = blanco y Car2 <> blanco indica el comienzo de una palabra}

var
    arch:text;
    c1,c2:char;
    cp:byte;

begin
    assign(arch,'x.txt'); reset(arch);
    cp:=0;
    read(arch,c1);
    if c1<>' ' then
        cp:=cp+1;
    while c1<>'.' do
    begin
        read(arch,c2);
        if (c1=' ') and (c2<>' ') then
            cp:=cp+1;
        c1:=c2;
    end;
    close(arch);
    writeln('hay ', cp,' palabras');
end.