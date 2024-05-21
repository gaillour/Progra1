program escribirE5;

type
    TR1=record
        matricula:integer;
        mat,fis,qui:byte;
    end;
    TA1=file of TR1;

    TR2=record  
        matricula:integer;
        q2,f2:boolean;
    end;
    TA2=file of TR2;

procedure leer1(var A1:TA1);
var
    R:TR1;
    arch:text;
begin
    assign(arch,'ALUMNOS.txt'); reset(arch);
    rewrite(A1);
    while not eof(arch) do
    begin
        readln(arch,R.matricula,R.mat,R.fis,R.qui);
        write(A1,R);
    end;
    close(arch);
    close(A1);
end;

procedure leer2(var A2:TA2);
var
    R:TR2;
    arch:text;
    q,f:byte;
begin
    assign(arch,'INSCRIPTOS.TXT'); reset(arch);
    rewrite(A2);
    while not eof(arch) do
    begin
        readln(arch,R.matricula,q,f);
        R.q2:= q=1;
        R.f2:= f=1;
        write(A2,R);
    end;    
    close(arch);
    close(A2);
end;


var
    A1:TA1;
    A2:TA2;
begin
    assign(A1,'ALUMNOS.DAT');
    leer1(A1);
    assign(A2,'INSCRIPTOS.DAT');
    leer2(A2);
end.
