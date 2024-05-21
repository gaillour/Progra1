program g9e5;

type
    TR1=record
        matricula:integer;
        mat,fis,qui:byte;
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

procedure listado();
var
begin
   
end;


var
    A1:TA1;
    A2:TA2;
    V:TV;
    i,n:byte;

begin
    assign(A1,'ALUMNOS.DAT');
    assign(A2,'INSCRIPTOS.DAT');
    listarAlumnos(A1,V,n);

end.