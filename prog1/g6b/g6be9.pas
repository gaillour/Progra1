program g6be9;

{Sean  T1  y  T2  dos  matrices  de  NxN  que  representan  las  fichas  (rojas,  azules)  de  un 
tablero,  la primera  almacena  el  caracter  ‘R’  ó  ‘A’  y  la  segunda  enteros  
(cantidad  de  fichas).  Se  pide  calcular  e informar: 
    a) Color predominante (presente en más casillas) 
    b) Color con más fichas 
    c) Cantidad de columnas de un solo color }

const
    N=4;
type
    tmb=array[1..N,1..N] of byte;
    tmc=array[1..N,1..N] of char;

{1 7 4 3 
 2 2 5 10 
 2 8 5 20 
 5 8 10 9}
const
    T1:tmc=(('A','R','R','A'),('R','R','R','A'),('R','R','A','A'),('R','R','A','R'));
    T2:tmb=((1,7,4,3),(2,2,5,10),(2,8,5,20),(5,8,10,9));

function colorPredominante(mat:tmc;n:byte):char;
var
    i,j,a,r:byte;
begin   
    a:=0;r:=0;
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            if mat[i,j]='A' then a:=a+1
            else r:=r+1;            
        end;
    end;
    if a>r then colorPredominante:='A' 
    else colorPredominante:='R';    
end;

function masFichas(matc:tmc;matb:tmb;n:byte):char;
var
    i,j:byte;
    ca,cr:word;
begin
    ca:=0;cr:=0;
    for i:=1 to N do
    begin
        for j:=1 to N do
        begin
            if matc[i,j]='A' then ca:=ca+matb[i,j]
            else cr:=cr+matb[i,j]            
        end;
    end;
    if ca>cr then masFichas:='A'
    else masFichas:='R';
end;

function cantColumnas(mat:tmc;n:byte):byte;
var
    i,j,aux:byte;
    car:char;
begin
    aux:=0;
    for j:=1 to n do
    begin
        i:=1;
        car:=mat[i,j];
        while (i<n) and (mat[i,j]=car) do
            i:=i+1;
        if mat[i,j]=car then aux:=aux+1;
    end;
    cantColumnas:=aux;
end;


begin
    writeln('color predominante: ', colorPredominante(T1,N));
    writeln('color con mas fichas: ', masFichas(T1,T2,n));
    writeln('columnas de un solo color: ',cantColumnas(T1,n));
end.