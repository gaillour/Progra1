program g9e6;


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




{comisión  del  0.5%  sobre  las  ventas  efectuadas}
procedure actualizar(var A1:TA1;var A2:TA2;nombre:string);
var
    R1:TR1;
    R2:TR2;
    temp:TA1;
begin
    {1483 Juan Pérez       tot=5000 F001 1200=max
     1483                           F016 900=imp}
    reset(A2);reset(A1);
    assign(temp,'TEMP.DAT');
    Rewrite(temp);
    read(A1,R1);read(A2,R2);
    while (not eof(A1)) or (not eof(A2))do
    begin
        if R1.legajo<R2.legajo then
        begin
            writeln(R1.legajo,' $',(R1.total)*0.005:4:2);
            write(temp,R1);read(A1,R1);
        end
        else
        begin
            if R1.legajo>R2.legajo then
            begin
                read(A2,R2);
            end
            else
            begin
                if R2.imp>R1.max then
                begin
                    R1.factura:=R2.factura;
                    R1.max:=R2.imp
                end;
                R1.total:=R1.total+R2.imp;
                read(A2,R2);
            end;
        end;
    end;
    write(temp,R1);//centinela
    close(A1);close(A2);close(temp);   
    Erase(A1);
    Rename(temp,Nombre);
end;

var
    A1:TA1;
    A2:TA2;
begin   
    assign(A1,'LEGAJOS.DAT');reset(A1);
    assign(A2,'VENTAS.DAT');reset(A2);
    actualizar(A1,A2,'LEGAJOS.DAT');
end.