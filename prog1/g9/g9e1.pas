program g9e1;

type
    //PAQUETES
    TR1=record
        cPaquete:word;
        peso,monto:real;
        cDest:byte;
    end;
    TA1=file of TR1;
    //DESTINO
    st15=string[15];
    TR2=record
        cDest:byte;
        descr:st15;
    end;
    TA2=file of TR2;

procedure escribirA1(var A1:TA1);
var
    R:TR1;
begin
    Reset(A1);
    writeln('cDest cPaq     Peso   Monto');
    while not eof(A1) do
    begin
        read(A1,R);
        writeln(R.cDest,'    ',R.cPaquete,'      ',R.peso:4:2,'  ',R.monto:4:2);
    end;
    Close(A1);
end;

procedure escribirA2(var A2:TA2);
var
    R:TR2;
begin
    Reset(A2);
    writeln('COD    Descripcion');
    while not Eof(A2) do
    begin
        read(A2,R);
        writeln(R.cDest,'       ',R.descr);
    end;
    Close(A2);
end;

procedure promedio(var A1:TA1;var prom:real);
var
    R:TR1;
    cant:byte;
begin
    Reset(A1);
    prom:=0;cant:=0;
    while not Eof(A1) do
    begin
        read(A1,R);
        prom:=prom+R.peso;
        cant:=cant+1;
    end;
    Close(A1);
    prom:=prom/cant;
end;


var
    A1:TA1;
    A2:TA2;
    prom:real;

begin
    assign(A2,'DESTINO.DAT');
    escribirA2(A2);
    assign(A1,'PAQUETES.DAT');
    escribirA1(A1);
    promedio(A1,prom);
    writeln('peso promedio: ',prom:4:2);
end.