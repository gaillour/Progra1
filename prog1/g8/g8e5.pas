program g8e5;

const
    n=7;

type
    tv=array[1..n] of integer;

const
    v:tv=(2,5,7,3,2,8,1);


//a)
procedure suma(v:tv;var k:byte;i:byte);
begin
    if i=1 then
        k:=v[i] 
    else 
    begin
        suma(v,k,i-1);
        k:=k+v[i];
    end;    
end;

//b)
procedure mostrar(v:tv;i:byte);
begin
    if i=1 then
        write(v[i],' ')
    else
    begin
        mostrar(v,i-1);
        write(v[i],' ');
    end;
end; 

//c)
procedure mostraralreves(v:tv;i:byte);
begin
    if i=1 then 
        writeln(v[i],' ')
    else 
    begin
        write(v[i], ' ');
        mostraralreves(v,i-1);
    end;
end;  

//d)
procedure maximo(v:tv;var max:byte;i:byte);
begin 
    if (v[i]>max) and (i>=1) then
    begin
        max:=v[i];
        maximo(v,max,i-1);      
    end;
end;

//e)
procedure promedio(v:tv;var prom:real;i:byte);
begin
    if i=0 then
        prom:=prom/n
    else
    begin
        prom:=prom+v[i];
        promedio(v,prom,i-1);
    end;
end;

var 
    k,max:byte;
    prom:real;

begin
k:=0;
suma(v,k,n);
writeln('la suma de los elementos es: ', k);
mostrar(v,n);
writeln;
mostraralreves(v,n);
maximo(v,max,n);
writeln;
writeln('el maximo es: ',max);
promedio(v,prom,n);
writeln('el promedio es: ', prom:4:2);
end.