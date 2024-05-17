program mayo2022;

const
    MAX=20;
    N=9;
type
    st2=string[2];
    tvs2=array[1..MAX] of st2;
    Tr=record
        provincia:st2;
        rango:byte;
    end;
    tm=array[1..N,1..MAX] of byte;
    tvR=array[1..MAX] of Tr;

procedure leerProvincias(var vProv:tvs2;var m:byte);
var
    arch:text;
begin
    assign(arch,'provincias.txt'); reset(arch);
    m:=0;
    while not eof(arch) do
    begin
        m:=m+1;
        readln(Arch,vProv[m]);
    end;
    close(arch);
end;

function buscaProv(vProv:tvs2;provincia:st2;i:byte):byte;
begin
    if (i>0) then
    begin
        if (vProv[i]=Provincia) then
            buscaProv:=i
        else buscaProv:=buscaProv(vProv,provincia,i-1);
    end
    else buscaProv:=0;
end;

procedure leerRangos(var mat:tm;vProv:tvs2;m:byte);
var
    arch:text;
    dni:string[8];
    provincia:st2;
    i,j,edad:byte;
    blanco:char;
begin
    assign(arch,'inscriptos.txt'); reset(arch);
    while not eof(arch) do 
    begin
        readln(arch,dni,edad,blanco,provincia);
        i:=trunc(edad/10);
        j:=buscaProv(vProv,provincia,m);
        mat[i,j]:=mat[i,j]+1;
    end;    
    close(arch);
end;

{Dado un código de provincia X, ingresado por teclado (puede no existir), cantidad de rangos 
etarios sin inscriptos en X}
function cantSinscriptos(mat:tm;n,j:byte):byte;
var
    i,aux:byte;
begin
    aux:=0;
    for i:=1 to n do
        if mat[i,j]=0 then aux:=aux+1;
    cantSinscriptos:=aux;
end;

{La provincia con menos cantidad total de inscriptos en los rangos etarios ubicados entre el rango
R y el rango T (R <= T) ingresados por teclado (se ingresa la edad de inicio del rango: 
por ej. 30 para el rango 30-39). Si hubiera más de una, mostrar la primera}
function menosInscriptos(mat:tm;n,m,r,t:byte):byte;
var
    i,j,min,jmin:byte;
begin  
    min:=250;
    for i:=r to t do
    begin
        for j:=1 to m do
        begin
            if mat[i,j]<min then
            begin
                min:=mat[i,j];
                jmin:=j;
            end;
        end;
    end;
    menosInscriptos:=jmin;
end;

{Generar un arreglo con los pares provincia-rango etario (poner en el arreglo, para el rango, 
la edad de inicio) que superen el 10% del total de inscriptos en la carrera. Luego mostrar el arreglo generado}
{Calcular el total de inscriptos (para el inciso c)}
function totalInscriptos(mat:tm;i,j,m:byte):word;
begin
    if i>0 then
    begin
        if j>0 then
            totalInscriptos:=mat[i,j]+totalInscriptos(mat,i,j-1,m)
        else totalInscriptos:=totalInscriptos(mat,i-1,m,m);
    end
    else totalInscriptos:=0
end;

procedure generarArreglo(mat:tm;vProv:tvs2;n,m:byte;porc:real;var vPares:tvR;var k:byte);
var
    i,j:byte;
begin
    k:=0;
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            if mat[i,j]>porc then
            begin
                k:=k+1;
                vPares[k].provincia:=vProv[j];
                vPares[k].rango:=i;
            end;
        end;
    end;
    
end;

procedure mostrarprovincias(vProv:tvs2;m:byte);
var
    i:byte;
begin
    for i:=1 to m do
        write(vProv[i],' ');
    WriteLn;
end;
procedure inicializar(var mat:tm;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
        for j:=1 to m do 
            mat[i,j]:=0;
end;
procedure mostrarmat(mat:tm;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to m do
            write(mat[i,j],'  ');
        writeln;
    end;
end;



var
    vProv:tvs2;
    i,j,k,jmin,m,R,T:byte;
    mat:tm;
    x:st2;
    porc:real;
    vPares:tvR;
begin
    leerProvincias(vProv,m);
    inicializar(mat,n,m);
    leerRangos(mat,vProv,m);
    mostrarprovincias(vProv,m);
    mostrarmat(mat,n,m);

    write('ingrese provincia ');readln(x);
    j:=buscaProv(vProv,x,m);
    if j>0 then write('cantidad de rangos s/inscriptos: ',cantSinscriptos(mat,n,j))
    else writeln('no se encontro ',x);
    writeln();

    repeat
        write('ingrese rango: [R,T] R:');readln(R);
        write('T: ');readln(t);
        r:=trunc(R/10);
        t:=trunc(T/10);
    until r<=t;
    jmin:=menosInscriptos(mat,n,m,r,t);
    writeln(jmin);
    writeln('Provincia con menos inscriptos en el rango [',r,',',t,']: ', vProv[jmin]);

    porc:=totalInscriptos(mat,n,m,m)*0.1;  
    generarArreglo(mat,vProv,n,m,porc,vPares,k);  
    for i:=1 to k do
    begin
        writeln(vPares[i].provincia,' ',vPares[i].rango);
    end;
    
end.