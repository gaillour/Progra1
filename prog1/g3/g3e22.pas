program g3e22;

{ A  partir  de  un  archivo  de  texto  que  contiene  palabras  separadas  entre 
sí  por  uno  o  más  blancos desarrollar un programa para: 
a)  Mostrar la palabra con más cantidad de vocales del texto. 
b)  Grabar en un texto de salida las palabras con más de cuatro letras pero escritas 
al revés. 
c)  Contar cuántas son palíndromas (capicúas)}


{
    para capicuas: 
    ir leyendo de a dos caracteres(c1,c2) 
    cuando c1 es blanco y c2 es letra
    guardarla en un aux (c2=aux)
    ir leyendo de a dos caracteres
    cuando el ultimo sea espacio comparar aux con c1(caracter antes del blanco)
}

{incompleto}
var 
    arch:text;
    masvocales,alreves,palabra:string;
    car:char;
    mas4:boolean;
    capicuas,cvocales,maxvocales,cletras:byte;

begin
    Assign(arch,'palabras.txt'); reset(arch);
    palabra:=''; cletras:=0;maxvocales:=0;cvocales:=0;
    while not eof(arch) do
    begin
        read(arch,car);
        if car<>' ' then
        begin
            cletras:=cletras+1;
            palabra:=palabra+car;
            if car in ['a','e','i','o','u'] then {no hay mayusculas}
                cvocales:=cvocales+1;
            
        end
        else 
        begin   
            if cletras>4 then
                writeln(palabra); {hay q darla vuelta}
            if cvocales>maxvocales then
            begin
                maxvocales:=cvocales;
                masvocales:=palabra;
            end;
            palabra:='';
            cvocales:=0;
            cletras:=0;
        end;
    end;
    writeln(' la palabra con mas cantidad de vocales es: ', masvocales);
end.