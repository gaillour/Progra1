program arreglosparalelos;

type
    vec=array[1..10] of string;

procedure separar(var num,let:vec);
var 
    arch:text;
    car:char;
    i:byte;
    numero,palabra:string;
begin
    assign(arch,'numsletras.txt');
    reset(arch);
    i:=0; 
    while not(eof) do
    begin
        i:=i+1;num[i]:=''; pal[i]:='';
        read(arch,car);
        while car<>'.' do
        begin
            if car in ['1'..'9'] then
                num[i]:=num[i]+car
            else let[i]:=let[i]+car;  
            read(arch,car);
        end;
    readln(arch);
    end;
end;

var 
    num,let:vec;
    i:byte;
begin
separar(num,let);
for i:=1 to Length(num) do
  writeln(i,': ', num[i],' ', let[i])

end.