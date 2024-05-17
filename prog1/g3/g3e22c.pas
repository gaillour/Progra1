program g3e22c;

{ A  partir  de  un  archivo  de  texto  que  contiene  palabras  separadas  entre 
sí  por  uno  o  más  blancos desarrollar un programa para:  
c)  Contar cuántas son palíndromas (capicúas)


    ir leyendo de a dos caracteres(c1,c2) 
    cuando c1 es blanco y c2 es letra
    guardarla en un aux (c2=aux)
    ir leyendo de a dos caracteres
    cuando el ultimo sea espacio comparar aux con c1(caracter antes del blanco)
}

{incompleto}
var     
    arch:text;
    c1,c2,aux:char;
    cc:byte;

begin
    assign(arch,'palabras.txt'); reset(arch);
    read(arch,c1);
    cc:=0;
    aux:=c1;
    while not eof(arch) do
    begin
        read(arch,c2);
        if (c1<>' ') and (c2=' ') then
        begin
            if c1=aux then
                cc:=cc+1;
        end
        else if (c1=' ') and (c2<>' ') then aux:=c2;
        c1:=c2;
    end;
    close(arch);
    writeln(cc);
end.