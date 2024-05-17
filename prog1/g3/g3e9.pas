program g3e9;

{Dado un conjunto de números leídos desde un archivo, informar si están ordenados en forma 
ascendente}

var
    arch:text;
    num,aux:byte;
    asc:boolean;

begin
    Assign(arch,'ascendente.txt');reset(Arch);
    readln(arch,aux);
    asc:=true; 
    while (not eof(arch)) and (asc=true) do
    begin
        readln(arch, num);
        if num<aux then
            asc:=false;
        aux:=num;        
    end;
    writeln(asc);
end.