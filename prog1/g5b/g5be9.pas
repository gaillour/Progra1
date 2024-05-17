program g5be9;

{Dado un archivo de números enteros no nulos, almacenar en un arreglo A aquellos 
que formen una secuencia ascendente. A partir de A generar B con la misma cantidad 
de elementos de A pero poniendo ceros  en  aquellas  componentes  simétricas  donde  la 
simétrica  derecha  no  sea  múltiplo  de  la  izquierda. 
Escribir ambos arreglos. 
Ejemplo:  Archivo: 5, 7, 1, 12, 15, -10, 10, 24, -25, 26, 50, 13 
A = (5, 7, 12, 15, 24, 26, 50)   B= (5, 0, 12, 15, 24, 0, 50)}

const   
    max=30;

type
    tv=array[1..max] of integer;

procedure leer(var v:tv; var n:byte);
var
    arch:text;
    num:integer;
begin
    assign(arch,'e9.txt'); reset(arch);
    n:=1;
    ReadLn(arch,num);
    v[n]:=num;
    while not eof(Arch) do
    begin
        readln(Arch,num);
        if num>v[n-1] then
        begin
            n:=n+1;
            v[n]:=num;
        end;
    end;
    close(arch);    
end;

procedure simetricas(v:tv;var b:tv;n:byte);
var
    i:byte;
begin
    i:=0;
    while i<=(n div 2) do 
    begin
        i:=i+1;
        if v[n+1-i] mod v[i] <> 0 then  {el que esta antes es mas chico siempre}
        begin
            b[i]:=0;
            b[n+1-i]:=0;
        end
        else
        begin
            b[i]:=v[i];
            b[n+1-i]:=v[n+1-i];
        end;
    end;
end;

procedure inicializar(var v:tv);
var
    i:byte;
begin
    for i:=1 to Length(v) do
        v[i]:=0;    
end;

procedure mostrar(v:tv;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        write(v[i],' ')
end;

var
    v,b:tv;
    n:byte;
begin
    inicializar(v);
    leer(v,n);
    mostrar(v,n);
    simetricas(v,b,n);
    writeln;
    mostrar(b,n);
end.