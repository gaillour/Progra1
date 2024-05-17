program g6be10b;

{b) Indicar las modificaciones que serían necesarias para utilizar un tipo procedimiento, en lugar de 
TFunc, muestre los cambios para el punto i. del inciso a)}

const  
    n=4;
type
    tm=array[1..n,1..n] of integer;
    tpro=procedure(mat:tm;k,n:byte;var prom:real);

const
    mat:tm=((1,7,4,3),(2,2,5,10),(2,8,5,20),(5,8,10,9));


procedure Fila(mat:tm;k,n:byte;var prom:real);
var
    i:byte;
    suma:integeR;
begin
    suma:=0;
    for i:=1 to n do
        suma:=suma+mat[k,i];
    prom:=suma/n;
end;

procedure Columna(mat:tm;k,n:byte;var prom:real);
var
    i,j:byte;
    suma:integeR;
begin
    suma:=0;
    for i:=1 to n do
        suma:=suma+mat[i,k];
    prom:=suma/n;
end;

Procedure Maximo (Mat:TM; N:Byte; Func:tpro; var maxk:Byte); 
Var 
    max, prom: real;      
    k: byte; 
Begin 
    Func(Mat, 1, N,max);   
    maxk:= 1; 
    For k:= 2 to N do 
    Begin 
        Func(Mat, k, N,prom); //devuelve el promedio de fila/columna
        if max < prom then 
        begin 
            max := prom;   
            maxk := k; 
        end; 
    end;   
End;   


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