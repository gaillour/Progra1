program decenas;

const   
    n=9;
    tope=99;

type
    tb=array[0..n]of byte;
    ti=array[0..n]of integer;

procedure leer(var cant:tb;var max:ti);
var
    arch:text;
    num,i:integer;
begin
    assign(arch,'numeros.txt'); reset(arch);
    while not eof(arch) do
    begin
        readln(arch, num);
        if num<=tope then
        begin
            i:=trunc(num/10);
            cant[i]:=cant[i]+1;
            if num>max[i] then
                max[i]:=num;
        end
    end;
end;


var
    cant:tb;
    max:ti;
    i:byte;

begin
leer(cant,max);
writeln(n);
for i:=0 to n do
    writeln(i,': ',cant[i],' ',max[i]);
  
end.