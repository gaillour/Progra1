program escribirE1;

{PAQUETES.DAT: 
# CODIGO de PAQUETE  
# PESO 
# CODIGO de DESTINO  (1..30) 
# MONTO ASEGURADO

DESTINO.DAT: 
# CODIGO de DESTINO (1..30, desordenado) 
# DESCRIPCION      (cadena de 15)
}

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

procedure crear1(var A1:TA1);
var
    R:TR1;
    arch:text;
begin
    assign(arch,'PAQUETES.TXT'); reset(arch);
    Rewrite(A1);
    read(arch,R.cDest);
    while (R.cDest<>0) and (R.cDest<=30) do
    begin
        read(arch,R.cPaquete);
        Read(arch,R.peso);
        read(arch,R.monto);
        write(A1,R);readln(arch);
        Read(arch,R.cDest);
    end;
    Close(A1);
    close(arch);
end;

procedure crear2(var A2:TA2);
var
    R:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'DESTINO.TXT'); reset(arch);
    read(arch,R.Cdest);
    while (R.cdest<>0) and (R.cdest<=30) do
    begin
        read(arch,blanco,R.descr);
        Write(A2,R);readln(arch);
        read(arch,R.Cdest);
    end;
    Close(A2);
    close(arch);
end;


var
    A2:TA2;
    A1:TA1;
    r:Char;
begin
    write('queres cambiar el archivo? (S/N) ');readln(r);
    if r='S' then
    begin
        assign(A2,'DESTINO.DAT'); 
        crear2(A2);
        assign(A1,'PAQUETES.DAT'); 
        crear1(A1);
    end;
end.