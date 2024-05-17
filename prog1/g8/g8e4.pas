program g8e4;

{Escribir un subprograma recursivo que retorne una cadena de caracteres 
recibida como parametro con su contenido invertido
‘lamina’ => ‘animal’}

function reves(cad:string):string;
begin
    if Length(cad)= 0 then
        reves:=''
    else reves:=reves(Copy(cad,2,Length(cad)-1))+ cad[1];
    //copy devuelve la cadena de longitud length(cad)-1 extraída de la cadena cad a
    //partir de la posición 2
    //(saca la primer letra)
end;


begin

writeln(reves('lamina aneub'))
end.