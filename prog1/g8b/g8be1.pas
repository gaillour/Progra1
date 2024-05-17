program g8be1;

{La siguiente función calcula la potencia n-ésima de un número X ( X n ) en forma iterativa, siendo n 
y X enteros. Se pide:  
a) Desarrollarla en forma recursiva. 
b) Considerar n negativo. }
function potencia(X,n: integer): integer;   (* X elevado a n *) 
var 
   i: integer;                      
   mult: integer;                
begin 
   mult := 1;                   (* inicialización *) 
   for i := 1 to n do 
      mult := mult * X;          (* hacemos "n" veces "X*X" *) 
   potencia := mult;             
end;


function potenciaRecursiva(x,n:integer):real;
begin
    if (n=0) then potenciaRecursiva:=1
    else if n>0 then potenciaRecursiva:=x*potenciaRecursiva(x,n-1)
    else potenciaRecursiva:=1/(potenciaRecursiva(x,-n))//convierte en positivo y devuelve valor sobre 1
end;


var
    x,n:integer;
begin
    x:=2;n:=-3;
    writeln(potenciaRecursiva(x,n):4:4);
    x:=4;N:=4;
    writeln(potenciaRecursiva(x,n):4:4);

end.