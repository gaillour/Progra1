program ej15;

{Determinar cuántas veces se encuentra la sílaba ‘ma’ en la secuencia}

var
    arch:text;
    c1,c2:char;
    cont:byte;

begin
    assign(arch,'secuencia.txt'); reset(arch);
    cont:=0;
    read(Arch,c1);
    while not eof(arch) do
    begin
        read(arch,c2);
        if (c1='m') and (c2='a') then
            cont:=cont+1;
        c1:=c2;
    end;
    close(arch);
    writeln('la silaba "ma" aparece ', cont, ' veces en la secuencia');
    
end.