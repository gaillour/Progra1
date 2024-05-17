program g3e23correccion;

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
    c1,c2:char;
    valida,distintos:boolean;
    correctas,total,cantcar,digitos,maxcar,cmin,cmay:byte;
    porcentaje:real;
    contra:string;

begin
    assign(arch,'contras.txt'); reset(arch);
    

    read(arch,c1);
    while c1<>'.' do
    begin
        read(arch,c2);
        if c2<>' ' then {adentro de la palabra}
        begin
            cantcar:=cantcar+1;
            if c1=upcase(car) then cmay:=cmay+1
            else cmin:=cmin+1;
            if c1 in ['0'..'9'] then digitos:=digitos+1;
            if not ((c1 in ['0'..'9']) or (c1 in ['a'..'z']) or (c1 in ['A'..'Z'])) then 
                distintos:=true;
        end
        else 
        begin
            if c1<>' ' then {fin de la palabra, ver si es valida e inicializar}
            begin
                
                total:=total+1; 
                if (cantcar>=8) and (cmay>=1) and (cmin>=1) and not (distintos) then
                begin
                    write(contra,' ');
                    correctas:=correctas+1;                
                end;
            end    
            else read(Arch,c2);   {blancos solos}           
        end;
        c1:=c2;
    end;

    close(arch);
end.