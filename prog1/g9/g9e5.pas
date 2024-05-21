program g9e5;

type
    TR1=record
        matricula:integer;
        mat,fis,qui:byte;//(real)
    end;
    TA1=file of TR1;
    TV=array[1..50] of integer;

    TR2=record  
        matricula:integer;
        q2,f2:boolean;
    end;
    TA2=file of TR2;

{Obtener un listado con la matrícula de aquellos alumnos inscriptos que no cumplan con los requisitos
de equivalencia  exigidos,  que  son:  para  FISICA  II,  tener  aprobados  MATEMATICA  y  FISICA  I,  
y  para QUIMICA II, tener aprobado QUIMICA I. (se aprueba con NOTA >=4)}

procedure listarAlumnos(var A1:TA1;var V:TV;var n:byte);//guarda las matriculas en un vector V
var
    R:TR1;
begin
    n:=0;
    reset(A1);
    read(A1,R);
    while (R.matricula<>111) do
    begin
        n:=n+1;
        V[n]:=R.matricula;
        read(A1,R);
    end;
    close(A1);
end;

function busca(V:TV;matricula:integer):byte;
var
    i:byte;
begin
    i:=0;
    while V[i]<>matricula do
        i:=i+1;
    busca:=i;
end;

{para  FISICA  II,  tener  aprobados  MATEMATICA  y  FISICA  I,  
 para QUIMICA II, tener aprobado QUIMICA I. (se aprueba con NOTA >=4)}
procedure listado(var A1:TA1; var A2:TA2;var V:TV);
var
    R1:TR1;
    R2:TR2;

begin
    reset(A1);reset(A2);
    read(A2,R2);
    writeln('   Rechazados');
    while R2.matricula<>111 do
    begin
        seek(A1,busca(V,R2.matricula)-1);
        read(A1,R1);
        if ((R2.f2) and (R1.mat<4) and (R1.fis<4)) or ((R2.q2) and (R1.qui<4)) then
            writeln('      ',R2.matricula);
        read(A2,R2);
    end;
    Close(A1);close(A2);
end;


var
    A1:TA1;
    A2:TA2;
    V:TV;
    n:byte;
begin
    assign(A1,'ALUMNOS.DAT');
    assign(A2,'INSCRIPTOS.DAT');
    listarAlumnos(A1,V,n);
    listado(A1,A2,V);
end.