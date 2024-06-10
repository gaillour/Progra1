program e8;

{Dados  dos  archivos,  el  primero  Datos  contiene  información  sobre  alumnos  y  el  segundo Examenes contiene
información sobre las materias aprobadas por los alumnos (hay más de un registro por alumno). 
Se pide enfrentarlos y obtener un tercer archivo Alumnos que agrupe la información total de cada alumno.

archivo Datos 
# matricula (campo de secuencia, clave primaria)      
# apellido                     
# fecha (de ingreso) 

archivo Examenes
# matricula (campo de secuencia, clave secundaria)
# materia
# nota
}

type
    st3=string[3];
    st10=string[10];
    TR=record
        materia:st10;
        nota:byte;
    end;
    TVR=array[1..10] of TR;
    TR1=record
        matricula:st3;
        apellido,fecha:st10;
    end;
    TR2=record  
        matricula:st3;
        R:TR;//materia y nota
    end;
    TR3=record
        R1:TR1;
        cant:byte;
        Vm:TVR;
    end;
    TA1=file of TR1;
    TA2=file of TR2;
    TA3=file of TR3;

procedure escribirDatos(var A1:TA1);
var
    R1:TR1;
    arch:text;
    blanco:char;
begin
    Rewrite(A1);
    assign(arch,'Datos.TXT'); reset(arch);
    readln(arch, R1.matricula,blanco,R1.apellido,R1.fecha);
    while not eof(Arch) do
    begin
        write(A1,R1);
        with R1 do
            readln(arch, R1.matricula,blanco,R1.apellido,R1.fecha);
    end;
    close(A1);
    close(arch);
end;

procedure escribirExamenes(var A2:TA2);
var
    R2:TR2;
    arch:text;
    blanco:char;
begin
    Rewrite(A2);
    assign(arch,'Examenes.TXT'); reset(arch);
    readln(arch, R2.matricula,blanco,R2.R.materia,R2.R.nota);
    while not eof(Arch) do
    begin
        write(A2,R2);
        with R2 do
            readln(arch, R2.matricula,blanco,R2.R.materia,R2.R.nota);
    end;
    close(A2);
    close(arch);
end;

procedure enfrentar(var A1:TA1;var A2:TA2;var A3:TA3);
var
    R1:TR1;
    R2:TR2;
    R3:TR3;
    i:byte;

begin
    read(A1,R1);read(A2,R2);Rewrite(A3);
    while (not eof(A1)) or (not eof(A2)) do
    begin
        if R1.matricula>R2.matricula then
            read(A2,R2)
        else 
        begin
            if R1.matricula<R2.matricula then
            begin
                R3.R1:=R1;
                R3.cant:=0;
                writeln(R3.R1.matricula);
                for i:=1 to R3.cant do writeln(R3.Vm[i].materia,' ',R3.Vm[i].nota);
                write(A3,R3);
                Read(A1,R1);
            end
            else
            begin   //=
                R3.cant:=0;
                while R1.matricula=R2.matricula do
                begin
                    R3.cant:=R3.cant+1;
                    R3.Vm[R3.cant]:=R2.R;
                    read(A2,R2);
                end;
                R3.R1:=R1;
                writeln(R3.R1.matricula);
                for i:=1 to R3.cant do writeln(R3.Vm[i].materia,' ',R3.Vm[i].nota);
                write(A3,R3);read(A1,R1);
            end;
        end;
    end;
    close(A1);close(A2);close(A3);
end;

var
    A1:TA1;
    A2:TA2;
    A3:TA3;
begin
    assign(A1,'DATOS.DAT');assign(A2,'EXAMENES.DAT');
    {escribirDatos(A1);
    escribirExamenes(A2);}
    assign(A3,'ALUMNOS.DAT');Rewrite(A3);
    reset(A1);reset(A2);
    enfrentar(A1,A2,A3);
    

end.