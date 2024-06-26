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
    tv=array[1..50] of st15;
    TR3=record
        descr:st15;
        cant:byte;    
    end;
    tv3=array[1..50] of TR3;
    

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

{
a) El peso promedio de los paquetes. 
b) Total del monto asegurado de la carga a transportar. 
c) Al finalizar el proceso armar el siguiente listado:
Destino             Cantidad de Paquetes 
Xxxxxxxxxxxxxxxx           99 
. . .                    . . . 
TOTAL                      99
}

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

procedure armardescripciones(var A2:TA2;var vec:tv;var n:byte);
var
    i:byte;
    r:TR2;
begin
    reset(A2);n:=0;
    while not Eof(A2) do
    begin
        read(A2,R);
        vec[R.cDest]:=r.descr;
        if r.cDest>n then n:=r.cDest
    end;
    close(A2);    
end;
procedure listado(var Vlista:tv3;var A1:TA1;vDesc:tv;var m:byte);
var
    R:TR1;
    i:byte;

begin
    reset(A1);
    m:=0;
    while not eof(A1) do
    begin
        read(A1,R);
        i:=r.cDest;
        Vlista[i].cant:=Vlista[i].cant+1;
        Vlista[i].descr:=vDesc[i];
        if i>m then m:=i
    end;
    Close(A1);
end;

procedure inicializar(var Vlista:tv3);
var
    i:byte;
begin
    for i:=1 to Length(Vlista) do
        Vlista[i].cant:=0
end;


var
    A1:TA1;
    A2:TA2;
    prom:real;
    vDesc:tv;
    n,m,i:byte;
    Vlista:tv3;
begin
    assign(A2,'DESTINO.DAT');
    escribirA2(A2);
    assign(A1,'PAQUETES.DAT');
    escribirA1(A1);
    promedio(A1,prom);
    writeln('a)peso promedio: ',prom:4:2);
    writeln;
    armardescripciones(A2,vDesc,n);
    inicializar(Vlista);
    listado(vlista,A1,vDesc,m);
    writeln('c)');
    for i:=1 to m do
        writeln(Vlista[i].descr,' ',Vlista[i].cant);
end.