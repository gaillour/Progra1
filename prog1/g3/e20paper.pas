program e20paper;

var
    sumabulto,capacidad,pesosincargar,porccargado,bulto:real;
    arch:Text;
    i,c90,n:byte;
    pudocargar:boolean;


begin
    assign(arch,'bultos.txt'); reset(arch);
    readln(arch,n);
    pesosincargar:=0; c90:=0;
    for i:=1 to n do
    begin
        Read(arch,capacidad);
        capacidad:=capacidad*1000;
        sumabulto:=0;pudocargar:=true;
        repeat
            read(Arch,bulto);
            sumabulto:=sumabulto+bulto;
        until bulto=0;
            if sumabulto>=capacidad then
            begin
                pesosincargar:=pesosincargar+sumabulto-capacidad;
                pudocargar:=false;
            end;
        porccargado:=sumabulto/capacidad;
        if porccargado>=0.9 then c90:=c90+1;
        if pudocargar then writeln('el camion ',i,' pudo cargar todo');
    end;
    close(arch);
    writeln('a)',c90);
    writeln('b)',pesosincargar:4:2);
end.