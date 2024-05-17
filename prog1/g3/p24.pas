program p24;

type    
    st10=string[10];

var
    d1,d2,i,n,cont6,tot:byte;
    arch:text;
    nombre:st10;
    porc6:real;
    saco6:boolean;
    suma,x:integer;
    resta:integer;


begin
    readln(x);
    assign(arch,'juego.txt'); reset(arch);
    readln(Arch,n);
    readln(arch,nombre);   tot:=0;  cont6:=0;
    while nombre<>'XXX       ' do
    begin
        suma:=0;saco6:=false;
        for i:=1 to n do
        begin
            readln(Arch,d1,d2);
            suma:=suma+d1+d2;
            if d1=d2 then suma:=suma*3;
            resta:=d2-d1;
            if (resta=1) or (resta=-1) then suma:=suma*2;
            if (d1=6) or (d2=6) then saco6:=true;
        end;
        if (suma<x) and (saco6) then cont6:=cont6+1;
        writeln(nombre,' saco: ', suma,' puntos');
        read(arch,nombre);
    end;
    porc6:=(cont6/tot)*100;
    writeln(porc6:4:2);    
    
    close(arch);
end.