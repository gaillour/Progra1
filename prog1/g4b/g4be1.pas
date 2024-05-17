program g4be1;

{ Desarrollar una función booleana que dado un caracter diga si es letra o no. }

function esletra(letra:Char):boolean;
begin
    if (letra in ['a'..'z']) or (letra in ['A'..'Z'])then
        esletra:=True
    else esletra:=false;

end;

var
    letra:char;
begin
    readln(letra);
    if esletra(letra) then writeln(letra,' es letra')
    else writeln(letra,' no es letra')
end.