program g3e6;

{Se conoce el saldo inicial de una cuenta bancaria y una serie de movimientos realizados, por cada 
uno: 
  - código de movimiento (D=depósito, R=retiro ó F= fin de datos).  
 - monto 
Escribir  un  programa  que  ingrese  dichos  datos  y  determine  el  saldo  exacto  de 
la  cuenta  después  de  procesar  las  transacciones.  Al  final  del  proceso  indique 
cuantas  veces  no  pudo  retirar  dinero  por  insuficiencia de fondos}

var 
    arch:text;
    i,cant:Byte;
    mov:char;
    mtotal,monto:integer;


begin
    assign(arch,'banco.txt');
    Reset(arch);
    readln(arch,mtotal);
    cant:=0;
    repeat
        readln(arch, mov, monto);
        mov:=upcase(mov);
        if mov='D' then
            mtotal:=mtotal+monto
        else if mov='R' then
        begin
            if mtotal-monto>=0 then
                mtotal:=mtotal-monto
            else cant:=cant+1;
        end
        else if mov<>'F' then
            mov:='F'
    until (upcase(mov)='F') or (eof(arch));

    writeln('el monto total es: ',mtotal,' y la cantidad de veces q retiro s/fondos: ',cant);

end.