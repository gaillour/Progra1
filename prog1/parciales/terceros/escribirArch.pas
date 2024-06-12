program escribirArch;

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

procedure escribirCA(var ACA:TACA);
var
    RCA:TRCA;
    arch:text;
    blanco:char;
begin
    Rewrite(ACA);
    assign(arch,'CIRCULAR.TXT'); reset(arch);
    readln(arch, RCA.cod,blanco,RCA.fecha,RCA.vendidas);
    while not eof(Arch) do
    begin
        write(ACA,RCA);
        readln(arch, RCA.cod,blanco,RCA.fecha,RCA.vendidas);
    end;
    write(ACA,RCA);
    close(ACA);
    close(arch);
end;

procedure escribirPI(var API:TAPI);
var
    RPI:TRPI;
    arch:text;
    blanco:char;
begin
    Rewrite(API);
    assign(arch,'PILOTOS.TXT'); reset(arch);
    readln(arch, RPI.cod,blanco,RPI.nom,RPI.cantvueltas);
    while not eof(Arch) do
    begin
        write(API,RPI);
        with RPI do
            readln(arch, RPI.cod,blanco,RPI.nom,RPI.cantvueltas);
    end;
    write(API,RPI);
    close(API);
    close(arch);
end;

procedure escribirCI(var ACI:TACI);
var
    RCI:TRCI;
    arch:text;
    blanco:char;
begin
    Rewrite(ACI);
    assign(arch,'CIRCUITOS.TXT'); reset(arch);
    readln(arch, RCI.cod,blanco,RCI.ciudad,RCI.capacidad);
    while not eof(Arch) do
    begin
        write(ACI,RCI);
        readln(arch, RCI.cod,blanco,RCI.ciudad,RCI.capacidad);
    end;
    write(ACI,RCI);
    close(ACI);
    close(arch);
end;

var
    ACA:TACA;
    API:TAPI;
    ACI:TACI;
begin
    assign(ACA,'CIRCULAR.DAT');assign(API,'PILOTOS.DAT');assign(ACI,'CIRCUITOS.DAT');
    escribirCA(ACA);
    escribirPI(API);
    escribirCI(ACI);
end.