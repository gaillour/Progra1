program g3e19;

{ Leer desde archivo un conjunto de números, con elementos negativos no consecutivos que 
delimitan subconjuntos. Obtener e informar el valor máximo de cada subconjunto 
(el máximo entre dos negativos).}

var
    arch:text;
    num,max,aux:integer;
begin
    Assign(arch,'negativos.txt'); reset(Arch);
    read(arch, aux);
    while not eof(Arch) do
    begin
        if aux<0 then
        begin
            max:=0;
            repeat
                read(arch,num);
                if num>max then
                    max:=num;
            until (num<0) or eof(Arch);
            if num<0 then 
            begin
                writeln(max);
                aux:=num;
            end;
        end
        else read(arch,aux);
    end;    
end.