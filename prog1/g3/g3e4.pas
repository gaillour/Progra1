program g3e4;

{Ingresar N números enteros (ordenados en forma descendente), informar cual es la máxima
diferencia entre dos números consecutivos y qué posición ocupa ese par de números dentro 
de la secuencia.
Ejemplo: 25 19 11 9 3 -3, la máxima diferencia es 8 y corresponde al par 2
Nota: La diferencia se calcula sobre un par de números, por lo tanto deben estar en memoria dos valores
consecutivos (Pri y Seg), que se actualizan en cada repetición}

type 
    vec=array[1..6] of integer;
const
    nums:vec=(25,19,11,9,3,-3);
    n=6;

var 
    pri, seg: integer;
    dif,pos,i,max:byte;

begin
    max:=0;
    for i:=1 to n do
    begin
        pri:=nums[i];
        seg:=nums[i+1];
        dif:=abs(pri-seg);
        if dif>max then
        begin
            max:=dif;
            pos:=i;
        end;   
    end;
    writeln('diferencia maxima: ',max,' par numero: ',pos);

end.