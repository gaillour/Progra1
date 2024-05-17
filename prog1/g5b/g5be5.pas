program g5be5;

{Dado  un  archivo  de  enteros,  almacenarlos  en  un  arreglo,  luego  obtener 
el  promedio  de  todos  los números  divisores  del  máximo  y  con  ellos  armar  
otro  arreglo.  Mostrar  ambos  arreglos  y  el  promedio obtenido}

type
    vec=array[1..20] of byte;

procedure leer(var v:vec;var max,n:byte);
var 
    arch:text;
    num:byte;
begin
    n:=0;max:=0;
    assign(arch,'e5.txt'); reset(arch);
    
    while not Eof(arch) do  
    begin
        readln(Arch,num);
        n:=n+1;
        v[n]:=num;
        if num>max then
          max:=num;
    end;    
    close(arch);
end;

procedure divisores(v:vec;var b:vec;var prom:real;var m:byte;max,n:byte);
var 
    i:byte;
    sum:word;
begin
    m:=0;sum:=0;
    for i:=1 to n do
    begin
        if max mod v[i] = 0 then { si es divisor}
        begin   
            m:=m+1;
            b[m]:=v[i];
            sum:=sum+v[i];
        end
    end;
    prom:=sum/m;
end;

procedure mostrar(v:vec;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
    begin
        write(v[i], ' ');
    end;
end;

var
    v,b:vec;
    n,m,max:byte;
    prom:real;
begin
    leer(v,max,n);
    divisores(v,b,prom,m,max,n);
    mostrar(v,n);
    writeln;
    mostrar(b,m);
    writeln;
    writeln('el promedio de los divisores es: ', prom:4:2);

end.