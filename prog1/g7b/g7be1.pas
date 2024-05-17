program g7be1;

{ El departamento de Recursos Humanos de una empresa desea que sus empleados fraternicen y 
decidió cada 3 meses hacer un brindis por los que nacieron en esa estación del año. Se pide: 
 Leer los datos  (Nombre del empleado y Fecha de Nacimiento) 
 Informar en qué estación del año se festejan más cumpleaños}

const max=30;
type
    st10=string[10];
    TrF=record
        dia,mes,anio:word;
    end;
    TrP=record
        nombre:st10;
        fecha:TrF;
    end;
    tvp=array[1..max] of TrP;

procedure leer(var personas:tvp;var n:byte);
var
    
    arch:text;
begin
    assign(arch,'e1.txt'); reset(arch);
    n:=0;
    while not(eof(arch)) do
    begin
        n:=n+1;
        with personas[n] do
            readln(arch,nombre,fecha.dia,fecha.mes,fecha.anio);            
    end;
    close(arch);   
end;

function masCumples(personas:tvp;n:byte):string;
var
    i,ver,ot,inv,pri:byte;
    
begin
    ver:=0;ot:=0;inv:=0;pri:=0;
    for i:=1 to n do
    begin
        with personas[i].fecha do
        begin
            if mes in [1,2] then ver:=ver+1
            else if mes in [4,5] then ot:=ot+1
            else if mes in [7,8] then inv:=inv+1
            else if mes in [10,11] then pri:=pri+1
            else
            begin
                if mes=12 then
                begin
                    if dia in [1..20] then
                        pri:=pri+1
                    else ver:=ver+1;
                end
                else if mes=3 then
                begin
                    if dia in [1..20] then
                        ver:=ver+1
                    else ot:=ot+1;
                end
                else if mes=6 then
                begin
                    if dia in [1..20] then
                        ot:=ot+1
                    else inv:=inv+1
                end
                else if mes=9 then
                begin
                    if dia in [1..20] then
                        inv:=inv+1
                    else pri:=pri+1;
                end;
            end;
        end;
    end;
    if (inv>pri) and (inv>ver) and (inv>ot) then
        masCumples:='invierno'
    else if (ver>ot) and (ver>pri) and (ver>inv) then
        masCumples:='verano'
    else if (ot>inv) and (ot>pri) and (ot>ver) then
        masCumples:='otonio'
    else if (pri>ver) and (pri>ot) and (pri>inv) then
        masCumples:='primavera'
end;


var
    personas:tvp;
    n:byte;
begin
    leer(personas,n);
    writeln('la estacion con mas cumpleanios es: ',masCumples(personas,n));
end.