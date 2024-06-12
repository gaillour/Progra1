program p2023;

const
    MAX=20;
type
    st8=string[8];
    st20=string[20];    
    TRCA=record
        cod:byte;
        fecha:st8;
        vendidas:word;
    end;
    TRPI=record
        cod:byte;
        nom:st20;
        cantvueltas:byte;
    end;
    TRCI=record
        cod:byte;
        ciudad:st20;
        capacidad:word;
    end;
    TACA=file of TRCA;
    TAPI=file of TRPI;
    TACI=file of TRCI;
    TV=array[1..MAX] of TRCI;
    //b)
    TVN=array[1..6] of string;
    TVE=array[1..6] of byte;

const   
    VN:TVN=('juan','tomas','agustin','fads','zimbaue','aabbc');
    VE:TVE=(20,43,50,10,8,90);

procedure listarCI(var ACI:TACI;var V:TV);//guarda v[i]=(nombre,capacidad), i=cod circuito
var
    R:TRCI;    
begin
    reset(ACI);
    read(ACI,R);
    while not eof(ACI) do
    begin
        V[R.cod]:=R;
        read(ACI,R);
    end;
    V[R.cod]:=R;
    close(ACI);
end;

procedure mostrar(var ACA:TACA;var API:TAPI;V:TV);
var
    RC:TRCA;
    RP:TRPI;
    circuitomax,codAct,cantpilotos:byte;
    maxEntradas:word;
begin
    reset(ACA);Reset(API);
    read(ACA,RC);read(API,RP);
    maxEntradas:=0;
    while (not eof(ACA)) or (not eof(API)) do
    begin
        cantpilotos:=0;
        if (RC.cod=RP.cod)  then
        begin
            writeln('COD NOMCIUDAD    CANTPILOTOS %ENTRADAS');
            while (RC.cod=RP.cod) do
            begin
                cantpilotos:=cantpilotos+1;
                read(API,RP);
            end;
            if RC.vendidas>maxEntradas then
            begin
                maxEntradas:=RC.vendidas;
                circuitomax:=RC.cod;
            end;
            writeln(Rc.cod,' ',V[Rc.cod].ciudad,cantpilotos,'       ',((RC.vendidas/V[RC.cod].capacidad)*100):4:2,'%');
            read(ACA,RC);
        end
        else 
        begin
            if RC.cod<RP.cod then
                read(ACA,RC)
            else read(API,RP);
        end;
    end;
    writeln('Circuito con mayor cantidad de entradas vendidas: ', circuitomax);
    close(ACA);close(API);
end;


//b) burbujeo y en el cambio de orden cambio tambien VE
procedure ordenar(var VE:TVE;var VN:TVN);
var
    tope,i,k,auxE:byte;
    auxN:string;
begin
    tope:=Length(VE);//N
    repeat  
        k:=0;
        for i:=1 to tope-1 do
        begin
            if VN[i]>VN[i+1] then
            begin
                k:=i;
                auxN:=VN[i];VN[i]:=VN[i+1];VN[i+1]:=auxN;
                auxE:=VE[i];VE[i]:=VE[i+1];VE[i+1]:=auxE;
            end;
        end;
        tope:=k;      
    until K<=1;
end;


var
    ACA:TACA;
    API:TAPI;
    ACI:TACI;
    V:TV;
    i:byte;
begin
    assign(ACA,'CIRCULAR.DAT');assign(API,'PILOTOS.DAT');assign(ACI,'CIRCUITOS.DAT');
    listarCI(ACI,V);
    mostrar(ACA,API,V);

    ordenar(VE,VN);
    for i:=1 to Length(VN) do
    begin
        writeln(VN[i],' ',VE[i]);
    end;
end.