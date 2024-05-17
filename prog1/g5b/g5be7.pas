program g5be7;

{Realizar la suma de dos números positivos muy grandes (de 10 cifras, por ejemplo).
Implementar el programa principal que lea ambos números, invoque el subprograma que 
resuelve la suma y muestre el resultado.}

const
    lim=25;
type
    tvb=array[1..lim] of byte;


procedure lectura(var n1,n2:tvb;var n:byte);
var
    num1,num2:string;
    dis,i:byte;
begin   
    write('ingrese el numero mas grande: ');
    readln(num1);
    write('ingrese el numero mas chico: ');
    readln(num2);
    n:=Length(num1);
    dis:=Length(num1)-Length(num2);
    for i:=n downto 1 do
    begin
        n1[i]:=ord(num1[i])-48;{por tabla ascii, sino se puede usar val(num[1],n1[i],code)}
        if i>dis then
            n2[i]:=ord(num2[i-dis])-48      
        else n2[i]:=0;
    end;
end;

procedure suma(n1,n2:tvb;var res:tvb;n:byte;var r:byte);
var
    i:byte;
begin
    r:=n+1;
    for i:=n downto 1 do
    begin
        res[i+1]:=res[i+1]+n1[i]+n2[i];
        if res[i+1]>=10 then
        begin
            res[i+1]:=res[i+1]-10;
            res[i]:=1;
        end;
    end;
end;


procedure inicializar(var v:tvb);
var
    i:byte;
begin
    for i:=1 to lim do
        v[i]:=0;
end;


var
    n1,n2,res:tvb;
    r,n,i,m:byte;
begin   
    inicializar(res);
    inicializar(n1);
    inicializar(n2);
    lectura(n1,n2,n);
    suma(n1,n2,res,n,r);

    for i:=1 to r do 
        write(res[i])
end.