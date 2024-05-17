program e21;

{Un archivo contiene información sobre el rendimiento académico de un grupo de alumnos. 
En cada línea se tiene : 
•  Matrícula (numérica de 4 dígitos) 
•  Apellido y nombre (sin blancos intermedios) 
•  Promedio  (numérico) 
•  Historia académica 
El diseño de la línea, cuya longitud no se conoce y puede exceder los 255 caracteres, es el 
siguiente: 
 
9999       xxxxxxxxxxxx        99.99     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx<eoln> 
Tampoco se conoce la cantidad de blancos que se encuentran separando cada dato.   
Se pide procesarlo, listando los Apellidos y nombres de los alumnos con promedio mayor a 8 y al 
final del proceso informar la matrícula correspondiente al promedio mas alto}

var 
    arch:text;
    matricula,maxmat:string[4];
    c1,c2:char;
    alumno:String;
    promedio,maxprom:real;

begin
    assign(arch,'matriculas.txt'); reset(arch); 
    maxprom:=0;
    while not eof(arch) do
    begin
        alumno:=''; 
        read(arch,matricula);
        repeat
            read(arch,c1);
        until c1<>' ';
        while c1<>' ' do
        begin
            alumno:=alumno+c1;
            read(arch,c1);
        end;
        readln(Arch,promedio);
        if promedio>8 then  writeln('alumno con promedio mayor a 8: ',alumno)
        else writeln('alumno con promedio menor o igual a 8: ',alumno);
        if promedio>maxprom then
        begin
            maxprom:=promedio;
            maxmat:=matricula;
        end;
    end;  
    WriteLn('la matricula de mayor promedio fue: ', maxmat);


    close(arch);

end.