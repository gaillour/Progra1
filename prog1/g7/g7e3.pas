program g7e3;


{Dado un conjunto de puntos en el plano, almacenar en un arreglo sus coordenadas 
junto con la distancia al centro de coordenadas y a qué cuadrante pertenece. 
Usando el arreglo, se pide: 
 Informar el más cercano y más lejano al centro. 
 Porcentaje de puntos en cada cuadrante (1..4, centro, eje X, eje Y). 
Cada punto en el plano P tiene una coordenada X y otra Y. Desarrollar la 
función Distancia que dados dos puntos P y Q devuelva la distancia entre ambos}
const
lim=20;

type
    punto=record
        x:integer;
        y:integer;
        d:real;
    end;
    cuadrantes=record
        c1,c2,c3,c4,centro,x,y:real;
    end;
    tv=array[1..lim] of punto;

procedure leer(var vec:tv;var n:byte);
var
    arch:text;
begin
    assign(arch,'puntos.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        n:=n+1;
        with vec[n] do
        begin
            readln(arch,x,y);
            d:=sqrt((sqr(x)+sqr(y)));
        end;
    end;
end;

procedure escribir(var vec:tv; var n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(vec[i].d:4:2);       
end;

function posmaslejano(vec:tv;n:byte):byte;
var
    i,imax:byte;
    max:real;
begin
    max:=vec[1].d;
    for i:=2 to n do
    begin
        if vec[i].d>max then
        begin
            max:=vec[i].d;
            imax:=i;
        end;
    end;    
    posmaslejano:=imax;
end;

function posmascercano(vec:tv;n:byte):byte;
var
    i,imin:byte;
    min:real;
begin
    min:=vec[1].d;
    for i:=2 to n do
    begin
        if vec[i].d<min then
        begin
            min:=vec[i].d;
            imin:=i;
        end;
    end;    
    posmascercano:=imin;
end;

function distancia(x1,y1,x2,y2:byte):real;
begin
    distancia:=sqrt(sqr(x2-x1)+sqr(y2-y1))
end;


{Porcentaje de puntos en cada cuadrante (1..4, centro, eje X, eje Y).}
procedure porcentaje(var vec:tv;var c:cuadrantes;n:byte);
var
    i:byte;
begin
    for i:=1 to n do 
    begin
        with vec[i] do
        begin
            if (x=0) and (y=0) then
                c.centro:=c.centro+1
            else if (x=0) and (y<>0) then
                c.y:=c.y+1
            else if (x<>0) and (y=0) then
                c.x:=c.x+1
            else if x>0 then
            begin
                if y>0 then
                    c.c1:=c.c1+1
                else c.c4:=c.c4+1;
            end else
            begin
                if y>0 then
                    c.c2:=c.c2+1
                else c.c3:=c.c3+1
            end;
        end;
    end;
end;





var
    vec:tv;
    n,imax,imin:byte;
    p,q:punto;
    c:cuadrantes;
begin
leer(vec,n);
escribir(vec,n);
imax:=posmaslejano(vec,n);
writeln('el punto mas lejano es: (',vec[imax].x,',',vec[imax].y,')');
imin:=posmascercano(vec,n);
writeln('el punto mas cercano es: (',vec[imin].x,',',vec[imin].y,')');

porcentaje(vec,c,n);
with c do
begin
    writeln('primer cuadrante: ',c1:4:2);
    writeln('segundo cuadrante: ',c2:4:2);
    writeln('tercer cuadrante: ',c3:4:2);
    writeln('cuarto cuadrante: ',c4:4:2);
    writeln('eje x: ', x:4:2);
    writeln('eje y: ', y:4:2);
    writeln('centro: ',centro:4:2);

end;


write('ingrese punto P: ');
with p do
begin
    write('x: ');readln(x);write('y: ');readln(y);
end;

write('ingrese punto Q: ');
with q do
begin
    write('x: ');readln(x);write('y: ');readln(y);
end;

writeln('la distancia entre esos dos puntos es: ',distancia(p.x,p.y,q.x,q.y):4:2);


end.