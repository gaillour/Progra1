program g5e9;

{Dado un archivo de números enteros no nulos, almacenar en un arreglo A aquellos que formen una 
secuencia ascendente. A partir de A generar B con la misma cantidad de elementos de A pero poniendo 
ceros  en  aquellas  componentes  simétricas  donde  la  simétrica  derecha  no  sea  múltiplo  de  la  izquierda. 
Escribir ambos arreglos. 
Ejemplo:  Archivo: 5, 7, 1, 12, 15, -10, 10, 24, -25, 26, 50, 13 
A = (5, 7, 12, 15, 24, 26, 50)   B= (5, 0, 12, 15, 24, 0, 50)}

type
    vec=array[1..7] of integer;
    

procedure leer(var arch:text;var a:vec);
var
    i:byte;
    n,aux:integer;
begin
    aux:=-999;
    i:=0;
    assign(arch,'crecientes.txt');
    reset(arch);
    while not eof(arch) do
        begin
            read(arch,n);
            if n>aux then
                begin
                  i:=i+1;
                  a[i]:=n;
                  aux:=n;
                end
        end;
end;

procedure simetria(var a,b:vec);
var
    i:byte;
begin  
    for i:=1 to Length(a) do
      begin
        if i mod 2<>0 then
            b[i]:=a[i]
        else if a[i+1] mod a[i-1] <> 0 then
            b[i]:=0
        else b[i]:=a[i]  //croto 
      end;
end;

var 
    arch:text;
    a,b:vec;
    i,j:byte;

begin
leer(arch,a);
simetria(a,b);
for i:=1 to Length(a) do 
    begin
    Writeln(a[i]);
    end;
writeln('simetria: ');
for j:=1 to Length(b) do 
    Writeln(b[j])

end.