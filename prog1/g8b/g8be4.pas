program g8be4;

{Escribir un subprograma recursivo que retorne una cadena de caracteres recibida como parametro 
con su contenido invertido. 
    Ejemplo: ‘lamina’ -> ‘animal’}


procedure invertir(pal:string;var inv:string;i:byte);
begin
    inv:=pal[i]+inv;
    if i<=Length(pal) then invertir(pal,inv,i+1)   
end;

function fInvertir(pal:string;i:byte):string;
begin
    if i<=Length(pal) then fInvertir:=fInvertir(pal,i+1)+pal[i];
end;


var
    pal,inv:string;
begin

    pal:='lamina';
    //procedimiento
    invertir(pal,inv,1);
    writeln(inv);   

    //funcion
    writeln(fInvertir(pal,1));
end.