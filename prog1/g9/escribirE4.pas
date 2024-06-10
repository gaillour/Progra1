program escribirE4;

{# CODIGO de ARTICULO (cadena de 4)             (1er. campo de secuencia, clave secundaria) 
# TALLE ( S, M, L, X)                            (2do. campo de secuencia, clave secundaria) 
# COLOR (1=Negro, 2=Marrón, 3=Azul, 4=Rojo)     (3er. campo de secuencia, clave secundaria) 
# CANTIDAD de PRENDAS 
# PRECIO de COSTO 
    Clave primaria: CODIGO de ARTICULO + TALLE + COLOR}

type 
    st4=string[4];
    TR=record
        cod:st4;
        color,cant:byte;
        precio:real;
        talle:char;
    end;
    TR2=record
        cod:st4;
        color,cant:byte;
        talle:char;
    end;
    TA1=file of TR;
    TA2=file of TR2;

procedure escribir1(var A1:TA1);
var
    R:TR;
    arch:text;
    blanco:char;
begin
    assign(arch,'STOCK.TXT'); reset(arch);
    rewrite(A1);
    readln(arch,R.cod,blanco,R.talle,R.color,R.cant,R.precio);
    while not Eof(arch) do
    begin
        write(A1,R);
        readln(arch,R.cod,blanco,R.talle,R.color,R.cant,R.precio);
    end;
    close(A1) ;   
    close(arch);
end;

procedure escribir2(var A2:TA2);
var
    R2:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'PEDIDO.TXT'); reset(arch);
    readln(arch, R2.cod,blanco,R2.talle,R2.color,R2.cant);
    while not eof(Arch) do
    begin
        write(A2,R2);
        readln(arch, R2.cod,blanco,R2.talle,R2.color,R2.cant);
    end;
    close(A2);
    close(arch);
end;



var
    A1:TA1;
    A2:TA2;
    R1:TR;
    R2:TR2;
begin
    assign(A1,'STOCK.DAT');
    assign(A2,'PEDIDO.DAT');
    escribir1(A1);
    escribir2(A2);
    reset(A2);reset(A1);
    while (not eof(A2)) do
    begin
        Read(a2,R2);
        writeln(R2.cod,' ',R2.talle,' ',R2.color,' ',R2.cant);
    end;
    while (not eof(A1)) do
    begin
        Read(A1,R1);
        writeln(R1.cod,' ',R1.talle,' ',R1.color,' ',R1.cant,' ',R1.precio:4:2);
    end;
    close(A1);close(A2);
end.