program g5e1;

{Dado un arreglo A de N elementos reales, desarrollar subprogramas para: 
a) Calcular la suma de sus elementos. 
b) Mostrar los elementos que se encuentran en posiciones pares. 
c) Calcular el máximo y el mínimo elemento.  
d) Generar un arreglo B con los elementos de A permutado ( B[1]=A[N], B[2]=A[N-1] ... B[N]=A[1] ). 
Escribir el programa principal con las invocaciones a cada uno de los subprogramas, mostrando los 
resultados correspondientes. }

Type
    vector= array[1..10] of real;
const
    vec:vector=(1,40,3.4,2.6,32.8,54,75.6,26,96,20);

//a)
function suma(vec:vector): real;
var 
    i:byte;
begin
    for i:=1 to Length(vec) do
      suma:=suma+vec[i];
end;

//b)
procedure posiciones(var vec,res:vector);
var
    i,cont:byte;
begin
cont:=0;
    for i:=1 to Length(vec) do
      begin
        if i mod 2 = 0 then
        begin
          cont:=cont+1;  
          res[cont]:=vec[i];
        end;
      end;
end;

//c)
function maximo(vec:vector):real;
var 
    i:byte;

begin
    maximo:=vec[1];
    for i:=2 to length(vec) do
      begin
        if vec[i] >maximo then
            maximo:=vec[i]
      end;
end;

function minimo(vec:vector):real;
var
    i:byte;
begin
    minimo:=vec[1];
    for i:=2 to Length(vec) do
      begin
        if vec[i]< minimo then
          minimo:=vec[i]
      end;
end;

//d)

procedure permutar(var vec,per:vector);
var
    i,n:byte;
begin
    n:=Length(vec);
    for i:=0 to n do
        per[i+1]:=vec[n-i]
end;



var 
    i,j:byte;
    resa:real;
    res,per:vector;
begin
//a)
resa:=suma(vec);
writeln('suma: ', resa:4:2);

//b)
posiciones(vec,res);
for i:=1 to Length(res) do
  writeln(res[i]:4:2, ' ');

//c)
writeln('maximo: ', maximo(vec):4:2);
writeln('minimo: ', minimo(vec):4:2);

//d)
permutar(vec,per);
for j:=1 to Length(vec) do
  writeln(per[j]:4:2);
  
end.