program g3e23;

{Un  archivo  contiene  palabras  (letras  mayúsculas,  minúsculas,  dígitos,  caracteres
especiales) separadas entre sí por uno o más blancos. Se debe verificar para cada una si
se trata de una contraseña válida,  y  en  ese  caso  grabarla  en  un  archivo  de 
salida.  Indicar  al  final  del  proceso  el  porcentaje  de palabras que no son
contraseñas válidas y mostrar la contraseña inválida más larga (puede no existir). 

Una contraseña válida debe: 
 estar conformada como mínimo por 8 caracteres,  
 incluir obligatoriamente, al menos una letra mayúscula y al menos una minúscula  
 incluir exactamente cuatro dígitos.  
 no contener caracteres diferentes de letras y digitos.

Ejemplo: 
eR68G12a    91jY643ebjp  eRty74kLh     24fG92   aj85gT32   eL8j$8215  dGb9357jKoup 
    c           i           i             i         c           i           c
La salida del programa sería:  
El % de contraseñas inválidas es 57.14 
La longitud de la contraseña inválida más larga es de 11 caracteres }

var
    arch:text;
    car:char;
    valida,min,may:boolean;
    correctas,total,cantcar,digitos,maxcar:byte;
    porcentaje:real;
    validas,invmaslarga:string;
begin
    assign(arch,'contras.txt'); reset(arch);
    read(Arch,car);
    correctas:=0; total:=0; valida:=false;
    may:=false; min:=false; cantcar:=0;
    digitos:=0; maxcar:=0; validas:='';
    writeln();
    write('contrasenas validas: ');
    while not eof(arch) do
    begin
        if not ((car in ['0'..'9']) or (car in ['a'..'z']) or (car in ['A'..'Z']) or (car=' ')) then
        begin
            repeat
                read(arch,car) 
            until (car=' ') or (car='.');       
            valida:=False;     
            total:=total+1;
        end;
        if (car<>' ') then
        begin
            cantcar:=cantcar+1;
            if car=upcase(car) then
                may:=true
            else min:=true;
            if car in ['0'..'9'] then
                digitos:=digitos+1;
            validas:=validas+car;
        end
        else
        begin
            if (cantcar>=8) and (min) and (may) and (digitos=4) then
            begin
                correctas:=correctas+1;
                writeln(validas);
            end
            else if cantcar>maxcar then
            begin
                maxcar:=cantcar;
                invmaslarga:=validas;
            end;
            total:=total+1;
            may:=false; min:=false;
            digitos:=0; cantcar:=0; 
            valida:=false; validas:='';
        end;
        read(arch,car);{
        write(car);}
    end;   
    total:=total-1; {cuenta los espacios, el total de contraseñas es 1 menos}
    close(arch);
    writeln;
    if correctas>0 then
    begin
        porcentaje:=(total-correctas)/total*100;
        writeln('porcentaje de invalidas: ', porcentaje:4:2);        
    end
    else writeln('no hay invalidas');
    writeln('la contrasenia invalida mas larga es de ', maxcar,' caracteres: ',invmaslarga);
    writeln;

end.