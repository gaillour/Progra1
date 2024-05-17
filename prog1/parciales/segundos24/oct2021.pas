program oct2021;

const
    M=6;
    MAX=10;
type    
    st3=String[3];
    st12=string[12];
    Tr=record
        apellido:St12;
        categoria:st3;
        cant:byte;
        propietario:Boolean;
    end;
    TrC=record
        categoria:st3;
        importe:real;
    end;
    TrP=record
        apellido:st12;
        piso:byte;
    end;
    tm=array[1..MAX,1..M] of Tr;
    tvc=array[1..MAX] of TrC;
    tvp=array[1..MAX] of TrP;

procedure leerCategorias(var vCategorias:tvc;var k:byte);
var
    arch:text;
    blanco,car:char;
begin
    assign(arch,'categorias.txt'); reset(arch);
    k:=0;
    while not eof(Arch) do
    begin   
        k:=k+1;
        read(Arch,vCategorias[k].categoria,blanco);
        repeat
            read(Arch,car);
        until car=' ';
        readln(arch,vCategorias[k].importe);
        
    end;
    close(arch);
end;

procedure leerPisos(var mat:tm;var n:byte;m:byte);
var
    arch:text;
    i,j:byte;
    esPro,blanco:char;
begin
    assign(arch,'depto.txt'); reset(arch);
    readln(arch,n);
    while not eof(arch) do
    begin
        read(Arch,i,j,blanco);
        with mat[i,j] do
        begin
            readln(arch,apellido,categoria,cant,blanco,esPro);
            propietario:=esPro='S';
        end;
    end;
    close(arch);
end;

{Cuántos pisos tienen todos sus departamentos ocupados por más de 2 personas.}
{Verificar si determinado piso tiene todos sus departamentos ocupados con más de 2 personas 
(para el inciso a)}
function masDe2(mat:tm;i,j:byte):boolean;
begin
    if (j=0) then
        masDe2:=True
    else 
    begin
        if mat[i,j].cant>2 then 
            masDe2:=masDe2(mat,i,j-1)
        else masDe2:=false;
    end;
end;
function cantPisos(mat:tm;n,m:byte):byte;
var
    aux,i:byte;
    
begin
    aux:=0;
    for i:=1 to n do
        if masDe2(mat,i,m) then aux:=aux+1;
    cantPisos:=aux;
end;


{Dada una categoría CATEG ingresada por teclado calcular lo que debería abonarse en 
concepto de expensas en un mes para dicha categoría.}
function importe(vCategorias:tvc;k:byte;categ:st3):real;
var
    i:byte;
begin
    i:=1;
    while (i<=k) and (vCategorias[i].categoria<>categ) do
        i:=i+1;
    if vCategorias[i].categoria=categ then
        importe:=vCategorias[i].importe
    else importe:=0;
end;

procedure expensas(mat:tm;i,j,m:byte;categ:st3;imp:real;var tot:real);
begin
    if i>0 then
    begin
        if j>0 then 
        begin
            if mat[i,j].categoria=categ then
            begin
                if mat[i,j].propietario then tot:=tot+imp*0.9
                else tot:=tot+imp;
            end;
            expensas(mat,i,j-1,m,categ,imp,tot);
        end
        else expensas(mat,i-1,m,m,categ,imp,tot);
    end;
end;

procedure propietarios(mat:tm;n,m,user:byte;var vPro:tvp;var l:byte);
var
    i,j:byte;
begin
    l:=0;
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin   
            if (mat[i,j].propietario) and (j=user) then
            begin
                l:=l+1;
                with vPro[l] do
                begin
                    piso:=i;
                    apellido:=mat[i,j].apellido
                end;
            end;
        end;
    end;    
end;


var
    vCategorias:tvc;
    i,j,k,l,n,user:byte;
    mat:tm;
    categ:st3;
    imp,tot:real;
    vPro:tvp;

begin
    leerCategorias(vCategorias,k);
    leerPisos(mat,n,m);

 
    for i:=1 to n do
    begin
        for j:=1 to M do
        begin
            write(mat[i,j].apellido,' ')
        end;
        writeln;
    end;


    writeln('a) cantidad de pisos: ',cantPisos(mat,n,m));

    repeat
        write('ingrese categoria (PRE,STD,ECO): ');
        readln(categ);
        imp:=importe(vCategorias,k,categ);
    until imp>0;

    tot:=0;
    expensas(mat,n,m,m,categ,imp,tot);
    writeln('el total para la categoria ', categ,' fue: ', tot:4:2);


    repeat
        write('ingrese depto: ');
        readln(user);      
    until user<=m;

    propietarios(mat,n,m,user,vPro,l);
    for i:=1 to l do
        writeln(vPro[i].apellido,' ',vPro[i].piso);
end.