program notas;

{1.  Arreglos bidimensionales o Matrices. Declaración del tipo. 
2.  Lectura, escritura operaciones sobre matrices. Ejemplos 
3.  Matrices cuadradas. Diagonal principal y secundaria. Matriz triangular, simétrica}

{--------------------------------------------------------------------------------------------}
//1.
{1.1.Declaración del tipo}
type
    TipoMatriz =  array [1..3, 1..4]   of   integer;
    {identificador}     {tipos de indices}  {tipo base}
    TipoVector = array[1..4] of integer;

const
    V:TipoVector=(1,2,3,4);

{------------------------------------------------------------------------------------------}
//2.
{2. Lectura, escritura operaciones sobre matrices.  
2.1. Lectura por filas, por columnas, desordenada}
Procedure LeeMatrizxCol(Var Mat: TipoMatriz; Var N, M :byte); 
Var  
 i, j: byte; 
Begin 
    Write ('Ingrese cantidad de filas: '); Readln(N); 
    Write ('Ingrese cantidad de columnas: '); Readln(M); 
    For j:= 1 to M do 
        For i:= 1 to N do 
        Begin 
            Write('fila, columna ', I:3, j:3,': ');  Readln(Mat[i, j]); 
        end 
end;

//para ingresarlos desordenados, se inicializa la matriz en cero
Procedure IniciaMatriz (Var Mat:TipoMatriz; N,M:byte); 
{Nota:  una matriz iniciada en cero, puede utilizarse como un conjunto de contadores o 
acumuladores (índice con significado}
Var  
 i, j: byte; 
begin 
    For j:= 1 to Length(mat) do 
        For i:= 1 to Length(mat) do 
            Mat[i, j]:=0; 
end;

Procedure LeeMatrizDesordenados (Var  Mat: TipoMatriz;var o,p:byte); 
Var  
 i, j: byte; 
begin 
    o:=0;p:=0;
    write('Ingrese fila,0= fin de ingreso'); Readln(i); 
    While i <> 0 do 
        Begin 
            if i>o then o:=i;
            Readln(j); 
            if j>p then p:=j;
            Readln(Mat[i,j]); 
            write('Ingrese fila,0= fin de ingreso'); Readln(i); 
        End; 
End; 


{2.2. Escritura en formato matricial} 
Procedure EscribeMatriz (Mat: TipoMatriz; N,M : Byte);   {en forma matricial} 
Var  
    i, j: byte; 
Begin 
    For i:= 1 to N do 
    Begin  
        For J:= 1 to M do 
            Write(Mat[i, j]: 4); 
        Writeln; 
    end 
end;

{2.3.Calcular el elemento mínimo de una matriz}  
Function Minimo(Mat: TipoMatriz; N,M: byte): integer; 
Var 
    i,j: byte;    
    Min: integer; 
Begin 
    Min:= Mat[1,1]; 
    For i := 1 to N do 
        For j:= 1 to M do  
            If Min > Mat[i,j] Then 
                Min:= Mat[I,j]; 
    Minimo:= Min; 
End;

{2.4. minimo de una fila}
Function MinFila(Mat:TipoMatriz; i, M:Byte):integer; {recorre la fila i con j entre 1 y M} 
Var 
    j:Byte;       
    Min: integer; 
Begin     
    Min:= Mat[i,1];   
    For j:= 2 to M do  
        If Min > Mat[i,j] then 
            Min:=Mat[i,j]; 
    MinFila:=Min; 
End;

{2.4.1.Utilizando la función generar un arreglo VMin de N elementos, que contenga el 
mínimo de cada fila.}
Procedure VectorMinimos (Mat: TipoMatriz; N,M: byte; Var Vmin: TipoVector); 
Var 
  i:byte; 
begin 
    For i := 1 to N do 
        VMin[i] := MinFila(Mat, i , M);    
End;

{2.5. A partir de la matriz y de un vector de M elementos reales,  calcular cuantas filas 
coinciden con el vector. } 
Function CuantosCoinciden (Mat: TipoMatriz; N,M: byte; Vec: TipoVector):byte; 
Var 
  Cont, i, j :byte; 
begin 
    Cont:=0; 
    For i := 1 to N do 
    Begin 
        j:= 1 ; 
        while (j<M) and  (Vec[j] = Mat[ i , j]) do 
            j:= j + 1; 
        If Vec[j] = Mat[ i , j] then 
            Cont:= Cont + 1; 
    End;
    CuantosCoinciden:= Cont;   
End;

procedure mostrarvec(vmin:TipoVector;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(vmin[i]);
end;

{------------------------------------------------------------------------------------------------------------}
//3. Matrices cuadradas de NxN
{
      diagonal principal formada por los elementos A[i , i] con i = 1..N 
      diagonal secundaria formada por los elementos A[i , N – i +1] con i = 1..N 
      triangular inferior    los elementos A[i , j] = 0,  con i = 2..N  y  j < i
}


Type 
    TM= array[1..3,1..3] of real; 

const
    A:TM=((1,2,3),(-1,2,4),(2,-3,3));
    B=3;
 
 

{3.1.Calcular la suma de la diagonal principal (traza) }
Function SumaDiagonal (A: TM; N: byte):real; 
Var 
  i :byte; 
  Sum:real; 
Begin 
    Sum:= 0; 
    For i := 1 to N do 
        Sum:=Sum + A[i, i]; 
    SumaDiagonal:= Sum; 
End;

{3.2.Contar la cantidad de elementos negativos debajo de la diagonal}
Function CuentaNegativos (A: TM; N: byte):real; 
Var 
  Cont, i,j :byte; 
Begin 
    Cont:= 0; 
    For i := 2 to N do 
        For j := 1 to i - 1 do 
            If A[i, j] < 0 then 
                Cont:=Cont + 1; 
    CuentaNegativos:= Cont; 
End; 

Procedure EscribeMatrizCuadrada (Mat: TM; N: Byte);   {en forma matricial} 
Var  
 i, j: byte; 
Begin 
    For i:= 1 to N do 
    Begin  
        For J:= 1 to N do 
            Write(Mat[i, j]:4:2,' '); 
        Writeln; 
    end 
end;

var 
    Mat,matb:TipoMatriz;{1 y 2}
    n,m,o,p,i:byte;
    vmin:TipoVector;
begin
    LeeMatrizxCol(Mat,n,m);
    IniciaMatriz(matb,o,p);
    LeeMatrizDesordenados(matb,o,p);
    EscribeMatriz(mat,n,m);
    writeln;
    EscribeMatriz(matb,o,p);
    writeln('minimo: ', Minimo(mat,n,m));
    writeln('minimo de la fila ',2,' ',(MinFila(mat,2,m)));
    VectorMinimos(mat,n,m,vmin);
    mostrarvec(vmin,n);
    Write('coinciden: ',CuantosCoinciden(mat,n,m,V));
    WriteLn;

    //3.
    writeln;
    writeln('A: ');
    EscribeMatrizCuadrada(A,b);
    writeln('suma de la diagonal: ',SumaDiagonal(A,b):4:2);
    writeln('cantidad de negativos debajo de la diagonal: ',CuentaNegativos(A,b):4:2)




end.