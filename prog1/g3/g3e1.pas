program g3e1;

{Dados N números enteros, calcular e informar:
a) El máximo, qué lugar ocupa la primera aparición y cuántas ocurrencias tiene.
b) El mínimo de los impares (informar si no existe)
Ejemplo: N = 10, 78, 45, 80, 56, 80, 32, 90, 89, 90, 45
a) 90 - 7º lugar - 2 ocurrencias
b) 45
}
type
    vec=array[1..11] of integer;

const
    nums:vec=(10, 78, 45, 80, 56, 80, 32, 90, 89, 90, 45);
    n=11;

var 
    max,minimp:integer;
    i,cant,pos:byte;

begin
    max:=0;
    minimp:=0;
    cant:=0;
    for i:=1 to n do
    begin
        if nums[i]>max then {si pidiese la ultima seria >=}
        begin
            max:=nums[i];
            pos:=i;
            cant:=1;
        end
        else if nums[i]=max then
            cant:=cant+1;

        if (nums[i]mod 2<>0) and (nums[i]<minimp) then
            minimp:=nums[i];
        

    end;

    writeln('el maximo es: ', max, ' aparece ', cant, ' veces y  la primera es en la posicion: ', pos);
    if minimp=0 then
        write('no hay impares')
    else write('el minimo impar es: ',minimp);
  
end.