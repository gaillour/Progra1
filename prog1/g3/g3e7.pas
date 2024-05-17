program g3e7;

{Dado un conjunto de alumnos, no se sabe cuántos son, de cada uno de ellos se conoce: 
- Nombre      (‘***’ indica fin de datos) 
- Nota1, Nota2 y Nota3  
Ingresar la información e informar: 
a)  El promedio de cada alumno y su condición
    − ‘Aprobado’ si su promedio es mayor o igual a 4 
    − ‘Desaprobado’ si su promedio es menor a 4. 
b) Porcentaje de alumnos Aprobados
}

var
    arch:text;
    alumno:string[10];
    n1,n2,n3,promedio,paprobados:real;
    ctotal,caprobados:byte;

begin
    Assign(arch,'alumnos.txt');
    reset(arch);
    caprobados:=0;
    while not eof(arch) do
    begin
        readln(arch,alumno,n1,n2,n3);
        promedio:=(n1+n2+n3)/3;
        if promedio<4 then
            writeln('el promedio de ', alumno, ' es: ', promedio:4:2,' asi que desaprobo')
        else 
        begin
            writeln('el promedio de ', alumno, ' es: ', promedio:4:2,' asi que aprobo');
            caprobados:=caprobados+1;
        end;
        ctotal:=ctotal+1;
    end;
    paprobados:=(caprobados/ctotal)*100;
    writeln('el porcentaje de alumnos aprobados es: ', paprobados:4:2);    
    
end.