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
begin
    Rewrite(A1);
    write('cDest: ');readln(R.cDest);
    while (R.cDest<>0) and (R.cDest<=30) do
    begin
        write('cPaquete: ');readln(R.cPaquete);
        Write('peso: ');ReadLn(R.peso);
        Write('moto: ');readln(R.monto);
        write(A1,R);
        write('cDest: ');ReadLn(R.cDest);
    end;
    Close(A1);
end;

procedure crear2(var A2:TA2);
var
    R:TR2;
begin
    Rewrite(A2);
    write('ingrese codigo: ');readln(R.Cdest);
    while (R.cdest<>0) and (R.cdest<=30) do
    begin
        write('ingrese descripcion ');readln(R.descr);
        Write(A2,R);
        write('ingrese codigo: ');readln(R.Cdest);
    end;
    Close(A2);
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