program escribirE6;
{
comisión  del  0.5%  sobre  las  ventas  efectuadas
    # LEGAJO (campo de secuencia, clave primaria) 
    # NOMBRE y APELLIDO 
    # TOTAL de VENTAS 
    # NRO de FACTURA  de MAYOR VENTA del MES 
    # IMPORTE de MAYOR VENTA del MES 

    1483 Juan Pérez           5000 F001 1200
    
Al final del día actualiza los registros de ese archivo con las ventas efectuadas almacenadas en 
otro archivo cuyo diseño de registro es: 
  
    # LEGAJO    (campo de secuencia, clave secundaria) 
    # NRO de FACTURA 
    # IMPORTE 
    1483 F016 900
Se pide actualizar el primer archivo y listar las comisiones que le corresponden hasta el momento a 
cada empleado
}

type
    st4=string[4];
    st20=string[20];
    TR1=record
        legajo,factura:st4;
        nombre:st20;
        total, max:real;
    end;
    TA1=file of TR1;

    TR2=record
        legajo,factura:st4;
        imp:real;
    end;
    TA2=file of TR2;

procedure escribir1(var A1:TA1);
var
    R1:TR1;
    arch:text;
    blanco:char;
begin
    Rewrite(A1);
    assign(arch,'LEGAJOS.TXT'); reset(arch);
    readln(arch, R1.legajo,blanco,R1.nombre,blanco,R1.total,blanco,R1.factura,R1.max);
    while not eof(Arch) do
    begin
        write(A1,R1);
        with R1 do
            readln(arch, R1.legajo,blanco,R1.nombre,blanco,R1.total,blanco,R1.factura,R1.max);
    end;
    close(A1);
    close(arch);
end;

procedure escribir2(var A2:TA2);
var
    R2:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'VENTAS.TXT'); reset(arch);
    readln(arch, R2.legajo,blanco,R2.factura,R2.imp);
    while not eof(Arch) do
    begin
        write(A2,R2);
        with R2 do
            readln(arch, R2.legajo,blanco,R2.factura,R2.imp);
    end;
    close(A2);
    close(arch);
end;

var
    A1:TA1;
    A2:TA2;
begin
    assign(A1,'LEGAJOS.DAT');Assign(A2,'VENTAS.DAT');
    escribir1(A1);
    escribir2(A2);

end.