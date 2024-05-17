program g3e22capi;


{ A  partir  de  un  archivo  de  texto  que  contiene  palabras  separadas  entre  sí 
por  uno  o  más  blancos desarrollar un programa para: 
a)  Mostrar la palabra con más cantidad de vocales del texto. 
b)  Grabar en un texto de salida las palabras con más de cuatro letras pero 
escritas al revés. 
c)  Contar cuántas son palíndromas (capicúas).}

{completo}
var
    c1,c2:char;
    arch,salida:text;
    cvocales,capi,i,masvoc:byte;
    palmasvoc,palabra,alreves:string;


begin
    assign(arch,'palabras.txt'); reset(arch);
    assign(salida,'salida22.txt'); Rewrite(salida);

    masvoc:=0; palabra:='';alreves:='';capi:=0;cvocales:=0;
    read(arch,c1);
    while not eof(arch) do
    begin
        read(Arch,c2);
        if c1<>' ' then
        begin
            palabra:=palabra+c1;
            alreves:=c1+alreves;
        end;
        if c1 in ['a','e','i','o','u'] then cvocales:=cvocales+1;
        if (c1<>' ') and ((c2=' ') or (c2='.')) then
        begin
            if cvocales>masvoc then
            begin
                masvoc:=cvocales;
                palmasvoc:=palabra;
            end;
            if Length(palabra)>4 then  writeln(salida,alreves);
            if palabra=alreves then capi:=capi+1;
            palabra:='';alreves:=''; cvocales:=0;
        end;
        c1:=c2;
    end;
    
    close(salida);
    close(arch);

    writeln('la palabra con mas vocales fue: ', palmasvoc);
    writeln('la cantidad de capicuas es: ', capi);
end.