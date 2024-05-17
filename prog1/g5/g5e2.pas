program g5e2;

{Dado un archivo de enteros, se pide almacenar en un vector V sólo
los elementos impares y en otro vector W, los pares, ignorando si hubiese, los ceros.}

type 
    vec= array[1..10] of integer;

procedure leer(var arch:text;var v,w:vec);
var
    i,j:byte;
    num:integer;
begin
    i:=0;j:=0;
    assign(arch,'enteros.txt');
    reset(arch);
    while not eof(arch) do
      begin
        readln(arch,num);
        if (num mod 2 = 0) and (num<>0)then
            begin
              i:=i+1;
              v[i]:=num;
            end
        else if num mod 2 <> 0 then
            begin
              j:=j+1;
              w[j]:=num
            end;
          
          
      end;
  
end;

var 
    i,j:byte;
    v,w:vec;
    arch:text;

begin
leer(arch,v,w);
for i:=1 to Length(v) do
    writeln(i,': ',v[i]);
for j:=1 to Length(w) do
    writeln(j,': ', w[j]);

end.