program g8be9;

{Implementar un procedimiento o función recursiva que determine si los dígitos de un número
natural están dispuestos de forma creciente, esto es,  
         
 si N = dm dm-1 .....d2 d1  y para todo i: 1 <= i <= m, verifica que  d i >= d i+1  

Por ejemplo: para 2337, 356, 88 o 459 debería retornar verdadero 
No se permite el uso de cadenas ni de vectores. }


procedure creciente(n,d,anterior:integer;var esCreciente:boolean);
var
    num:integer;
begin
    num:=trunc((frac(n/d))*10.01); 
    if (num>0) then 
    begin      
        if (num<=anterior)  then    
        begin
            anterior:=num;
            d:=d*10;
            esCreciente:=true;
            creciente(n,d,anterior,esCreciente);
        end
        else esCreciente:=false;
    end
end;

var
    n,d,anterior:integer;
    esCreciente:boolean;
begin
    Write('ingrese numero: ');Readln(n);
    anterior:=10;
    d:=10;

    creciente(n,d,anterior,esCreciente);
    if esCreciente then writeln(n, ' es creciente')
    else writeln(n,' no es creciente');
end.