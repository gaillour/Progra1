program g3e5;

{Generar y mostrar los múltiplos de K menores que un valor Q. (K y Q se leen de teclado)}


var
    k,i,q:word;

begin
    write('k? '); readln(k);
    write('q? '); readln(q);
    for i:=1 to q-1 do
    begin
        if i mod k = 0 then
            writeln(i);
    end;
end.