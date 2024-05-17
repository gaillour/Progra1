program g7e5;

{Ingresar N y M y luego los elementos no nulos de una matriz rala por filas 
(i, j, valor) y almacenar en un arreglo de registros.
a) Mostrar en formato matricial completando los ceros faltantes.
b) Si es cuadrada, modificarla para obtener la traspuesta}

type
    matriz=record
        i:byte;
        j:byte;
        valor:byte;
    end;
    tv=array[1..10] of matriz;

procedure leer(var vec:tv;var n,m,tot:byte);
var 
    arch:text;
begin   
    assign(arch,'rala.txt'); reset(arch);
    tot:=0;
    readln(arch,n,m);
    while not eof(arch) do
    begin
        tot:=tot+1;
        with vec[tot] do
        begin
            readln(arch,i,j,valor);          
        end;
    end;
end;    



//a) 
procedure mostrar(var vec:tv;var n,m,tot:byte);
var 
    i,j,k:byte;

begin

    for i:=1 to n do 
    begin
        for j:=1 to m do
        begin
            k:=1;
            while (k<=tot) and (vec[k].i<>i) or (vec[k].j<>j) do
                k:=k+1;
            if (vec[k].i<>i) or (vec[k].j<>j) then
                write(vec[k].valor)
            else write('0');
        end;
        writeln()
    end;
end;


//b) 
//no es cuadrada
var
    vec:tv;
    n,m,tot:byte;
begin
leer(vec,n,m,tot);
mostrar(vec,n,m,tot);

end.