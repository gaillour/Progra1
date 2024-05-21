program g9e4;

type 
    st4=string[4];
    TR=record
        cod:st4;
        color,cant:byte;
        precio:real;
        talle:char;
    end;
    TA1=file of TR;

procedure listar(var A1:TA1);
var
    R:TR;
    precio,pNegros:real;
    ctot:byte;
    codAct:st4;
begin
    reset(A1);
    read(A1,R);
    pNegros:=0;ctot:=0;
    while (R.cod<>'ZZZZ' )and not eof(A1) do
    begin
        codAct:=R.cod;
        writeln('Cod: ',R.cod);
        WriteLn('Talle Cant Precio');
        while R.cod=codAct do
        begin
            writeln(R.talle,'       ',R.cant,'  ',r.precio:4:2);
            ctot:=ctot+R.cant;
            if R.color=1 then pNegros:=pNegros+R.cant;    
            read(A1,R);        
        end;
    end;
    writeln('Cant total: ',ctot);
    writeln('porcentaje de prendas negras: ', ((pNegros/ctot)*100):4:2);
end;

var
    A1:TA1;

begin
    assign(A1,'STOCK.DAT');
    listar(A1);
end.