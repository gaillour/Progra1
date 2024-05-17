program g5e10;

{Dado  un  arreglo  A,  generar  dos  arreglos  paralelos  B  y  C  donde  B  contiene  la  suma  de  los 
elementos de A que están entre dos negativos y C la cantidad que se sumó. Mostrar B y C. 
Ejemplo: 
A=(3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2)  B=(13, 12, 0, 17)  C=(3, 2, 0, 3)}

type
    vec=array[1..17] of integer;
    v=array[1..8] of integer;

const
    a:vec=(3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2);

procedure suma(var a:vec;var b,c:v);
var 
    i,j,icb:byte;
    sum,cont:integer;

begin
    i:=0; 
    icb:=0;    //indice de c y b
    while i<length(a) do
    begin
        i:=i+1;
        if a[i]<0 then
        begin
            sum:=0; cont:=0;
            j:=i+1;
            while (a[j]>0) and (j<Length(a)) do
            begin
                sum:=sum+a[j];
                cont:=cont+1;
                j:=j+1;
            end;
            if ((a[Length(a)]<0) and (j=Length(a))) or (j<Length(a)) then   //si es el ult fijarse si es <0 
            begin
                icb:=icb+1;
                b[icb]:=sum;
                c[icb]:=cont;
                i:=j-1;
            end;
        end;            
    end;  
end;

var
    b,c:v;
    i,j:byte;

begin
suma(a,b,c);
write('b: ');
for i:=1 to Length(b) do 
    write(b[i],' ');
writeln;
write('c: ');
for j:=1 to Length(c) do
    write(c[j], ' ');
end.