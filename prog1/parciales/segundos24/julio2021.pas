program julio2021;

const
    max=15;

type  
    st3=string[3];
    tvs=array[1..MAX] of string;
    tvs3=array[1..MAX] of st3;//guarda el codigo(fila de matriz)
    tm=array[1..MAX,1..MAX] of byte;//contador
    tr=record
        cad:st3;
        descr:string;
    end;
    vtr=array[1..MAX] of tr;
    tvr=array[1..MAX] of real;


procedure guardarTipos(var tipos:tvs;var M:byte);
var
    arch:Text;
    i:byte;
begin
    assign(arch,'tiponoticias.txt'); reset(arch);
    M:=0;
    while not eof(Arch) do
    begin   
        read(arch,i);
        readln(arch,tipos[i]);
        if i>M then M:=i; 
    end;
    close(arch);    
end;




procedure buscaPos(var vcad:tvs3;cad:st3;var i,n:byte);
var
    j:byte;
begin
    j:=1;  //busca en el vector q guarda
    while (j<n) and (vcad[j]<>cad) do
        j:=j+1;
    if vcad[j]=cad then  //i = pos insertar elemento
        i:=j  
    else 
    begin
        n:=n+1;
        i:=n;
        vcad[n]:=cad;
    end;
end;

procedure leer(var mat:tm;var vcad:tvs3;var n:byte;m:byte);
var
    arch:text;
    i:byte;
    cad:st3;
    cod,cant:byte;
begin
    assign(arch,'coberturas.txt'); reset(arch);
    n:=0;
    while not eof(arch) do
    begin
        readln(arch,cad,cod,cant);
        buscaPos(vcad,cad,i,n);
        mat[i,cod]:=mat[i,cod]+cant;        
    end;
    close(arch);
end;

{Cadena de noticias y descripción de noticia que menos notas tuvo.}
function menosNotas(mat:tm;vcad:tvs3;tipos:tvs;n,m:byte):tr;
var
    i,j,imin,jmin,min:byte;
begin
    min:=250;
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            if (mat[i,j]<min) and (mat[i,j]>0) then
            begin
                min:=mat[i,j];
                imin:=i;
                jmin:=j;                
            end;            
        end;
    end;
    menosNotas.cad:=vcad[imin];
    menosNotas.descr:=tipos[jmin];
end;

{Dada un Código de Noticia X, ingresada por teclado, obtener el porcentaje que representa la 
cantidad de notas que cada una de las cadenas de noticias le dedicó a X, sobre el total de 
notas de ese tipo}
procedure porcentaje(mat:tm;vcod:tvs3;x:byte;var porcentajes:tvr;n,m:byte);
var
    sumai,k:byte;
    i:byte;
begin
    sumai:=0;
    for k:=1 to n do
        sumai:=sumai+mat[k,x];
    for i:=1 to n do
        porcentajes[i]:=(mat[i,x]/sumai)*100;
end;

{Almacenar en una estructura adecuada los pares de datos (cadena de noticias y descripción de noticia) 
que tuvieron cobertura. Luego listarlos.}
procedure pares(mat:tm;n,m:byte;vcad:tvs3;tipos:tvs;var vCobertura:vtr;var k:byte);
var
    i,j:byte;
begin
    k:=0;
    for i:=1 to n do
        for j:=1 to m do
            if mat[i,j]>0 then
            begin
                k:=k+1;
                with vCobertura[k] do
                begin
                    cad:=vcad[i];
                    descr:=tipos[j];
                end;
            end;
end;

{Para el inciso a): Calcular cadena de mínima cantidad de 
notas (y tipo a la que corresponde);}
procedure cadenaMinima(mat:tm;i,j,m:byte;var min,imin:byte);
begin
    if i>0 then
    begin
        if j>0 then
        begin
            if mat[i,j]<min then
            begin
                min:=mat[i,j];
                imin:=i
            end;
            cadenaMinima(mat,i,j-1,m,min,imin);
        end
        else cadenaMinima(mat,i-1,m,m,min,imin);
    end;

end;

{Calcular el total de notas para un tipo de notas;}
function total(mat:tm;i,tipo:byte):byte;
begin
    if i=0 then total:=0
    else total:=mat[i,tipo]+total(mat,i-1,tipo)
end;


procedure mostrarmat(mat:tm;vcad:tvs3;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        write(vcad[i],' ');
        for j:=1 to m do
            write(mat[i,j],' ');
        writeln;
    end;
end;

procedure mostrarvec(v:tvs3;n:byte);
var
    i:byte;
begin
    for i:=1 to n do
        writeln(v[i]);
end;

procedure inicializar(var mat:tm);
var
    i,j:byte;
begin
    for i:=1 to Length(mat) do
        for j:=1 to Length(mat) do 
            mat[i,j]:=0;
end;

var
    tipos:tvs;
    i,n,M,tipo,x,k,min,imin:byte;
    mat:tm;
    vcad:tvs3;
    minimo:tr;
    porcentajes:tvr;
    vCobertura:vtr;
begin
    guardarTipos(tipos,M);
    inicializar(mat);
    leer(mat,vcad,n,m);
    mostrarmat(mat,vcad,n,m);
    minimo:=menosNotas(mat,vcad,tipos,n,m);
    writeln('a)',minimo.cad,' ',minimo.descr);

    repeat
        write('ingrese x: ');
        readln(x)
    until x<=n;
    porcentaje(mat,vcad,x,porcentajes,n,m);
    write('b)');
    for i:=1 to n do
        writeln(vcad[i],': ',porcentajes[i]:4:2);

    pares(mat,n,m,vcad,tipos,vCobertura,k);
    for i:=1 to k do
        writeln(vCobertura[i].cad,' ',vCobertura[i].descr);

    min:=250;
    cadenaMinima(mat,n,m,m,min,imin);
    writeln(vcad[imin]);

    tipo:=1;//social
    writeln(total(mat,n,tipo));
end.