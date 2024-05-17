program e12;

{ Implementar un juego donde la computadora genera al azar un número entre 1 y 50 y el 
usuario debe adivinarlo en a lo sumo 10 intentos.}

var
    i,num,user,intento:byte;
    adivino:boolean;
begin
    randomize;
    adivino:=false;
    intento:=1;
    num:=random(50)+1;
    write(num);
    repeat
        write('ingrese ', intento ,' intento:');
        readln(user);
        if user=num then
            adivino:=true;       
        intento:=intento+1; 
    until (adivino) or (intento>10);
        
    if adivino then writeln('ganaste')
    else writeln('perdiste, era: ',num);
end.