program g2e1;

{Informar si un caracter ingresado es letra minúscula, mayúscula u otro cualquiera.}

var
    car:char;

begin
    readln(car);
    if upcase(car)=car then
        writeln(car, ': es mayuscula')
    else writeln(car, ': es minuscula');
  
end.