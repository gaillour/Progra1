program ej1;

{Ingresar una cantidad N de números enteros, calcular el promedio de positivos
y negativos, además la cantidad de ceros}

var
    cc,cn,cp,i,n:byte;
    sumn,sump,x:integer;
    promp,promn:real;


begin
    write('ingrese cantidad de numeros: ');
    readln(n);
    sumn:=0; sump:=0; cn:=0; cp:=0;cc:=0;
    for i:=1 to n do
    begin
        write('ingrese el ' ,i,' numero: ');
        readln(x);
        if x<>0 then
        begin
            if x>0 then
            begin
                sump:=sump+x;
                cp:=cp+1; 
            end
            else 
            begin
                sumn:=sumn+x;
                cn:=cn+1;
            end            
        end
        else cc:=cc+1;
    end;
    promp:=(sump/cp);
    promn:=(sumn/cn);
    writeln(promp:4:2,promn:4:2);
end.