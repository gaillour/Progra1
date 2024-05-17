program g1e1;

{En una pinturería informan que para obtener el color “gris mara” se debe mezclar 9.5 litros 
de Negro y 4.5 litros de Blanco. Se quiere asesorar a un cliente con las cantidades que 
necesita mezclar para obtener el color si:
a) Tiene N litros de pintura Blanca. ¿Cuánto debe comprar de pintura Negra? .
b) Tiene M litros de pintura Negra. ¿Cuánto debe comprar de pintura Blanca?.}

var
    n,m,cantb,cantn:real;

begin
    write('ingrese cant litros de pintura blanca: ');
    readln(n);
    cantn:=n*(9.5)/(4.5);
    writeln('necesita ',cantn:4:2, ' litros de pintura negra');

    write('ingrese cant litros de pintura negra: ');
    readln(m);
    cantb:=m*(4.5)/(9.5);
    writeln('necesita ',cantb:4:2, ' litros de pintura blanca');

end.