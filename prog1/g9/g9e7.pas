program g9e7;

type
    st3=string[3];
    st4=string[4];
    st25=String[25];
    TR1=record
        cod:st4;
        zona:byte;
        capacidad:word;
    end;
    TR2=record
        cod:st4;
        pel:st3;
        loc:word;
    end;
    TR3=record
        cod:st3;//de peliculas
        descr:st25;
        duracion:word;
    end;
    TA1=file of TR1;
    TA2=file of TR2;
    TV=array[1..40] of TR3;
    TVW=array[1..10] of word;//localidades por zona

procedure leer1(var A1:TA1);
var
    R:TR1;
    arch:text;
begin
    rewrite(A1);
    assign(arch,'CINES.TXT'); reset(arch);
    readln(Arch,R.cod,R.zona,R.capacidad);
    while not eof(arch) do
    begin
        write(A1,R);
        readln(Arch,R.cod,R.zona,R.capacidad);
    end;
    write(A1,R);
    close(A1);
    close(arch);
end;
procedure leer2(var A2:TA2);
var
    R2:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'LOCALIDADES.TXT'); reset(arch);
    readln(arch, R2.cod,blanco,R2.pel,R2.loc);
    while not eof(Arch) do
    begin
        write(A2,R2);
        with R2 do
            readln(arch, R2.cod,blanco,R2.pel,R2.loc);
    end;
    write(A2,R2);
    close(A2);
    close(arch);
end;

procedure listarPeliculas(var V:TV);
var
    arch:text;
    R:TR3;
    i:byte;
    blanco:char;
begin
    assign(arch,'PELICULAS.TXT'); reset(arch);
    readln(arch,R.cod,blanco,R.descr,R.duracion);
    i:=0;
    while not eof(arch) do
    begin
        i:=i+1;
        V[i]:=R;
        readln(arch,R.cod,blanco,R.descr,R.duracion);
    end;
    V[i]:=R;
    close(arch);
end;

function busca(V:TV;P:st3):TR3;
var
    i:byte;
begin
    i:=1;
    while V[i].cod<>P do
        i:=i+1;
    busca:=V[i];
end;
procedure inicializar(var V:TVW);
var
    i:Byte;
begin
    for i:=1 to 10  do
    begin
        V[i]:=0;
    end;
end;

procedure listar(var A1:TA1;var A2:TA2;V:TV);
var
    csinf,cpel,cfunc,cfuncMismaPel,i:byte;
    cloc:word;
    min,prom,ocup:real;
    Pact,Pmin:st3;
    R1:TR1;
    R2:TR2;
    R3:TR3;
    Vzona:TVW;
begin
    read(A1,R1);read(A2,R2);
    min:=30000;CsinF:=0;
    inicializar(Vzona);
    while not eof(A1) do
    begin
        writeln('Cine CPeliculas Cfunciones  Loc  %OcupPromedio');
        cfunc:=0;cpel:=0;cloc:=0;Pact:='';cfuncMismaPel:=0;
        while R1.cod=R2.cod do
        begin
            cfunc:=cfunc+1;
            cloc:=cloc+R2.loc;
            cfuncMismaPel:=cfuncMismaPel+1;
            if Pact<>R2.pel then
            begin
                cpel:=cpel+1;
                prom:=((cfuncMismaPel/cloc))*100;
                cfuncMismaPel:=0;
                if prom<min then
                begin
                    min:=prom;
                    Pmin:=R2.pel;
                end;
                Pact:=R2.pel;
            end;
            read(A2,R2);
        end;
        ocup:=(cloc/R1.capacidad)*100;
        writeln(R1.cod,'     ',cpel,'       ',cfunc,'         ',cloc,'    ',ocup:4:2);
        Vzona[R1.zona]:=Vzona[R1.zona]+cloc;
        if cfunc=0 then csinf:=csinf+1;
        read(A1,R1);
    end;
    writeln('Cantidad de cines que no proyectaron ninguna pelicula: ',csinf);
    writeln(Pmin);
    R3:=busca(V,Pmin);
    writeln('Pelicula con menor promedio: ',R3.descr,'(',R3.duracion,')');
    writeln('Total de localidades vendidas por zona');
    for i:=1 to 10 do
        writeln(i,': ',Vzona[i]);
end;

var
    A1:TA1;
    A2:TA2;
    V:TV;
    i:byte;
begin
    assign(A1,'CINES.DAT');
    assign(A2,'LOCALIDADES.DAT');
{    leer1(A1);
    leer2(A2);}
    listarPeliculas(V);
    reset(A1);reset(A2);

    listar(A1,A2,V);


end.