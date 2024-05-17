program g3e21;

{Leer un conjunto de números enteros, la presencia de ceros intermedios indica fin de un 
subconjunto y comienzo del siguiente, dos ceros consecutivos es fin de datos. Se pide calcular e informar 
el máximo en cada subconjunto y el orden del subconjunto más numeroso.  
Ejemplo:  3,5,2,0,6,7,4,7,0,2,1,0,0 
subconjunto  Máximo 
   1     5 
   2     7 
   3     2 
El subconjunto con más elementos es: 2}

var 
    arch:text;
    num,max,sub,cant,submax,maxcant:byte;
    
begin
    Assign(arch,'ceros.txt'); reset(arch);
    maxcant:=0; max:=0; sub:=0;
    while not eof(arch) do
    begin
        repeat
            read(arch,num);
            if num>max then
                max:=num;
            if num>0 then 
                cant:=cant+1;
        until num=0;
        sub:=sub+1;{cambia al siguiente subconjunto}
        if max<>0 then writeln(max);
        if cant>maxcant then
        begin
            maxcant:=cant;
            submax:=sub;
        end;
        max:=0;
        cant:=0;
    end;
    writeln('el subconjunto con mas elementos es: ',submax);
end.