program e22paper;

var
    i,ultpal:byte;
    pal:string;
    c1,c2:char;
    salida,arch:Text;

begin
    assign(arch,'fraselarga.txt'); reset(arch);
    assign(salida,'e22.txt'); rewrite(salida);
    i:=0;ultpal:=0;pal:='';
    read(Arch,c1);
    while c1<>'.' do
    begin
        read(arch,c2);
        if c1<>' ' then
        begin
            i:=i+1;
            pal:=pal+c1;
            if (c2=' ') or (c2='.') then
            begin
                if i>ultpal then
                begin
                    ultpal:=i;
                    write(salida,pal,' ');
                end;
                i:=0;pal:='';
            end;
        end;
        c1:=c2;
    end;

    close(salida);
    close(arch);

end.