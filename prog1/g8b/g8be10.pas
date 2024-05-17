program g8be10;

{Dado dos arreglos de enteros A y B ordenados ascendentemente, realizar un algoritmo 
recursivo que mezcle ambos arreglos en otro C manteniendo el orden. Cada arreglo no tiene
valores repetidos. Si un valor aparece en ambos arreglos, debe pasar a C uno solo}


const   
    N=10;
type
    tv=array[1..N] of byte;
    tvC=array[1..N*2] of byte;

const
    a:tv=(1,2,3,5,6,7,8,9,11,13);
    b:tv=(1,4,5,6,7,8,10,12,14,15);

procedure insertar(a,b:tv;var c:tvc;var k:byte;n,i,j:byte);
begin
    if (i<=n) and (j<=n) then
    begin
        if a[i]>b[j] then
        begin
            k:=k+1;
            c[k]:=b[j];
            insertar(a,b,c,k,n,i,j+1);
        end
        else if a[i]=b[j] then
        begin
            k:=k+1;
            c[k]:=a[i];
            insertar(a,b,c,k,n,i+1,j+1);
        end
        else    
        begin
            k:=k+1;
            c[k]:=a[i];
            insertar(a,b,c,k,n,i+1,j);
        end;        
    end;
end;



var
    c:tvc;
    k,i:byte;
begin
    insertar(a,b,c,k,n,1,1);
    for i:=1 to k do
        writeln(c[i])


end.