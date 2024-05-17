program e20;

{ N camiones tiene asignados una cantidad no conocida de bultos para ser cargados (no 
necesariamente podrán ser cargados en su totalidad). Cada camión tiene una capacidad en Tns. 
y cada bulto un peso en kgs. Los datos descriptos están organizados de la siguiente forma para 
cada uno de los N camiones: 
  Capacidad del camión 
  y a continuación el peso de cada bulto en kgs. (0 es fin de bulto para dicho camión) 
Se pide ingresar dichos datos, calcular e informar: 
a.  Para cada camión si pudo cargar todos los bultos. 
b.  Peso total de los bultos que quedaron sin poder cargarse (en todos los camiones) 
c.  Cuantos camiones completaron su capacidad en un 90 % o más (sin importar si quedaron 
o no bultos sin cargar)} 

var
    arch:Text;
    n,i,c90:byte;
    bulto,bultototal,totalsincargar:integer;
    cargotodo:boolean;
    capacidad:real;

begin
    assign(arch,'bultos.txt'); reset(arch);
    readln(Arch,n); c90:=0; totalsincargar:=0;
    for i:=1 to n do
    begin   
        cargotodo:=true;
        bultototal:=0;
        read(arch,capacidad); capacidad:=capacidad*1000;
        read(arch,bulto);
        while bulto<>0 do
        begin
            bultototal:=bultototal+bulto;
            if bultototal>capacidad then
            begin
                totalsincargar:=totalsincargar+bulto;
                cargotodo:=false;
            end;
            read(arch,bulto);            
        end;
        {readln(arch);}
        if cargotodo then writeln('el camion ',i,' cargo todos los bultos');
        if (bultototal/capacidad)>=0.9 then
            c90:=c90+1;
    end;
    close(arch);

    writeln('b) ', totalsincargar);
    writeln('c) ', c90);

end.