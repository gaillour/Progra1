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

    TV=array[1..50] of st4;

    TR2=record
        legajo,factura:st4;
        imp:real;
    end;
    TA2=file of TR2;

procedure listarLegajo(var A1:TA1;var V:TV;var n:byte);
var
    R:TR1;
begin
    reset(A1);
    n:=0;
    read(A1,R);
    while R.legajo<>'ZZZZ' do
    begin
        n:=n+1;
        V[n]:=R.legajo;
        read(A1,R);
    end;
    close(A1);     
end;

function busca(V:TV;legajo:st4):byte;
var
    i:byte;
begin
    i:=1;
    while V[i]<>legajo do i:=i+1;
    busca:=i;
end;

{comisión  del  0.5%  sobre  las  ventas  efectuadas}
procedure actualizar(var A1:TA1;var A2:TA2);
var
    R1:TR1;
    R2:TR2;
begin
    {1483 Juan Pérez       tot=5000 F001 1200=max
     1483                           F016 900=imp}
    reset(A2);
    read(A2,R2);
    while R2.legajo<>'ZZZZ' do
    begin
        seek(A1,busca(V,R2.legajo));
          
    end;   

    
end;

var
    A1:TA1;
    A2:TA2;
    V:TV;
begin
    listarLegajo(A1,TV);


end.