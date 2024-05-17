program g8be5;

{Sea V un arreglo de enteros, mediante procesos recursivos se pide: 
a) Calcular e informar la suma de sus elementos. 
b) Mostrar sus elementos. 
c) Mostrarlos en orden inverso. 
d) Obtener el máximo de sus elementos. 
e) Obtener el promedio.}

type    
    tv=array[1..10] of integer;
const
    v:tv=(4,3,-1,5,8,2,-1,6,3,10);


function suma(v:tv;n:byte):Integer;
begin
    if n=1 then suma:=v[n]
    else suma:=v[n]+suma(v,n-1)
end;

procedure mostrar(v:tv;n,i:byte);
begin
    write(v[i],' ');
    if i<n then mostrar(v,n,i+1);
end;

procedure mostraralreves(v:tv;n,i:byte);
begin
    write(v[i],' ');
    if i>1 then mostrar(v,n,i-1);
end;

procedure maximo(v:tv;n,i:byte;var max:integer);
begin
    if i>=1 then
    begin
        if v[i]>max then max:=v[i];
        maximo(v,n,i-1,max);
    end;
    
end;

procedure promedio(v:tv;n,i:byte;var suma,prom:real);
begin
    if i=n then prom:=(suma+v[i])/n
    else 
    begin
        suma:=suma+v[i];
        promedio(v,n,i+1,suma,prom);
    end;
end;


var
    n:byte;
    max:integer;
    sum,prom:real;
begin
    n:=Length(v);
    writeln(suma(v,n));
    mostrar(v,n,1);
    writeln;
    mostraralreves(v,n,n);
    writeln('faltan');
    maximo(v,n,n,max);
    writeln('maximo: ',max);
    sum:=0;
    promedio(v,n,1,sum,prom);
    writeln('el promedio es: ', prom:4:2);
end.