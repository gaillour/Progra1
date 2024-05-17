program g2e4;
var
  dia1,mes1,anio1, dia2,mes2,anio2, mayor:integer;
  valido: boolean;


begin
  valido :=true;
  writeln('fecha1 (dd/mm/aaaa)');
  readln(dia1, mes1, anio1);
  writeln('fecha1: ', dia1, '/', mes1, '/', anio1);
  writeln('fecha2(dd/mm/aaaa)');
  readln(dia2,mes2,anio2);
  writeln('fecha2: ', dia2, '/', mes2, '/', anio2);
  if (dia1 or dia2) > 31 then
     begin
     writeln('dia invalido');
     valido:=false
     end;
  if (mes1 >12) or (mes2 > 12) then
     begin
     writeln('mes invalido');
     valido:=false;
     end;
  if valido= true then
     if anio1 > anio2 then
        mayor := 2
     else
        mayor := 1
     else if anio1 = anio2 then
        if mes1 > mes2 then
           mayor := 2
        else
           mayor := 1
        else if mes1 = mes2 then
           if dia1 > dia2 then
              mayor:=2
           else
              mayor:=1;
  if valido=true then
     begin
     write('fecha1: ');
     case mes1 of
          1..3:writeln('1er cuatrimestre');
          4..6:writeln('2do cuatrimestre');
          7..9:writeln('3er cuatrimestre');
          10..12:writeln('4to cuatrimestre');
     end;
     write('fecha2: ');
     case mes2 of
          1..3:writeln('1er cuatrimestre');
          4..6:writeln('2do cuatrimestre');
          7..9:writeln('3er cuatrimestre');
          10..12:writeln('4to cuatrimestre');
     end;
     if mayor = 1 then
        writeln('fecha 1 mas antigua')
     else
        writeln('fecha 2 mas antigua');
     end;
  readln;
end.

