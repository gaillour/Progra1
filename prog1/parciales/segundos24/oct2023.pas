program oct2023;

const
    N=10;
    MAX=30;

type
    st10=string[10];
    Tr=record
        tipo:st10;
        precio:real;
    end;
    tv=array[1..MAX] of Tr;
    tm=array[1..N,1..MAX] of real;
    tvr=array[1..N] of real;

procedure leerTipos(var Vtipos:tv;var m:byte);
var
    arch:text;
begin
    assign(arch,'cereales.txt'); reset(arch);
    m:=0;
    while not eof(arch) do  
    begin
        m:=m+1;
        with Vtipos[m] do
        begin
            readln(arch,tipo,precio);
            writeln(tipo,precio:4:2)
        end;
    end;
    close(arch);
end;

function buscaCereal(Vtipos:tv;C:st10;m:byte):byte;
var
    i:byte;
    
begin
    i:=1;
    while (i<m) and (Vtipos[i].tipo<>C) do 
        i:=i+1;
    if Vtipos[i].tipo=c then buscaCereal:=i
    else buscaCereal:=0;
end;

procedure crearMat(var mat:tm;Vtipos:tv;n,m:byte);
var
    i,j:byte;
    tipo:st10;
    arch:text;
    car:char;
begin
    assign(arch,'exportaciones.txt'); reset(arch);
    while not eof(arch) do
    begin
        read(arch,i,car,tipo);
        j:=buscaCereal(Vtipos,tipo,m);
        writeln(i,j,tipo);
        readln(arch,mat[i,j]);
    end;
    close(arch);
end;

function cantSilos(mat:tm;n,m,j:byte):byte;
var 
    i,aux:byte;
begin
    aux:=0;
    for i:=1 to n do
    begin
        if mat[i,j]>0 then aux:=aux+1;
    end;
    cantSilos:=aux;
end;

procedure total(var tot:real);
begin
    tot:=tot*360;
    if tot>10000 then tot:=tot*1.25
    else tot:=tot*0.95
end;

procedure superanZ(mat:tm;n,m:byte;Vtipo:tv;z:real;var Vtot:tvr;var k:byte);
var
    tot,sum:real;
    i,j:byte;
begin
    for i:=1 to n do
    begin
        tot:=0;sum:=0;
        for j:=1 to m do
        begin
            sum:=sum+mat[i,j];
            tot:=tot+mat[i,j]*Vtipo[j].precio
        end;
        if sum>z then
        begin
            k:=k+1;
            total(tot);
            Vtot[k]:=tot;
        end;
    end;
end;

procedure mostrarmat(mat:tm;n,m:byte);
var
    i,j:byte;
begin
    for i:=1 to n do
    begin
        for j:=1 to m do
            write(mat[i,j]:4:2,' ');
        writeln;
    end;
end;


var
    Vtipos:tv;
    C:st10;
    mat:tm;
    cant,i,j,k,m:byte;
    z:real;
    Vtot:tvr;

begin
    leerTipos(Vtipos,m);
    crearMat(mat,Vtipos,n,m);
    mostrarmat(mat,n,m);

    write('ingrese Cereal: ');readln(c);
    j:=buscaCereal(Vtipos,c,m);
    cant:=cantSilos(mat,n,m,j);
    if cant>0 then writeln('cantidad: ',cant)
    else writeln('ninguno');

    write('ingrese z: ');readln(z);
    superanZ(mat,n,m,Vtipos,z,Vtot,k);
    for i:=1 to k do
        writeln(i,': ',vtot[i]:4:2);
end.