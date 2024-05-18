program g9e2;

{Un Banco registra en TARJETAS.DAT el movimiento de las tarjetas de crédito de sus usuarios. 
    # NUMERO de TARJETA (1er campo de secuencia, clave primaria) 
    # NOMBRE del PROPIETARIO 
    # TOPE 
    # GASTO del MES (hasta el momento) 
Además, se van ingresando (desde teclado ó archivo de texto) las compras con los siguientes datos: 
- Número de Tarjeta (puede repetirse) 
- Monto  
- Código de operación 
Procesar los datos, actualizando los gastos del mes, siempre que no supere el monto tope, en caso 
contrario, rechazarlo y grabar en un archivo RECHAZADOS.DAT con la siguiente información: 
    # NUMERO de TARJETA
    # CODIGO DE OPERACION
    # MONTO

Sugerencia: para obtener la dirección relativa y acceder en forma directa al archivo TARJETAS, 
descargar del mismo los números de tarjeta sobre un arreglo (tabla)}

type
    st10=string[10];
    TR1=record
        num:word;
        nombre:st10;
        gasto,tope:real;
    end;
    TA1=file of TR1;
    tv=array[1..30] of TR1;

    TR2=record
        num:word;
        codigo:st10;
        monto:real;
    end;
    TA2=file of TR2;

procedure leerA1(var A1:TA1;var tarjetas:tv;var n:byte);
var
    R:TR1;
    arch:text;
begin
    assign(arch,'TARJETAS.txt'); reset(arch);
    rewrite(A1);n:=0;
    while not eof(arch) do
    begin
        Read(arch,R.num,R.nombre,R.tope,R.gasto);
        write(A1,R);
        n:=n+1;
        tarjetas[n]:=R;
    end;
    close(arch);
    close(A1);
end;


function busca(tarjetas:tv;num:word):byte;
var
    i:byte;

begin
    i:=0;
    while tarjetas[i].num<>num do
        i:=i+1;
    busca:=i;
end;

procedure rechazos(var A2:TA2;var tarjetas:tv);
var
    R2:TR2;
    arch:Text;
    i:byte;

begin 
    Rewrite(A2);
    assign(arch,'COMPRAS.TXT'); reset(arch);
    readln(arch,R2.num,R2.monto,R2.codigo);
    while not eof(arch) do
    begin
        i:=busca(tarjetas,R2.num);
        if (tarjetas[i].gasto+R2.monto)<=tarjetas[i].tope then
            tarjetas[i].gasto:=tarjetas[i].gasto+R2.monto
        else write(A2,R2);     
        readln(arch,R2.num,R2.monto,R2.codigo);
    end;
    close(arch);
    close(A2);
end;

procedure mostrarA2(var A2:TA2);
var
    R2:TR2;
begin
    Reset(A2);
    while not eof(A2) do 
    begin
        read(A2,R2);
        with R2 do 
        begin
            writeln(num,' ',codigo,' ',monto:4:2)
        end;
    end;
end;

var
    A1:TA1;
    A2:TA2;
    tarjetas:tv;
    i,n:byte;
begin
    assign(A1,'TARJETAS.DAT'); 
    leerA1(A1,tarjetas,n);
    assign(A2,'RECHAZADOS.DAT');
    rechazos(A2,tarjetas);
    mostrarA2(A2);
end.