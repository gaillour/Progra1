program g5e14;

{Una empresa de autos de alquiler grabó en cada línea del archivo la patente del vehículo (cadena 
de 7) y el total recaudado en el día. Se pide leer los datos en dos arreglos paralelos e informar: 
a) El promedio recaudado por auto. 
b) Las patentes de los vehículos que superaron en la recaudación X pesos (X es dato). 
c) La patente del que recaudó menos}

type
    vpatentes=array[1..10] of string[7];
    vimportes=array[1..10] of real;

procedure leer(var arch:text;var patentes:vpatentes;var importes:vimportes;var n:byte);
var
    pat:string[7];
    imp:real;
begin
    assign(arch, 'patentes.txt');
    reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        readln(arch,pat,imp);
        n:=n+1;
        patentes[n]:=pat;
        importes[n]:=imp;
    end;  
end;

{a) El promedio recaudado por auto.}
procedure prom(var patentes,pcomp:vpatentes;var importes,icomp:vimportes;var n:byte);
var
    i,j,ic,ciguales:byte;
begin

//????
    
end;



var
    arch:text;
    patentes,pcomp:vpatentes;
    importes,icomp:vimportes;
    n,i,j:byte;

begin
leer(arch, patentes, importes,n);
for i:=1 to n do
    writeln(i,': ',patentes[i],' ', importes[i]:4:2,' ');

writeln;

prom(patentes,pcomp,importes,icomp,n);
for j:=1 to n do 
    writeln(j,': ', pcomp[j],' ',icomp[j]:4:2,' ');

end.