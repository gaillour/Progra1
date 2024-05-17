program g7be5;

{Ingresar N y M y luego los elementos no nulos de una matriz rala por filas (i, j, valor) 
y almacenar en un arreglo de registros.  
a) Mostrar en formato matricial completando los ceros faltantes. 
b) Si es cuadrada, modificarla para obtener la traspuesta.}

const
    max=40;
type
    TrE=record
        i,j,val:byte;
    end;
    tv=array[1..max] of TrE;

procedure leer(var vec:tv;var n,m,cont:byte);
var
    arch:Text;
begin
    assign(arch,'e5.txt'); reset(arch);
    readln(arch,n,m);
    cont:=0;
    while not eof(arch) do  
    begin   
        cont:=cont+1;
        with vec[cont] do
            readln(arch,i,j,val);
    end;
    close(arch);
end;


procedure Mostrar(vec:tv;n,m,cont:byte);
var
    a,b,c:byte;
begin
    for a:=1 to n do
    begin
        for b:=1 to m do
        begin
            c:=1;
            while (c<cont) and (vec[c].i<>a) and (vec[c].j<>b) do
                c:=c+1;
            with vec[c] do
            begin
                if (i=a) and (j=b) then write(val,' ')
                else write('0 ');
            end;
        end;
        writeln;
    end;
end;

procedure traspuesta(vec:tv;var tras:tv;n,cont:byte);
var
    k:byte;
begin
    for k:=1 to cont do
    begin
        with tras[k] do 
        begin
            i:=vec[k].j;
            j:=vec[k].i;
            val:=vec[k].val;
        end;
    end;
end;


var
    vec,tras:tv;
    n,m,cont:byte;

begin
    leer(vec,n,m,cont);
    Mostrar(vec,n,m,cont);writeln;
    writeln('traspuesta');writeln;
    if n=m then
    begin
        traspuesta(vec,tras,n,cont);Mostrar(tras,n,n,cont);writeln;
    end;
end.