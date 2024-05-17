program g6be2;

{En un archivo se almacenó el Nombre del alumno y la nota de los K parciales, pasar los datos a
un vector Nbre paralelo a la matriz Notas e informar: 
    a) Listado de los alumnos que aprobaron los K parciales. 
    b) Por cada alumno determinar su situación: 
         Promociona: si el promedio es >= 7 
         Habilita: si promedio >= 5 y < 7; y la K-ésima nota >= 5  
         Desaprobado: en otro caso 
Generar un arreglo con los nombres de aquellos que promocionaron.
}

const 
    max=50;
    k=3;
type 
    tvs=array[1..max] of string;
    tmr=array[1..max,1..3] of real;
    tvc=array[1..max] of char;

procedure leer(var vnom:tvs;var mat:tmr;var n:byte);
var
    arch:text;
    car:char;
    nom:string;
    j:byte;
begin
    assign(arch,'e2.txt'); reset(arch);
    n:=0;
    while not Eof(arch) do 
    begin
        n:=n+1;nom:='';
        read(Arch,car);
        while car<>' ' do
        begin
            nom:=nom+car;            
            Read(arch,car);
        end;
        vnom[n]:=nom;
        for j:=1 to k do
            read(Arch,mat[n,j]);
    end;
    close(arch);
end;

procedure listado(vnom:tvs;mat:tmr;n:byte;var kparciales:tvs;var m:byte);
var
    i,j:byte;
begin   
    m:=0;
    for i:=1 to n do
    begin
        j:=1;
        while (j<k) and (mat[i,j]>=5) do
            j:=j+1;
        if  mat[i,j]>=5 then
        begin
            m:=m+1;
            kparciales[m]:=vnom[i];
        end;
    end;    
end;

function situacion(prom:real):char;
begin
    if prom>=7 then
        situacion:='P'
    else if (prom>=5) and (prom<7) then
        situacion:='H'
    else 
        situacion:='D'
end;

procedure promedios(vnom:tvS;mat:tmr;n:byte;var vsit:tvc;var promocionados:tvs;var p:byte);
var
    j,i:byte;
    suma,prom:real;
begin
    for i:=1 to n do
    begin
        suma:=0;
        for j:=1 to k do
            suma:=suma+mat[i,j];  
        prom:=suma/k;
        if situacion(prom)='P' then
        begin
            p:=p+1;
            promocionados[p]:=vnom[i];
        end;
        vsit[i]:=situacion(prom);
    end;    
end;

procedure mostrartodo(vnom:tvs;mat:tmr;vsit:tvc;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        write(vnom[i],': ');
        for j:=1 to m do
            write(mat[i,j]:4:2,' ');
        write(vsit[i])
    end;
end;

procedure mostrarvec(v:tvs;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        write(v[i]);
end;
procedure mostrarvecchar(v:tvc;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;

var
    vnom,kparciales,promocionados:tvs;
    mat:tmr;
    n,m,p:byte;
    vsit:tvc;
begin
    leer(vnom,mat,n);
    listado(vnom,mat,n,kparciales,m);
    promedios(vnom,mat,n,vsit,promocionados,p);
    writeln;
    mostrartodo(vnom,mat,vsit,n,k);
    WriteLn;writeln;
    write('aprobaron los ',k,' parciales: ');
    mostrarvec(kparciales,m);
    writeln;writeln;
    Write('promocionaron: ');
    mostrarvec(promocionados,p);
    WriteLn;WriteLn

end.