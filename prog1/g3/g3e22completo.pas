program g3e22completo;

{ A  partir  de  un  archivo  de  texto  que  contiene  palabras  separadas  entre  sí 
por  uno  o  más  blancos desarrollar un programa para: 
a)  Mostrar la palabra con más cantidad de vocales del texto. 
b)  Grabar en un texto de salida las palabras con más de cuatro letras pero 
escritas al revés. 
c)  Contar cuántas son palíndromas (capicúas).}

{incompleto}
var
    arch,salida:text;
    cvocales,maxvocales,capicuas:byte;
    c1,c2,aux:char;
    palabra,palmasvocales,alreves:string;
    i:byte;

begin
    assign(arch,'palabras.txt'); reset(arch);
    assign(salida,'cuatroletras.txt'); Rewrite(salida);

    cvocales:=0;maxvocales:=0;
    palabra:=''; capicuas:=0;
    alreves:='';

    read(arch,c1);
    aux:=c1;
    while c1<>'.' do
    begin
        read(arch,c2);
        if c1<>' ' then palabra:=palabra+c1;
        if c1 in ['a','e','i','o','u'] then
            cvocales:=cvocales+1;

        if (c2=' ') or (c2='.') then
        begin
            alreves:='';
            if cvocales>maxvocales then
            begin
                maxvocales:=cvocales;
                palmasvocales:=palabra;
            end;
            if Length(palabra)>4 then
            begin
                for i:=Length(palabra) downto 1 do
                begin
                    write(salida,palabra[i]);
                    alreves:=alreves+palabra[i];
                end;
                write(salida,' ');
            end;
            if alreves=palabra then 
                capicuas:=capicuas+1;
            cvocales:=0;
            palabra:='';
        end;
        c1:=c2;
    end;
    
    close(salida);
    close(arch);
    writeln('la palabra con mas vocales es: ',palmasvocales);
    write('la cantidad de capicuas es: ', capicuas);

end.