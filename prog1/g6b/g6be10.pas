program g6be10;

const  
    n=4;
type
    tm=array[1..n,1..n] of integer;
    tfunc=function(mat:tm;k,n:byte):real;

const
    mat:tm=((1,7,4,3),(2,2,5,10),(2,8,5,20),(5,8,10,9));


function Fila(mat:tm;k,n:byte):real;
var
    i:byte;
    suma:integeR;
begin
    suma:=0;
    for i:=1 to n do
        suma:=suma+mat[k,i];
    fila:=suma/n;
end;

function Columna(mat:tm;k,n:byte):real;
var
    i,j:byte;
    suma:integeR;
begin
    suma:=0;
    for i:=1 to n do
        suma:=suma+mat[i,k];
    Columna:=suma/n;
end;


{Dado el siguiente procedimiento:} 
Procedure Maximo (Mat:TM; N:Byte; Func:TFunc; var maxk:Byte); 
Var 
    max, prom: real;      
    k: byte; 
Begin 
    max:= Func(Mat, 1, N);   
    maxk:= 1; 
    For k:= 2 to N do 
    Begin 
        prom := Func(Mat, k, N); //devuelve el promedio de fila/columna
        if max < prom then 
        begin 
            max := prom;   
            maxk := k; 
        end; 
    end;   
End;   

{a) Desarrollar las funciones de tipo TFunc y un programa completo (incluir declaraciones, 
directivas al compilador, etc) que utilizándolas calcule para una matriz cuadrada: 
        i. la fila de máximo promedio 
        ii. la columna de máximo promedio 
b) Indicar las modificaciones que serían necesarias para utilizar un tipo procedimiento, en lugar de 
TFunc, muestre los cambios para el punto i. del inciso a) }

var
    maxFila,maxColumna:byte;


begin
    Maximo(mat,n,@fila,maxFila);
    Maximo(mat,n,@Columna,maxColumna);
    //i.
    writeln('fila de maximo promedio: ',maxFila);
    //ii.
    writeln('columna de maximo promedio: ',maxColumna);
end.
