program g8be6;

{Sea A un arreglo de reales y un valor X real ingresado por teclado, se pide determinar en qué 
posición se encuentra X, devolver 0 en caso de no encontrarlo. Implementar: 
a) considerando el arreglo desordenado, una búsqueda lineal recursiva.  
b) para un arreglo ordenado en forma ascendente, una búsqueda binaria recursiva }

type    
    tv=array[1..10] of real;
const
    a:tv=(4,3,-1,5,8,2,-1,6,3,10);
    b:tv=(1,4,5,7,8,9,10,13,15,12);

procedure buscaX(a:tv;n:byte;x:real;var pos:byte);
begin
    if n>0 then
    begin
        if a[n]=x then pos:=n
        else buscaX(a,n-1,x,pos)
    end
    else pos:=0;
end;

procedure buscaXord(b:tv;n:byte;x:real;var pos:byte);
begin
    if x<=b[n] then
    begin
        if b[n]=x then pos:=n
        else buscaX(b,n-1,x,pos)
    end
    else pos:=0;
end;


var
    x:real;
    n,posa,posb:byte;
begin
    n:=Length(a);
    write('ingrese numero a buscar: ');readln(x);
    buscaX(a,n,x,posa);
    if posa>0 then writeln(x:4:2,' esta en la pos: ', posa)
    else writeln(x:4:2, ' no esta');
    buscaXord(b,n,x,posb);
    if posb>0 then writeln(x:4:2,' esta en la pos: ', posb)
    else writeln(x:4:2, ' no esta');

end.