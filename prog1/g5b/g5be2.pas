program g5be2;

{ Dado un archivo de enteros, se pide almacenar en un vector V sólo los 
elementos impares y en otro vector W, los pares, ignorando si hubiese, los ceros}

type
    vec=array[1..30] of word;


procedure leer(var v,b:vec;var nv,nb:byte);
var
    arch:text;
    num:word;
begin
    nv:=0;nb:=0;
    assign(arch,'e2.txt'); reset(arch);
    while not Eof(arch) do
    begin
        readln(arch,num);
        if (num<>0) then
        begin
            if num mod 2=0 then
            begin
                nb:=nb+1;
                b[nb]:=num;
            end
            else
            begin
                nv:=nv+1;
                v[nv]:=num;                
            end;
        end;
    end;
    Close(arch);
end;

procedure mostrar(v:vec;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
    begin
        write(v[i],' ');
    end;
end;
var
    v,b:vec;
    nv,nb:byte;

begin
    leer(v,b,nv,nb);
    mostrar(v,nv);
    writeln;
    mostrar(b,nb);
end.