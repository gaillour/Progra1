program g1e3;

{Dada una cantidad X de horas trabajadas, calcular e imprimir el sueldo bruto y neto 
de un empleado.
Considerar la paga de $ 200 la hora, un descuento del 11% previsional y el 5% para
cobertura médica}
var 
    x:integer;
    sueldo: real;

begin
    write('ingrese horas trabajadas: ');
    readln(x);
    sueldo:=x*200*(0.89)*(0.95);
    writeln(sueldo:4:2);
end.