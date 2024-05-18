program g9e3;
{Una empresa de turismo ofrece a sus clientes distintas excursiones a los distintos puntos 
de interés de la ciudad (paseo a las Sierras, a la Laguna, City Tour, viaje en barco, etc.): 
# CODIGO de EXCURSIÓN (cadena de 3, no hay más de 50) clave pri
# DESCRIPCION (cadena de 15) 
# PRECIO BASE 
# PRECIO de la COMIDA 

Por otro lado se tiene un archivo BOLETERIA.DAT con el registro de los boletos vendidos con los 
siguientes datos: 
# CODIGO de EXCURSION  (cadena de 3, campo de secuencia, clave secundaria) 
# NRO de BOLETO     clave pri
# INCLUYE COMIDA (S/N) 

Se desea realizar el siguiente listado:  
Excursión  Cantidad de Boletos  Cantidad de Comida  Monto Total 
xxxxxxxxxxxx         99                    99                $9999.99 
. . .              . . .                 . . .               . . . 
% de turistas que contrataron excursión con comida: 99.99%
}

type
    st3=string[3];

    st15=string[15];
    TR1=record
        cod:st3;
        pbase,pcomida:real;
        descr:st15;
    end;
    TA1=file of TR1;

    TR2=record  
        cod:st3;
        num:word;
        SoN:char;
    end;
    TA2=file of TR2;

    TV=array[1..50] of st3;//indice de codigos

procedure tabla(var A1:TA1;var vec:TV);
var
    i:byte;
    R:TR1;
begin
    reset(A1);
    i:=0;
    while not eof(A1) do
    begin
        i:=i+1;
        read(A1,R);
        vec[i]:=r.cod
    end;
    close(A1);
end;

function buscaCod(vec:TV;cod:st3):byte;
var
    i:byte;
begin
    i:=1;
    while vec[i]<>cod do
        i:=i+1;
    buscaCod:=i;
end;

procedure listar(var A1:TA1;var A2:TA2;vec:TV);
var
    R1:TR1;
    R2:TR2;
    cod:st3;
    cBoletos,cComida,cTot:byte;
    porc,monto:real;
begin
    reset(A1);reset(A2);
    porc:=0;cTot:=0;
    read(A2,R2);
    writeln('Excursion  cBoletos  cComida   monto');
    while not Eof(A2)  do
    begin
        cBoletos:=0;cComida:=0;monto:=0;
        cod:=R2.cod;
        seek(A1,buscaCod(vec,R2.cod)-1);
        read(A1,R1);
        while (cod=R2.cod) do
        begin
            cBoletos:=cBoletos+1;
            monto:=monto+R1.pbase;
            if R2.SoN='S' then 
            begin
                cComida:=cComida+1;
                monto:=monto+R1.pcomida;
            end;
            Writeln(R2.num);
            read(A2,R2);
        end;
        cTot:=cTot+cBoletos;
        porc:=porc+cComida;
        writeln(R1.descr,'  ',cBoletos,'    ',cComida,'        ',monto:4:2);
    end;
    porc:=(porc/cTot)*100;
    writeln('porcentaje de comida: ',porc:4:2);
    close(A1);close(A2);    
end;

var
    A1:TA1;
    A2:TA2;
    vec:TV;
    i:byte;
begin
    assign(A1,'CODIGOS.DAT');
    assign(A2,'BOLETERIA.DAT');
    tabla(A1,vec);
    listar(A1,A2,vec);

end.