program g3e3;

{Ingresar N números enteros, informar cuántas veces un número supera al anterior}
type
    vec=array[1..11] of integer;

const
    nums:vec=(10, 78, 45, 80, 56, 80, 32, 90, 89, 90, 45);
    n=11;

var
    i,cant:byte;

begin
    cant:=0;
    for i:=2 to n do
    begin
        if nums[i]>nums[i-1] then
            cant:=cant+1;
    end;    
    writeln('la cant de veces q un numero supera al anterior es: ', cant);
end.