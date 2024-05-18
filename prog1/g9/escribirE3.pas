program escribirE3;

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

procedure leer1(var A1:TA1);
var
    R:TR1;
    arch:text;
begin
    rewrite(A1);
    assign(arch,'CODIGOS.TXT'); reset(arch);
    readln(arch,R.cod,r.pbase,r.pcomida,r.descr);
    while not eof(arch) do
    begin
        write(A1,R);
        readln(arch,R.cod,r.pbase,r.pcomida,r.descr);
    end;
    close(arch);
end;

procedure leer2(var A2:TA2);
var
    R:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'BOLETERIA.TXT'); reset(arch);
    readln(Arch,r.cod,r.num,blanco,r.SoN);
    while not eof(arch) do
    begin
        write(A2,R);
        readln(Arch,r.cod,r.num,blanco,r.SoN);        
    end;
    close(arch);    
end;

var
    A1:TA1;
    A2:TA2;
begin
    assign(A1,'CODIGOS.DAT');
    leer1(A1);
    assign(A2,'BOLETERIA.DAT');
    leer2(A2);
end.