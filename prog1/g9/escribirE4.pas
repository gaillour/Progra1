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
    TA1=file of TR;

procedure leer(var A1:TA1);
var
    R:TR;
    arch:text;
    blanco:char;
begin
    assign(arch,'STOCK.TXT'); reset(arch);
    rewrite(A1);
    while not Eof(arch) do
    begin
        with R do
            readln(arch,cod,blanco,talle,color,cant,precio);
        write(A1,R);
    end;
    close(A1) ;   
    close(arch);
end;

var
    A1:TA1;
    R:TR;
begin
    assign(A1,'STOCK.DAT');
    leer(A1);
end.