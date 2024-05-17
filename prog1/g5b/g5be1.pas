program g5be1;

{ Dado un arreglo A de N elementos reales, desarrollar subprogramas para: 
a) Calcular la suma de sus elementos. 
b) Mostrar los elementos que se encuentran en posiciones pares. 
c) Calcular el máximo y el mínimo elemento.  
d) Generar un arreglo B con los elementos de A permutado 
( B[1]=A[N], B[2]=A[N-1] ... B[N]=A[1] ). 
Escribir el programa principal con las invocaciones a cada uno de los subprogramas,
mostrando los resultados correspondientes}

const   
    N=10;
type
    vec=array[1..N] of byte;

const
    v:vec=(4,7,2,2,3,2,6,3,2,1);

function suma(v:vec):word;
var
    i:byte;
    aux:word;
begin   
    aux:=0;
    for i:=1 to N do
    begin
        aux:=aux+v[i];
    end;
    suma:=aux;    
end;

procedure mostrarpares(v:vec);
var
    i:byte;
begin
    for i:=1 to N do
    begin
        if i mod 2 =0 then
            writeln(v[i]);
    end;
end;

procedure maximin(v:vec;var max,min:byte);
var
    i:byte;
begin
    max:=0;min:=100;
    for i:=1 to N do
        if v[i]>max then
            max:=v[i];
        if v[i]<min then
            min:=v[i];
end;

procedure permutado(v:vec;var b:vec);
var
    i:byte;
begin
    for i:=1 to N do
    begin
        b[i]:=v[n+1-i];
    end;
end;

procedure mostrar(b:vec);
var
    i:byte;
begin
    for i:=1 to n do
        write(b[i],' ')
end;
var
    sum:word;
    max,min:byte;
    b:vec;
begin
    sum:=suma(v);
    writeln('suma de elementos es: ',sum);
    mostrarpares(v);
    maximin(v,max,min);
    writeln('el maximo es: ', max);
    writeln('el minimo es: ', min);
    permutado(v,b);
    write('original: ');
    mostrar(v);
    writeln;
    Write('permutado: ');
    mostrar(b);

    
end.