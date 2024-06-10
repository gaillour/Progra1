program g9e8;

{4)Una fábrica de camperas tiene organizado su stock de la siguiente manera en un archivo de tipo: 
# CODIGO de ARTICULO (cadena de 4)             (1er. campo de secuencia, clave secundaria) 
# TALLE ( S, M, L, X)                      (2do. campo de secuencia, clave secundaria) 
# COLOR (1=Negro, 2=Marrón, 3=Azul, 4=Rojo) (3er. campo de secuencia, clave secundaria) 
# CANTIDAD de PRENDAS 
# PRECIO de COSTO 
    Clave primaria: CODIGO de ARTICULO + TALLE + COLOR 
 
Se desea obtener el siguiente listado: 
Stock de Prendas 
Código: XXXX 
   Talle        Cantidad      Precio Costo  
  X          999         $ 99999.99 
   . . .                       . . .                          . . . 
Código: XXXX 
. . . 
Cantidad Total:  9999   
Porcentaje de Prendas Negras: 99.99 % 

8)La fábrica de Camperas (descripta en el ejercicio 4) debe satisfacer un pedido de un 
cliente, y cuenta con la siguiente información: 
# ARTICULO               (1er. campo de secuencia, clave secundaria) 
# TALLE                      (2do. campo de secuencia) 
# COLOR                    (3er. campo de secuencia) 
# CANTIDAD 
       ARTICULO + TALLE + COLOR es Clave primaria 
       ARTICULO + TALLE es Clave secundaria 
Por cada pedido se pide actualizar el stock, en caso de no poder entregar lo posible e 
informar la cantidad adeudada}

type 
    st4=string[4];
    TR1=record
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
    TA1=file of TR1;
    TA2=file of TR2;

procedure actualizar(var A1:TA1;var A2:TA2;nombre:string);
var
    R1,R3:TR1;
    R2:TR2;
    temp:TA1;
begin
    reset(A1);reset(A2);
    assign(temp,'TEMP.DAT');rewrite(temp);
    read(A1,R1);read(A2,R2);
    R3.cant:=0;
    while (not eof(A1)) or (not eof(A2)) and (R1.cod<>'ZZZZ')and (R2.cod<>'ZZZZ')do
    begin
        if (R1.cod=R2.cod) and (R1.talle=R2.talle) then
        begin
            while (R1.cod=R2.cod) and (R1.talle=R2.talle) do
            begin
                if (R1.color=R2.color) and (R1.cant-R2.cant>=0) then
                begin
                    R1.cant:=R1.cant-R2.cant;
                    R3:=R1;
                    write(temp,R3);
                end
                else writeln(R2.cod,' faltaron ',(R1.cant-R2.cant)*(-1),' unidades de talle ',R2.talle);
                read(A2,R2);
            end;
            read(A1,R1);
        end
        else
        begin
            if R1.cod<R2.cod then
            begin
                write(temp,R1);
                read(A1,R1);
            end
            else read(A2,R2)
        end;
    end;
    write(temp,R1);write(A2,R2);
    Close(A1);close(A2);close(temp);
    erase(A1);
    rename(temp,nombre);
end;


var
    A1:TA1;
    A2:TA2;
    nombre:string;
begin
    nombre:='STOCK.DAT';
    assign(A1,'STOCK.DAT');assign(A2,'PEDIDO.DAT');
    actualizar(A1,A2,nombre);

end.