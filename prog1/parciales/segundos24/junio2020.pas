program junio2020;

const
    N=4;
    M=5;

type
    tm=Array[1..N,1..M] of char;
    col=record
        index:byte;
        porc:real;
    end;
    tv=array[1..M] of col;



procedure leer(var mat:tm;n,m:byte);
var
    suma,i,j:byte;
    arch:text;
    blanco:chaR;
begin
    assign(arch,'mat2020.txt'); reset(arch);
    for i:=1 to n do
    begin
        suma:=0;
        for j:=1 to m do
            read(arch,mat[i,j],blanco);
        readln(arch);
    end;
    close(arch);
end;

procedure armarVector(mat:tm;var vec:tv;n,m:byte);
var
    i,j,suma:byte;
    prom:real;
begin
    for j:=1 to M do
    begin
        suma:=0;
        for i:=1 to N do
            if upCase(mat[i,j])=mat[i,j] then suma:=suma+1;
        prom:=(suma/n)*100;
        vec[j].porc:=prom;
        vec[j].index:=j;
    end;
end;

procedure ordenar(var vec:tv;m:byte);
var 
    min, i, k,iaux: byte;   
    aux: real;
begin
    for k:=1 to m-1 do 
    begin 
        min:=k; 
        for i:=k+1 to m do   
            If  Vec[min].porc>Vec[i].porc then 
                min:= i; 
        If min <> k then 
        begin 
            aux:=Vec[k].porc;    iaux:=vec[k].index;
            Vec[k].porc:=Vec[min].porc;     vec[k].index:=vec[min].index;
            Vec[min].porc:=aux;     vec[min].index:=iaux;
        end;
    end;
end;

procedure mostrarTop3(vec:tv;m:byte);
var
    j:byte;
begin
    writeln('top 3: ');
    for j:=m downto m-2 do writeln(vec[j].index,': ',vec[j].porc:4:2,' ');
end;

procedure mostrarArreglo(vec:tv;i:byte);
begin
    if i>=1 then
    begin
        writeln(vec[i].index,' ',vec[i].porc:4:2);
        mostrarArreglo(vec,i-1);
    end;
end;

function cantmayus(mat:tm;i,j:byte;var cm:byte):byte;
begin
    if i>=1 then
    begin
        if mat[i,j]=upcase(mat[i,j]) then
            cm:=cm+1;
        cantmayus(mat,i-1,j,cm);    
    end;
end;

var
    mat:tm;
    vec:tv;
    i,cm:byte;
begin
    leer(mat,n,m);

    armarVector(mat,vec,n,m);
    ordenar(vec,m);
    mostrarTop3(vec,m);

    writeln('arreglo: ');
    mostrarArreglo(vec,m);

    cm:=0;
    cantmayus(mat,n,3,cm);
    writeln(cm);
end.