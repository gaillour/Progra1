program g2e4;

{ Dadas dos fechas (dia, mes y año) indicar cuál es la más antigua 
y a qué trimestre pertenece.}

var
    d1,d2,m1,m2,a1,a2:integer;

begin
    d1:=24; m1:=4; a1:=2004;
    d2:=26; m2:=3; a2:=2004;

    if a1<a2 then
        writeln(' fecha 1 es la mas antigua')
    else if a1=a2 then
        begin
            if m1<m2 then 
                writeln(' fecha 1 es la mas antigua')
            else if m1=m2 then
            begin
                if d1<d2 then
                    writeln(' fecha 1 es la mas antigua')
            end
            else writeln('fecha2 es la mas antigua')
        end
    else writeln('fecha2 es la mas antigua');

    
end.