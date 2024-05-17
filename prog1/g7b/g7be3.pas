program g7be3;

{ Dado un conjunto de puntos en el plano, almacenar en un arreglo sus coordenadas junto con la 
distancia al centro de coordenadas y a qué cuadrante pertenece. 
Usando el arreglo, se pide: 
     Informar el más cercano y más lejano al centro. 
     Porcentaje de puntos en cada cuadrante (1..4, centro, eje X, eje Y). 
Cada punto en el plano P tiene una coordenada X y otra Y. Desarrollar la función Distancia que
dados dos puntos P y Q devuelva la distancia entre ambos.
}

type    
    TrP=record
        cuad:char;{0,1,2,3,4,X,Y}
        x,y,dis:Real;
    end;
    tv=array[1..30] of TrP;

function distancia(x1,y1,x2,y2:real):real;
begin
    distancia:=sqrt(sqr(abs(x2-x1))+sqr(y2-y1));
end;

function cuadrante(x,y:real):char;
begin
    if (x=0) and (y=0) then
        cuadrante:='0'
    else if x>0 then
    begin
        if y=0 then cuadrante:='X'
        else if y>0 then cuadrante:='1'
        else cuadrante:='4';
    end
    else if x<0 then
    begin
        if y=0 then cuadrante:='X'
        else if y>0 then cuadrante:='2'
        else cuadrante:='3'
    end
    else cuadrante:='Y'
end;


procedure leer(var vec:tv;var n:byte);
var
    arch:text;

begin
    assign(arch,'e3.txt'); reset(arch);
    n:=0;
    while not eof(arch) do 
    begin
        n:=n+1;
        with vec[n] do
        begin
            readln(Arch,x,y);
            dis:=distancia(x,y,0,0);
            cuad:=cuadrante(x,y);            
        end;        
    end;
    close(arch);
end;


procedure masLejano(vec:tv;n:byte);
var
    i,imax:byte;
    max:real;
begin
    max:=0;
    for i:=1 to n do
    begin
        with vec[i] do
        begin
            if dis>max then
            begin
                max:=dis;
                imax:=i;
            end;
        end;
    end;
    writeln('el mas lejano es: ','(',vec[imax].x:4:2,',',vec[imax].y:4:2,')');    
end;

procedure masCercano(vec:tv;n:byte);
var
    i,imin:byte;
    min:real;
begin
    min:=1000;
    for i:=1 to n do
    begin
        with vec[i] do
        begin
            if dis<min then
            begin
                min:=dis;
                imin:=i;
            end;
        end;
    end;
    writeln('el mas cercano es: ','(',vec[imin].x:4:2,',',vec[imin].y:4:2,')');    
end;

procedure porCuadrante(vec:tv;n:byte);
var
    i:byte;
    cen,p,s,t,c,ex,ey:real;
begin
    cen:=0;p:=0;s:=0;t:=0;c:=0;ex:=0;ey:=0;
    for i:=1 to n do
    begin
        with vec[i] do
        begin
            case cuad of
                '0':cen:=cen+1;
                '1':p:=p+1;
                '2':s:=s+1;
                '3':t:=t+1;
                '4':c:=c+1;
                'X':ex:=ex+1;
                'Y':ey:=ey+1;
            end;
        end;
    end;
    writeln('porcentajes:');
    writeln('centro: ',(cen/n):4:4);
    writeln('primer: ',(p/n):4:4);
    writeln('segundo: ',(s/n):4:4);
    writeln('tercer: ',(t/n):4:4);
    writeln('cuarto: ',(c/n):4:4);
    writeln('eje x: ',(ex/n):4:4);
    writeln('eje y: ',(ey/n):4:4);    
end;

procedure mostrar(vec:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        with vec[i] do
            WriteLn('(',x:4:2,',',y:4:2,')',' dis: ',dis:4:2,' cuadrante: ',cuad);      
end;


var
    vec:tv;
    n:byte;
begin
    leer(vec,n);
    mostrar(vec,n);
    masLejano(vec,n);
    masCercano(vec,n);
    porCuadrante(vec,n);

end.